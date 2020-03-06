require "base64"

require "lib_ogr"

module OGR
  VERSION ="0.1.0"

  class BaseError < Exception
    getter error_no : Int32
    def initialize(@error_no, @message)
    end
  end
  
  {% begin %}
    {% error_map = {
       LibOGR::ERR_NOT_ENOUGH_DATA => "NotEnoughData",
       LibOGR::ERR_NOT_ENOUGH_MEMORY => "NotEnoughMemory",
       LibOGR::ERR_UNSUPPORTED_GEOMETRY_TYPE => "UnsupportedGeometryType",
       LibOGR::ERR_UNSUPPORTED_OPERATION => "UnsupportedOperation",
       LibOGR::ERR_CORRUPT_DATA => "CorruptData",
       LibOGR::ERR_FAILURE => "Failure",
       LibOGR::ERR_UNSUPPORTED_SRS => "UnsupportedSRS",
       LibOGR::ERR_INVALID_HANDLE => "InvalidHandle",
       LibOGR::ERR_NON_EXISTING_FEATURE => "NonExistingFeature",
     }
     %}
    {% for key, value in error_map %}
      class {{ value.id }} < BaseError; end
    {% end %}

    protected def self.map_exception(error_no : LibOGR::Err)
      case error_no
      when 0
        return error_no
        {% for key, value in error_map %}
      when {{key.id}}
        message = "{{ value.id.underscore.tr("_", " ") }}"
        raise {{value.id}}.new(error_no, message)
        {% end %}
      else
        raise "Unknown OGR error number: #{error_no}"
      end
    end
  {% end %}

  def self.exc_wrap_err(err : LibOGR::Err)
    map_exception(err)
  end
end
