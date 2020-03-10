require "lib_ogr"

module GDAL::OGR

  class BaseError < Exception
    getter error_no : Int32
    def initialize(@error_no, @message)
    end
  end
  
  {% begin %}
    {% error_map = {
       Lib::ERR_NOT_ENOUGH_DATA => "NotEnoughData",
       Lib::ERR_NOT_ENOUGH_MEMORY => "NotEnoughMemory",
       Lib::ERR_UNSUPPORTED_GEOMETRY_TYPE => "UnsupportedGeometryType",
       Lib::ERR_UNSUPPORTED_OPERATION => "UnsupportedOperation",
       Lib::ERR_CORRUPT_DATA => "CorruptData",
       Lib::ERR_FAILURE => "Failure",
       Lib::ERR_UNSUPPORTED_SRS => "UnsupportedSRS",
       Lib::ERR_INVALID_HANDLE => "InvalidHandle",
       Lib::ERR_NON_EXISTING_FEATURE => "NonExistingFeature",
     }
     %}
    {% for key, value in error_map %}
      class {{ value.id }} < BaseError; end
    {% end %}

    protected def self.map_exception(error_no : Lib::Err)
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

  def self.exc_wrap_err(err : Lib::Err)
    map_exception(err)
  end
end
