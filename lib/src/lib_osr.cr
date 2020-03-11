module GDAL::OSR
  @[Include("gdal/ogr_srs_api.h",
            prefix: %w(OSR_ OSR),
            import_docstrings: "brief",
           )]
  @[Link(ldflags: "`gdal-config --libs`")]
  lib Lib
  end
end
