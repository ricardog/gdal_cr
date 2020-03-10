@[Include("gdal/cpl_conv.h",
          prefix: %w(CPL_ CPL),
          import_docstrings: "brief",
         )]
@[Include("gdal/cpl_vsi.h",
          prefix: %w(VSI_ VSI),
          import_docstrings: "brief",
         )]
@[Link("gdal")]
lib LibCPL
end
