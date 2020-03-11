module GDAL::OGR
  @[Include("gdal/ogr_core.h",
            prefix: %w(OGR_ OGR),
            import_docstrings: "brief",
           )]
  @[Include("gdal/ogr_api.h",
            prefix: %w(OGR_ OGR),
            import_docstrings: "brief",
          )]
  @[Link(ldflags: "`gdal-config --libs`")]
  lib LibOGR
  end
end
