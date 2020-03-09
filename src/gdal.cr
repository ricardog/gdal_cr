# TODO: Write documentation for `Gdal.cr`
require "semantic_version"

require "./gdal/*"
require "lib_gdal"


module GDAL
  VERSION = "0.1.0"

  def self.version
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
