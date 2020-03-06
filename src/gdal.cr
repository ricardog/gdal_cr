# TODO: Write documentation for `Gdal.cr`
require "lib_gdal"

require "semantic_version"

module GDAL
  VERSION = "0.1.0"

  def self.version
    {% if compare_versions(LibGDAL::VERSION, "2.1.0") >= 0 %}
      puts "GDAL version (%s) is newer (2.1.0)" % LibGDAL::VERSION
    {% end %}
    return SemanticVersion.parse(String.new(
                                  LibGDAL.version_info("RELEASE_NAME")))
  end

  def self.release_name
    return String.new(LibGDAL.version_info("RELEASE_NAME"))
  end

  def self.all_register
    LibGDAL.all_register
  end
end
