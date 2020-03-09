# TODO: Write documentation for `Gdal.cr`
require "semantic_version"

require "./gdal/*"
require "lib_gdal"


module GDAL
  VERSION = "0.1.0"

  def self.version
    return SemanticVersion.new(Lib::VERSION_MAJOR, Lib::VERSION_MINOR,
                               Lib::VERSION_REV)
  end

  def self.datadir
    return Lib::DATADIR
  end

  def self.all_register
    Lib.all_register
  end
end
