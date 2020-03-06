
require "./cpl"
require "./gdal"
require "./ogr"

def main()      
  # TODO: Put your code here
  GDAL.all_register()
  puts GDAL.version
  puts String.new(LibGDAL.version_info("VERSION_NUM"))

  # Create a Point
  point = LibOGR.g_create_geometry(LibOGR::WkbGeometryType::WkbPoint)
  LibOGR.g_add_point(point, 1198054.34, 648493.09, 0.0)
  LibOGR.g_export_to_wkt(point, out point_wkt)
  puts String.new(point_wkt)
  LibCPL.free(point_wkt)

  # Create a Line
  line = LibOGR.g_create_geometry(LibOGR::WkbGeometryType::WkbLineString)
  LibOGR.g_add_point(line, 1116651.439379124, 637392.6969887456, 0)
  LibOGR.g_add_point(line, 1188804.0108498496, 652655.7409537067, 0)
  LibOGR.g_add_point(line, 1226730.3625203592, 634155.0816022386, 0)
  LibOGR.g_add_point(line, 1281307.30760719, 636467.6640211721, 0)
  LibOGR.g_export_to_wkt(line, out line_wkt)
  puts String.new(line_wkt)
  LibCPL.free(line_wkt)

  # Create a geometry from WKT
  wkt = "POINT (1120351.5712494177 741921.4223245403)"
  wkt_ptr2 = wkt.to_unsafe
  OGR.exc_wrap_err \
        LibOGR.g_create_from_wkt(pointerof(wkt_ptr2),
                                 Pointer(LibOGR::SpatialReferenceH).null,
                                 out geo2)
  LibOGR.g_export_to_wkt(geo2, out geo2_wkt)
  puts String.new(geo2_wkt)
  LibCPL.free(geo2_wkt)

  # Create a geometry from GeoJSON
  geojson = %({"type":"Point","coordinates":[108420.33,753808.59]})
  wkt_ptr2 = geojson.to_unsafe
  geo3 = CPL.exc_wrap_ptr(LibOGR.g_create_geometry_from_json(geojson))
  LibOGR.g_export_to_wkt(geo3, out geo3_wkt)
  puts String.new(geo3_wkt)
  LibCPL.free(geo3_wkt)

  # Create geometry from WKB
  wkb = Base64.decode("AIAAAAFBMkfmVwo9cUEjylouFHrhAAAAAAAAAAA")
  OGR.exc_wrap_err \
        LibOGR.g_create_from_wkb(wkb.to_unsafe,
                                 Pointer(LibOGR::SpatialReferenceH).null,
                                 out geo4, wkb.size)
  LibOGR.g_export_to_wkt(geo4, out geo4_wkt)
  puts String.new(geo4_wkt)
  LibCPL.free(geo4_wkt)

  # Write geometry to dataset
  wkt = "MULTIPOINT (1181866.263593049 615654.4222507705, " \
        "1205917.1207499576 623979.7189589312, " \
        "1227192.8790041457 643405.4112779726, " \
        "1224880.2965852122 665143.6860159477)"
  wkt_ptr2 = wkt.to_unsafe
  OGR.exc_wrap_err \
        LibOGR.g_create_from_wkt(pointerof(wkt_ptr2),
                                 Pointer(LibOGR::SpatialReferenceH).null,
                                 out multipoint)
  LibOGR.g_export_to_wkt(multipoint, out multipoint_wkt)
  puts String.new(multipoint_wkt)
  LibCPL.free(multipoint_wkt)
  driver = LibOGR.get_driver_by_name("GeoJSON")
  ds = CPL.exc_wrap_ptr(LibOGR.dr_create_data_source(driver, "test.geojson",
                                                     Pointer(LibC::Char*).null))
  layer = LibOGR.ds_create_layer(ds, "test.geojson",
                                 Pointer(Void).null,
                                 LibOGR::WkbGeometryType::WkbMultiPoint,
                                 Pointer(LibC::Char*).null)
  layer_defn = LibOGR.l_get_layer_defn(layer)
  feature = LibOGR.f_create(layer_defn)
  LibOGR.f_set_geometry(feature, multipoint)
  LibOGR.l_create_feature(layer, feature)
  LibOGR.release_data_source(ds)
  
  # Open dataset
  ds = LibGDAL.open("data/raster.tif", LibGDAL::Access::GaReadOnly)
  puts ds

  # Try to open non-existent dataset
  #CPL.use_exceptions(true)
  begin
    ds = CPL.exc_wrap_ptr(LibGDAL.open("data/foo.tif",
                                       LibGDAL::Access::GaReadOnly))
    #ds = try_open("data/foo.tif", LibGDAL::Access::GaReadOnly)
  rescue ex : CPL::BaseError
    puts "Error #{ex.error_no}: #{ex.etype.to_s}: #{ex.message}"
  end
  CPL.use_exceptions(false)

  # Print a list of supported formats
  puts "Supported formats:"
  LibGDAL::FORMATS.each do |fmt|
    puts "  #{fmt}"
  end

  # That's it folks!
  puts "done"
end


main()