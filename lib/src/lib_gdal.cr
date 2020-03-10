@[Include("gdal/gdal.h",
          prefix: %w(GDAL_ GDAL),
          import_docstrings: "brief",
         )]
@[Link("gdal")]
lib LibGDAL
end
