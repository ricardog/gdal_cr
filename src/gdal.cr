# ## A very thin wrapper for the GDAL library
#
# This library provides a very thin wrapper for GDAL.  It does not
# provide any abstraction on top of the C API so you end up writing C
# code in crystal, i.e. you need to do all the memory management (see
# the GDAL API documentation for more info).
#
# The GDAL library error handling mechanism by default logs stuff to
# stdout.  You can silence these messages by setting
# GDAL::CPL.silence_failures to true (see sample.cr).  I also provide a
# couple of functions to wrap calls to GDAL that turn errors into
# exceptions.
#
# See sample.cr for a couple of use cases.
#
# TODO: The Libs are based on GDAL 2.2.3.  I plan to add support for
# versions 2.0 through 3.0+.  Not likely to support versions earlier
# than 2.0, i.e. 1.11.
#
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
