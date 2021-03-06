
require "./gdal_cr"

include GDAL

def main()      
  # TODO: Put your code here
  GDAL.all_register()
  puts "version: #{GDAL.version}"
  puts "datadir: #{GDAL.datadir}"
  puts String.new(GDAL::Lib.version_info("VERSION_NUM"))

  # Print a list of supported formats
  puts "Supported formats:"
  GDAL::Lib::FORMATS.each do |fmt|
    puts "  #{fmt}"
  end

  # Create a Point
  point = OGR::Lib.g_create_geometry(OGR::Lib::WkbGeometryType::WkbPoint)
  OGR::Lib.g_add_point(point, 1198054.34, 648493.09, 0.0)
  OGR::Lib.g_export_to_wkt(point, out point_wkt)
  puts String.new(point_wkt)
  CPL::Lib.free(point_wkt)

  # Create a Line
  line = OGR::Lib.g_create_geometry(OGR::Lib::WkbGeometryType::WkbLineString)
  OGR::Lib.g_add_point(line, 1116651.439379124, 637392.6969887456, 0)
  OGR::Lib.g_add_point(line, 1188804.0108498496, 652655.7409537067, 0)
  OGR::Lib.g_add_point(line, 1226730.3625203592, 634155.0816022386, 0)
  OGR::Lib.g_add_point(line, 1281307.30760719, 636467.6640211721, 0)
  OGR::Lib.g_export_to_wkt(line, out line_wkt)
  puts String.new(line_wkt)
  CPL::Lib.free(line_wkt)

  # Create a geometry from WKT
  wkt = "POINT (1120351.5712494177 741921.4223245403)"
  wkt_ptr2 = wkt.to_unsafe
  OGR.exc_wrap_err \
        OGR::Lib.g_create_from_wkt(pointerof(wkt_ptr2),
                                 Pointer(OGR::Lib::SpatialReferenceH).null,
                                 out geo2)
  OGR::Lib.g_export_to_wkt(geo2, out geo2_wkt)
  puts String.new(geo2_wkt)
  CPL::Lib.free(geo2_wkt)

  # Create a geometry from GeoJSON
  geojson = %({"type":"Point","coordinates":[108420.33,753808.59]})
  wkt_ptr2 = geojson.to_unsafe
  geo3 = CPL.exc_wrap_ptr(OGR::Lib.g_create_geometry_from_json(geojson))
  OGR::Lib.g_export_to_wkt(geo3, out geo3_wkt)
  puts String.new(geo3_wkt)
  CPL::Lib.free(geo3_wkt)

  # Create geometry from WKB
  wkb = Base64.decode("AIAAAAFBMkfmVwo9cUEjylouFHrhAAAAAAAAAAA")
  OGR.exc_wrap_err \
        OGR::Lib.g_create_from_wkb(wkb.to_unsafe,
                                 Pointer(OGR::Lib::SpatialReferenceH).null,
                                 out geo4, wkb.size)
  OGR::Lib.g_export_to_wkt(geo4, out geo4_wkt)
  puts String.new(geo4_wkt)
  CPL::Lib.free(geo4_wkt)

  # Create a spatial reference from wkt
  wkt = %(GEOGCS["WGS 84",DATUM["WGS_1984",
  SPHEROID["WGS 84",6378137,298.257223563,
  AUTHORITY["EPSG","7030"]],AUTHORITY["EPSG","6326"]],
  PRIMEM["Greenwich",0,AUTHORITY["EPSG","8901"]],
  UNIT["degree",0.0174532925199433,AUTHORITY["EPSG","9122"]],
  AUTHORITY["EPSG","4326"]])
  srs = uninitialized OSR::Lib::OgrSpatialReferenceH
  srs = OSR::Lib.new_spatial_reference(wkt)
  OSR::Lib.export_to_wkt(srs, out srs_wkt)
  puts String.new(srs_wkt)
  CPL::Lib.free(srs_wkt)
  
  # Write geometry to dataset
  wkt = "MULTIPOINT (1181866.263593049 615654.4222507705, " \
        "1205917.1207499576 623979.7189589312, " \
        "1227192.8790041457 643405.4112779726, " \
        "1224880.2965852122 665143.6860159477)"
  wkt_ptr2 = wkt.to_unsafe
  OGR.exc_wrap_err \
        OGR::Lib.g_create_from_wkt(pointerof(wkt_ptr2),
                                   Pointer(OGR::Lib::SpatialReferenceH).null,
                                   out multipoint)
  OGR::Lib.g_export_to_wkt(multipoint, out multipoint_wkt)
  puts String.new(multipoint_wkt)
  CPL::Lib.free(multipoint_wkt)
  driver = OGR::Lib.get_driver_by_name("GeoJSON")
  ds = CPL.exc_wrap_ptr(OGR::Lib.dr_create_data_source(driver, "test.geojson",
                                                     Pointer(LibC::Char*).null))
  layer = OGR::Lib.ds_create_layer(ds, "test.geojson",
                                   Pointer(Void).null,
                                   OGR::Lib::WkbGeometryType::WkbMultiPoint,
                                   Pointer(LibC::Char*).null)
  layer_defn = OGR::Lib.l_get_layer_defn(layer)
  feature = OGR::Lib.f_create(layer_defn)
  OGR::Lib.f_set_geometry(feature, multipoint)
  OGR::Lib.l_create_feature(layer, feature)
  OGR::Lib.f_destroy(feature)
  OGR::Lib.release_data_source(ds)

  # Read a vector file in .shp format
  driver = OGR::Lib.get_driver_by_name("ESRI Shapefile")
  ds = CPL.exc_wrap_ptr(GDAL::OGR::Lib.open("data/ssp_regions",
                                            GDAL::Lib::Access::GaReadOnly,
                                            pointerof(driver)))
  layer_count = OGR::Lib.ds_get_layer_count(ds)
  puts "data/ssp_regions has #{layer_count} layers"
  layer = CPL.exc_wrap_ptr(OGR::Lib.ds_get_layer(ds, 0))
  layer_name = String.new(OGR::Lib.l_get_name(layer))
  # Second argument specifies whether to force a correct count
  feature_count = OGR::Lib.l_get_feature_count(layer, 0)
  puts "Layer #{layer_name} has #{feature_count} features"

  (1_i64...feature_count).each do |idx|
    feature = OGR::Lib.l_get_feature(layer, idx)
    count = OGR::Lib.f_get_geom_field_count(feature)
    field_idx = OGR::Lib.f_get_field_index(feature, "name")
    name = String.new(OGR::Lib.f_get_field_as_string(feature, field_idx))
    geom_ref = OGR::Lib.f_get_geometry_ref(feature)
    point = OGR::Lib.g_create_geometry(OGR::Lib::WkbGeometryType::WkbPoint)
    OGR.exc_wrap_err(OGR::Lib.g_centroid(geom_ref, point))
    OGR::Lib.g_export_to_wkt(point, out new_point_wkt)
    wkt_str = String.new(new_point_wkt)
    puts "centroid of #{name} is at #{wkt_str}"
  end
  
  # Open dataset
  ds = GDAL::Lib.open("data/raster.tif", GDAL::Lib::Access::GaReadOnly)
  puts ds

  # Try to open non-existent dataset
  CPL.silence_failures = true
  begin
    ds = CPL.exc_wrap_ptr(GDAL::Lib.open("data/foo.tif",
                                         GDAL::Lib::Access::GaReadOnly))
  rescue ex : CPL::BaseError
    puts "Error #{ex.error_no}: #{ex.etype.to_s}: #{ex.message}"
  end
  CPL.silence_failures = false
  ds = GDAL::Lib.open("data/foo.tif", GDAL::Lib::Access::GaReadOnly)

  # That's it folks!
  puts "done"
end


main()
