
require "lib_cpl"

module CPL
  VERSION = "0.1.0"

  class BaseError < Exception
    getter error_no : Int32
    getter etype : LibCPL::Err
    def initialize()
      @error_no = LibCPL.get_last_error_no()
      @etype = LibCPL.get_last_error_type()
      @message = String.new(LibCPL.get_last_error_msg())
    end

    def initialize(@error_no, @etype, @message); end
  end

  {% begin %}
    {% error_map = {
       LibCPL::E_APPDEFINED => "AppDefinedError",
       LibCPL::E_OUTOFMEMORY => "OutOfMemoryError",
       LibCPL::E_FILEIO => "FileIOError",
       LibCPL::E_OPENFAILED => "OpenFailedError",
       LibCPL::E_ILLEGALARG => "IllegalArgError",
       LibCPL::E_NOTSUPPORTED => "NotSupportedError",
       LibCPL::E_ASSERTIONFAILED => "AssertionFailedError",
       LibCPL::E_NOWRITEACCESS => "NoWriteAccessError",
       LibCPL::E_USERINTERRUPT => "UserInterruptError",
       LibCPL::E_OBJECTNULL => "ObjectNullError",

       # error numbers 11-16 are introduced in GDAL 2.1. See
       # https://github.com/OSGeo/gdal/pull/98.
       LibCPL::E_HTTPRESPONSE => "HTTPResponseError",
       LibCPL::E_AWSBUCKETNOTFOUND => "AWSBucketNotFoundError",
       LibCPL::E_AWSOBJECTNOTFOUND => "AWSObjectNotFoundError",
       LibCPL::E_AWSACCESSDENIED => "AWSAccessDeniedError",
       LibCPL::E_AWSINVALIDCREDENTIALS => "AWSInvalidCredentialsError",
       LibCPL::E_AWSSIGNATUREDOESNOTMATCH => "AWSSignatureDoesNotMatchError",
     }
     %}
    {% for key, value in error_map %}
      class {{ value.id }} < BaseError; end
    {% end %}

  protected def self.map_exception()
    map_exception(LibCPL.get_last_error_no(), LibCPL.get_last_error_type(),
                  LibCPL.get_last_error_msg())
  end

  protected def self.map_exception(error_no)
    map_exception(error_no, LibCPL.get_last_error_type(),
                  LibCPL.get_last_error_msg())
  end

  protected def self.map_exception(error_no : LibCPL::ErrorNum,
                                   etype : LibCPL::Err,
                                   msg : LibC::Char*)
    message = if msg.null?
                "No error message"
              else
                String.new(msg)
              end
    case etype
    when LibCPL::Err::CeFailure
      LibCPL.error_reset()
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
    when LibCPL::Err::CeWarning, LibCPL::Err::CeDebug
      raise "CeWarning or CeDebug error (#{message})"
    when LibCPL::Err::CeFatal
      raise "CeFatal error (#{message})"
    else
      raise "the wrapped function returned an error but no error message was set"
    end
  end
  {% end %}

  def self.exc_wrap_ptr(ptr : Pointer(Void))
    map_exception() if ptr.null?
    ptr
  end

  def exc_wrap_err(err : LibCPL::Err)
    map_exception(err) if err != LibCPL::Err::CeNone
    err
  end

  
  @@use_exceptions : Bool = false
  @@prev_error_handler : LibCPL::ErrorHandler?

  def self.use_exceptions(use_exceptions : Bool)
    return if use_exceptions == @@use_exceptions
    LibCPL.error_reset()
    @@use_exceptions = use_exceptions
    if use_exceptions
      @@prev_error_handler = LibCPL.set_error_handler ->(etype, code, msg) {
        if etype == LibCPL::Err::CeFatal
          prev = @@prev_error_handler.as(LibCPL::ErrorHandler)
          prev.call(etype, code, msg)
        elsif etype == LibCPL::Err::CeWarning || etype == LibCPL::Err::CeDebug
          prev = @@prev_error_handler.as(LibCPL::ErrorHandler)
          prev.call(etype, code, msg)
        else
          map_exception(code, etype, msg)
        end
      }
    else
      prev = @@prev_error_handler.as(LibCPL::ErrorHandler)
      LibCPL.set_error_handler(prev)
      @@prev_error_handler = nil
    end
  end
end
