
require "lib_cpl"

module CPL
  VERSION = "0.1.0"

  class BaseError < Exception
    getter error_no : Int32
    getter etype : Lib::Err
    def initialize()
      @error_no = Lib.get_last_error_no()
      @etype = Lib.get_last_error_type()
      @message = String.new(Lib.get_last_error_msg())
    end

    def initialize(@error_no, @etype, @message); end
  end

  {% begin %}
    {% error_map = {
       Lib::E_APPDEFINED => "AppDefinedError",
       Lib::E_OUTOFMEMORY => "OutOfMemoryError",
       Lib::E_FILEIO => "FileIOError",
       Lib::E_OPENFAILED => "OpenFailedError",
       Lib::E_ILLEGALARG => "IllegalArgError",
       Lib::E_NOTSUPPORTED => "NotSupportedError",
       Lib::E_ASSERTIONFAILED => "AssertionFailedError",
       Lib::E_NOWRITEACCESS => "NoWriteAccessError",
       Lib::E_USERINTERRUPT => "UserInterruptError",
       Lib::E_OBJECTNULL => "ObjectNullError",

       # error numbers 11-16 are introduced in GDAL 2.1. See
       # https://github.com/OSGeo/gdal/pull/98.
       Lib::E_HTTPRESPONSE => "HTTPResponseError",
       Lib::E_AWSBUCKETNOTFOUND => "AWSBucketNotFoundError",
       Lib::E_AWSOBJECTNOTFOUND => "AWSObjectNotFoundError",
       Lib::E_AWSACCESSDENIED => "AWSAccessDeniedError",
       Lib::E_AWSINVALIDCREDENTIALS => "AWSInvalidCredentialsError",
       Lib::E_AWSSIGNATUREDOESNOTMATCH => "AWSSignatureDoesNotMatchError",
     }
     %}
    {% for key, value in error_map %}
      class {{ value.id }} < BaseError; end
    {% end %}

  protected def self.map_exception()
    map_exception(Lib.get_last_error_no(), Lib.get_last_error_type(),
                  Lib.get_last_error_msg())
  end

  protected def self.map_exception(error_no)
    map_exception(error_no, Lib.get_last_error_type(),
                  Lib.get_last_error_msg())
  end

  protected def self.map_exception(error_no : Lib::ErrorNum,
                                   etype : Lib::Err,
                                   msg : LibC::Char*)
    message = if msg.null?
                "No error message"
              else
                String.new(msg)
              end
    case etype
    when Lib::Err::CeFailure
      Lib.error_reset()
      case error_no
      when 0
        raise "called to map exception but error_no == 0"
        {% for key, value in error_map %}
      when {{key.id}}
        raise {{value.id}}.new(error_no, etype, message)
        {% end %}
      else
        raise "Unknown CPL error number: #{error_no}"
      end
    when Lib::Err::CeWarning, Lib::Err::CeDebug
      raise "CeWarning or CeDebug error (#{message})"
    when Lib::Err::CeFatal
      raise "CeFatal error (#{message})"
    else
      raise "wrapped function returned an error but no error message was set"
    end
  end
  {% end %}

  def self.exc_wrap_ptr(ptr : Pointer(Void))
    map_exception() if ptr.null?
    ptr
  end

  def exc_wrap_err(err : Lib::Err)
    map_exception(err) if err != Lib::Err::CeNone
    err
  end

  
  @@use_exceptions : Bool = false
  @@prev_error_handler : Lib::ErrorHandler?

  def self.use_exceptions(use_exceptions : Bool)
    return if use_exceptions == @@use_exceptions
    Lib.error_reset()
    @@use_exceptions = use_exceptions
    if use_exceptions
      @@prev_error_handler = Lib.set_error_handler ->(etype, code, msg) {
        if etype == Lib::Err::CeFatal
          prev = @@prev_error_handler.as(Lib::ErrorHandler)
          prev.call(etype, code, msg)
        elsif etype == Lib::Err::CeWarning || etype == Lib::Err::CeDebug
          prev = @@prev_error_handler.as(Lib::ErrorHandler)
          prev.call(etype, code, msg)
        else
          map_exception(code, etype, msg)
        end
      }
    else
      prev = @@prev_error_handler.as(Lib::ErrorHandler)
      Lib.set_error_handler(prev)
      @@prev_error_handler = nil
    end
  end
end
