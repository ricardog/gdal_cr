# TODO: Write documentation for `Gdal.cr`
require "lib_gdal"

require "semantic_version"

module GDAL
  VERSION = "0.1.0"

  def self.version
    {% if compare_versions(Lib::VERSION, "2.1.0") >= 0 %}
      puts "GDAL version (%s) is newer (2.1.0)" % Lib::VERSION
    {% end %}
    return SemanticVersion.parse(String.new(
                                  Lib.version_info("RELEASE_NAME")))
  end

  def self.release_name
    return String.new(Lib.version_info("RELEASE_NAME"))
  end

  def self.all_register
    Lib.all_register
  end
end
