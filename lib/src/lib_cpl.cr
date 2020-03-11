module GDAL::CPL
  @[Include("gdal/cpl_conv.h",
            prefix: %w(CPL_ CPL),
            import_docstrings: "brief",
           )]
  @[Include("gdal/cpl_vsi.h",
            prefix: %w(VSI_ VSI),
            import_docstrings: "brief",
           )]
  @[Include("gdal/cpl_string.h",
            prefix: %w(CSL),
            import_docstrings: "brief",
           )]
  @[Link(ldflags: "`gdal-config --libs`")]
  lib Lib
  end
end
