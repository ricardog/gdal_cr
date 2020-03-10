@[Include("gdal/ogr_srs_api.h",
          prefix: %w(OSR_ OSR),
          import_docstrings: "brief",
         )]
@[Link("gdal")]
lib LibOSR
end
