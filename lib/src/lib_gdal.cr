module GDAL
  @[Include("gdal/gdal.h",
            prefix: %w(GDAL_ GDAL),
            import_docstrings: "brief",
           )]
  @[Link(ldflags: "`gdal-config --libs`")]
  lib Lib
  end
end
