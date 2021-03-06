module GDAL::OSR
  @[Link("gdal")]
  lib Lib
    fun axis_enum_to_name = OSRAxisEnumToName(e_orientation : OgrAxisOrientation) : LibC::Char*
    enum OgrAxisOrientation
      OaoOther = 0
      OaoNorth = 1
      OaoSouth = 2
      OaoEast = 3
      OaoWest = 4
      OaoUp = 5
      OaoDown = 6
    end
    fun new_spatial_reference = OSRNewSpatialReference(x0 : LibC::Char*) : OgrSpatialReferenceH
    alias OgrSpatialReferenceH = Void*
    fun clone_geog_cs = OSRCloneGeogCS(x0 : OgrSpatialReferenceH) : OgrSpatialReferenceH
    fun clone = OSRClone(x0 : OgrSpatialReferenceH) : OgrSpatialReferenceH
    fun destroy_spatial_reference = OSRDestroySpatialReference(x0 : OgrSpatialReferenceH)
    fun reference = OSRReference(x0 : OgrSpatialReferenceH) : LibC::Int
    fun dereference = OSRDereference(x0 : OgrSpatialReferenceH) : LibC::Int
    fun release = OSRRelease(x0 : OgrSpatialReferenceH)
    fun validate = OSRValidate(x0 : OgrSpatialReferenceH) : OgrErr
    alias OgrErr = LibC::Int
    fun fixup_ordering = OSRFixupOrdering(x0 : OgrSpatialReferenceH) : OgrErr
    fun fixup = OSRFixup(x0 : OgrSpatialReferenceH) : OgrErr
    fun strip_ct_parms = OSRStripCTParms(x0 : OgrSpatialReferenceH) : OgrErr
    fun import_from_epsg = OSRImportFromEPSG(x0 : OgrSpatialReferenceH, x1 : LibC::Int) : OgrErr
    fun import_from_epsga = OSRImportFromEPSGA(x0 : OgrSpatialReferenceH, x1 : LibC::Int) : OgrErr
    fun import_from_wkt = OSRImportFromWkt(x0 : OgrSpatialReferenceH, x1 : LibC::Char**) : OgrErr
    fun import_from_proj4 = OSRImportFromProj4(x0 : OgrSpatialReferenceH, x1 : LibC::Char*) : OgrErr
    fun import_from_esri = OSRImportFromESRI(x0 : OgrSpatialReferenceH, x1 : LibC::Char**) : OgrErr
    fun import_from_pci = OSRImportFromPCI(h_srs : OgrSpatialReferenceH, x1 : LibC::Char*, x2 : LibC::Char*, x3 : LibC::Double*) : OgrErr
    fun import_from_usgs = OSRImportFromUSGS(x0 : OgrSpatialReferenceH, x1 : LibC::Long, x2 : LibC::Long, x3 : LibC::Double*, x4 : LibC::Long) : OgrErr
    fun import_from_xml = OSRImportFromXML(x0 : OgrSpatialReferenceH, x1 : LibC::Char*) : OgrErr
    fun import_from_dict = OSRImportFromDict(x0 : OgrSpatialReferenceH, x1 : LibC::Char*, x2 : LibC::Char*) : OgrErr
    fun import_from_panorama = OSRImportFromPanorama(x0 : OgrSpatialReferenceH, x1 : LibC::Long, x2 : LibC::Long, x3 : LibC::Long, x4 : LibC::Double*) : OgrErr
    fun import_from_ozi = OSRImportFromOzi(x0 : OgrSpatialReferenceH, x1 : LibC::Char**) : OgrErr
    fun import_from_mi_coord_sys = OSRImportFromMICoordSys(x0 : OgrSpatialReferenceH, x1 : LibC::Char*) : OgrErr
    fun import_from_erm = OSRImportFromERM(x0 : OgrSpatialReferenceH, x1 : LibC::Char*, x2 : LibC::Char*, x3 : LibC::Char*) : OgrErr
    fun import_from_url = OSRImportFromUrl(x0 : OgrSpatialReferenceH, x1 : LibC::Char*) : OgrErr
    fun export_to_wkt = OSRExportToWkt(x0 : OgrSpatialReferenceH, x1 : LibC::Char**) : OgrErr
    fun export_to_pretty_wkt = OSRExportToPrettyWkt(x0 : OgrSpatialReferenceH, x1 : LibC::Char**, x2 : LibC::Int) : OgrErr
    fun export_to_proj4 = OSRExportToProj4(x0 : OgrSpatialReferenceH, x1 : LibC::Char**) : OgrErr
    fun export_to_pci = OSRExportToPCI(x0 : OgrSpatialReferenceH, x1 : LibC::Char**, x2 : LibC::Char**, x3 : LibC::Double**) : OgrErr
    fun export_to_usgs = OSRExportToUSGS(x0 : OgrSpatialReferenceH, x1 : LibC::Long*, x2 : LibC::Long*, x3 : LibC::Double**, x4 : LibC::Long*) : OgrErr
    fun export_to_xml = OSRExportToXML(x0 : OgrSpatialReferenceH, x1 : LibC::Char**, x2 : LibC::Char*) : OgrErr
    fun export_to_panorama = OSRExportToPanorama(x0 : OgrSpatialReferenceH, x1 : LibC::Long*, x2 : LibC::Long*, x3 : LibC::Long*, x4 : LibC::Long*, x5 : LibC::Double*) : OgrErr
    fun export_to_mi_coord_sys = OSRExportToMICoordSys(x0 : OgrSpatialReferenceH, x1 : LibC::Char**) : OgrErr
    fun export_to_erm = OSRExportToERM(x0 : OgrSpatialReferenceH, x1 : LibC::Char*, x2 : LibC::Char*, x3 : LibC::Char*) : OgrErr
    fun morph_to_esri = OSRMorphToESRI(x0 : OgrSpatialReferenceH) : OgrErr
    fun morph_from_esri = OSRMorphFromESRI(x0 : OgrSpatialReferenceH) : OgrErr
    fun set_attr_value = OSRSetAttrValue(h_srs : OgrSpatialReferenceH, psz_node_path : LibC::Char*, psz_new_node_value : LibC::Char*) : OgrErr
    fun get_attr_value = OSRGetAttrValue(h_srs : OgrSpatialReferenceH, psz_name : LibC::Char*, i_child : LibC::Int) : LibC::Char*
    fun set_angular_units = OSRSetAngularUnits(x0 : OgrSpatialReferenceH, x1 : LibC::Char*, x2 : LibC::Double) : OgrErr
    fun get_angular_units = OSRGetAngularUnits(x0 : OgrSpatialReferenceH, x1 : LibC::Char**) : LibC::Double
    fun set_linear_units = OSRSetLinearUnits(x0 : OgrSpatialReferenceH, x1 : LibC::Char*, x2 : LibC::Double) : OgrErr
    fun set_target_linear_units = OSRSetTargetLinearUnits(x0 : OgrSpatialReferenceH, x1 : LibC::Char*, x2 : LibC::Char*, x3 : LibC::Double) : OgrErr
    fun set_linear_units_and_update_parameters = OSRSetLinearUnitsAndUpdateParameters(x0 : OgrSpatialReferenceH, x1 : LibC::Char*, x2 : LibC::Double) : OgrErr
    fun get_linear_units = OSRGetLinearUnits(x0 : OgrSpatialReferenceH, x1 : LibC::Char**) : LibC::Double
    fun get_target_linear_units = OSRGetTargetLinearUnits(x0 : OgrSpatialReferenceH, x1 : LibC::Char*, x2 : LibC::Char**) : LibC::Double
    fun get_prime_meridian = OSRGetPrimeMeridian(x0 : OgrSpatialReferenceH, x1 : LibC::Char**) : LibC::Double
    fun is_geographic = OSRIsGeographic(x0 : OgrSpatialReferenceH) : LibC::Int
    fun is_local = OSRIsLocal(x0 : OgrSpatialReferenceH) : LibC::Int
    fun is_projected = OSRIsProjected(x0 : OgrSpatialReferenceH) : LibC::Int
    fun is_compound = OSRIsCompound(x0 : OgrSpatialReferenceH) : LibC::Int
    fun is_geocentric = OSRIsGeocentric(x0 : OgrSpatialReferenceH) : LibC::Int
    fun is_vertical = OSRIsVertical(x0 : OgrSpatialReferenceH) : LibC::Int
    fun is_same_geog_cs = OSRIsSameGeogCS(x0 : OgrSpatialReferenceH, x1 : OgrSpatialReferenceH) : LibC::Int
    fun is_same_vert_cs = OSRIsSameVertCS(x0 : OgrSpatialReferenceH, x1 : OgrSpatialReferenceH) : LibC::Int
    fun is_same = OSRIsSame(x0 : OgrSpatialReferenceH, x1 : OgrSpatialReferenceH) : LibC::Int
    fun set_local_cs = OSRSetLocalCS(h_srs : OgrSpatialReferenceH, psz_name : LibC::Char*) : OgrErr
    fun set_proj_cs = OSRSetProjCS(h_srs : OgrSpatialReferenceH, psz_name : LibC::Char*) : OgrErr
    fun set_geoc_cs = OSRSetGeocCS(h_srs : OgrSpatialReferenceH, psz_name : LibC::Char*) : OgrErr
    fun set_well_known_geog_cs = OSRSetWellKnownGeogCS(h_srs : OgrSpatialReferenceH, psz_name : LibC::Char*) : OgrErr
    fun set_from_user_input = OSRSetFromUserInput(h_srs : OgrSpatialReferenceH, x1 : LibC::Char*) : OgrErr
    fun copy_geog_cs_from = OSRCopyGeogCSFrom(h_srs : OgrSpatialReferenceH, h_src_srs : OgrSpatialReferenceH) : OgrErr
    fun set_towgs84 = OSRSetTOWGS84(h_srs : OgrSpatialReferenceH, x1 : LibC::Double, x2 : LibC::Double, x3 : LibC::Double, x4 : LibC::Double, x5 : LibC::Double, x6 : LibC::Double, x7 : LibC::Double) : OgrErr
    fun get_towgs84 = OSRGetTOWGS84(h_srs : OgrSpatialReferenceH, x1 : LibC::Double*, x2 : LibC::Int) : OgrErr
    fun set_compound_cs = OSRSetCompoundCS(h_srs : OgrSpatialReferenceH, psz_name : LibC::Char*, h_horiz_srs : OgrSpatialReferenceH, h_vert_srs : OgrSpatialReferenceH) : OgrErr
    fun set_geog_cs = OSRSetGeogCS(h_srs : OgrSpatialReferenceH, psz_geog_name : LibC::Char*, psz_datum_name : LibC::Char*, psz_ellipsoid_name : LibC::Char*, df_semi_major : LibC::Double, df_inv_flattening : LibC::Double, psz_pm_name : LibC::Char*, df_pm_offset : LibC::Double, psz_units : LibC::Char*, df_convert_to_radians : LibC::Double) : OgrErr
    fun set_vert_cs = OSRSetVertCS(h_srs : OgrSpatialReferenceH, psz_vert_cs_name : LibC::Char*, psz_vert_datum_name : LibC::Char*, n_vert_datum_type : LibC::Int) : OgrErr
    fun get_semi_major = OSRGetSemiMajor(x0 : OgrSpatialReferenceH, x1 : OgrErr*) : LibC::Double
    fun get_semi_minor = OSRGetSemiMinor(x0 : OgrSpatialReferenceH, x1 : OgrErr*) : LibC::Double
    fun get_inv_flattening = OSRGetInvFlattening(x0 : OgrSpatialReferenceH, x1 : OgrErr*) : LibC::Double
    fun set_authority = OSRSetAuthority(h_srs : OgrSpatialReferenceH, psz_target_key : LibC::Char*, psz_authority : LibC::Char*, n_code : LibC::Int) : OgrErr
    fun get_authority_code = OSRGetAuthorityCode(h_srs : OgrSpatialReferenceH, psz_target_key : LibC::Char*) : LibC::Char*
    fun get_authority_name = OSRGetAuthorityName(h_srs : OgrSpatialReferenceH, psz_target_key : LibC::Char*) : LibC::Char*
    fun set_projection = OSRSetProjection(x0 : OgrSpatialReferenceH, x1 : LibC::Char*) : OgrErr
    fun set_proj_parm = OSRSetProjParm(x0 : OgrSpatialReferenceH, x1 : LibC::Char*, x2 : LibC::Double) : OgrErr
    fun get_proj_parm = OSRGetProjParm(h_srs : OgrSpatialReferenceH, psz_parm_name : LibC::Char*, df_default : LibC::Double, x3 : OgrErr*) : LibC::Double
    fun set_norm_proj_parm = OSRSetNormProjParm(x0 : OgrSpatialReferenceH, x1 : LibC::Char*, x2 : LibC::Double) : OgrErr
    fun get_norm_proj_parm = OSRGetNormProjParm(h_srs : OgrSpatialReferenceH, psz_parm_name : LibC::Char*, df_default : LibC::Double, x3 : OgrErr*) : LibC::Double
    fun set_utm = OSRSetUTM(h_srs : OgrSpatialReferenceH, n_zone : LibC::Int, b_north : LibC::Int) : OgrErr
    fun get_utm_zone = OSRGetUTMZone(h_srs : OgrSpatialReferenceH, pb_north : LibC::Int*) : LibC::Int
    fun set_state_plane = OSRSetStatePlane(h_srs : OgrSpatialReferenceH, n_zone : LibC::Int, b_nad83 : LibC::Int) : OgrErr
    fun set_state_plane_with_units = OSRSetStatePlaneWithUnits(h_srs : OgrSpatialReferenceH, n_zone : LibC::Int, b_nad83 : LibC::Int, psz_override_unit_name : LibC::Char*, df_override_unit : LibC::Double) : OgrErr
    fun auto_identify_epsg = OSRAutoIdentifyEPSG(h_srs : OgrSpatialReferenceH) : OgrErr
    fun epsg_treats_as_lat_long = OSREPSGTreatsAsLatLong(h_srs : OgrSpatialReferenceH) : LibC::Int
    fun epsg_treats_as_northing_easting = OSREPSGTreatsAsNorthingEasting(h_srs : OgrSpatialReferenceH) : LibC::Int
    fun get_axis = OSRGetAxis(h_srs : OgrSpatialReferenceH, psz_target_key : LibC::Char*, i_axis : LibC::Int, pe_orientation : OgrAxisOrientation*) : LibC::Char*
    fun set_axes = OSRSetAxes(h_srs : OgrSpatialReferenceH, psz_target_key : LibC::Char*, psz_x_axis_name : LibC::Char*, e_x_axis_orientation : OgrAxisOrientation, psz_y_axis_name : LibC::Char*, e_y_axis_orientation : OgrAxisOrientation) : OgrErr
    fun set_acea = OSRSetACEA(h_srs : OgrSpatialReferenceH, df_std_p1 : LibC::Double, df_std_p2 : LibC::Double, df_center_lat : LibC::Double, df_center_long : LibC::Double, df_false_easting : LibC::Double, df_false_northing : LibC::Double) : OgrErr
    fun set_ae = OSRSetAE(h_srs : OgrSpatialReferenceH, df_center_lat : LibC::Double, df_center_long : LibC::Double, df_false_easting : LibC::Double, df_false_northing : LibC::Double) : OgrErr
    fun set_bonne = OSRSetBonne(h_srs : OgrSpatialReferenceH, df_standard_parallel : LibC::Double, df_central_meridian : LibC::Double, df_false_easting : LibC::Double, df_false_northing : LibC::Double) : OgrErr
    fun set_cea = OSRSetCEA(h_srs : OgrSpatialReferenceH, df_std_p1 : LibC::Double, df_central_meridian : LibC::Double, df_false_easting : LibC::Double, df_false_northing : LibC::Double) : OgrErr
    fun set_cs = OSRSetCS(h_srs : OgrSpatialReferenceH, df_center_lat : LibC::Double, df_center_long : LibC::Double, df_false_easting : LibC::Double, df_false_northing : LibC::Double) : OgrErr
    fun set_ec = OSRSetEC(h_srs : OgrSpatialReferenceH, df_std_p1 : LibC::Double, df_std_p2 : LibC::Double, df_center_lat : LibC::Double, df_center_long : LibC::Double, df_false_easting : LibC::Double, df_false_northing : LibC::Double) : OgrErr
    fun set_eckert = OSRSetEckert(h_srs : OgrSpatialReferenceH, n_variation : LibC::Int, df_central_meridian : LibC::Double, df_false_easting : LibC::Double, df_false_northing : LibC::Double) : OgrErr
    fun set_eckert_iv = OSRSetEckertIV(h_srs : OgrSpatialReferenceH, df_central_meridian : LibC::Double, df_false_easting : LibC::Double, df_false_northing : LibC::Double) : OgrErr
    fun set_eckert_vi = OSRSetEckertVI(h_srs : OgrSpatialReferenceH, df_central_meridian : LibC::Double, df_false_easting : LibC::Double, df_false_northing : LibC::Double) : OgrErr
    fun set_equirectangular = OSRSetEquirectangular(h_srs : OgrSpatialReferenceH, df_center_lat : LibC::Double, df_center_long : LibC::Double, df_false_easting : LibC::Double, df_false_northing : LibC::Double) : OgrErr
    fun set_equirectangular2 = OSRSetEquirectangular2(h_srs : OgrSpatialReferenceH, df_center_lat : LibC::Double, df_center_long : LibC::Double, df_pseudo_std_parallel1 : LibC::Double, df_false_easting : LibC::Double, df_false_northing : LibC::Double) : OgrErr
    fun set_gs = OSRSetGS(h_srs : OgrSpatialReferenceH, df_central_meridian : LibC::Double, df_false_easting : LibC::Double, df_false_northing : LibC::Double) : OgrErr
    fun set_gh = OSRSetGH(h_srs : OgrSpatialReferenceH, df_central_meridian : LibC::Double, df_false_easting : LibC::Double, df_false_northing : LibC::Double) : OgrErr
    fun set_igh = OSRSetIGH(h_srs : OgrSpatialReferenceH) : OgrErr
    fun set_geos = OSRSetGEOS(h_srs : OgrSpatialReferenceH, df_central_meridian : LibC::Double, df_satellite_height : LibC::Double, df_false_easting : LibC::Double, df_false_northing : LibC::Double) : OgrErr
    fun set_gauss_schreiber_t_mercator = OSRSetGaussSchreiberTMercator(h_srs : OgrSpatialReferenceH, df_center_lat : LibC::Double, df_center_long : LibC::Double, df_scale : LibC::Double, df_false_easting : LibC::Double, df_false_northing : LibC::Double) : OgrErr
    fun set_gnomonic = OSRSetGnomonic(h_srs : OgrSpatialReferenceH, df_center_lat : LibC::Double, df_center_long : LibC::Double, df_false_easting : LibC::Double, df_false_northing : LibC::Double) : OgrErr
    fun set_om = OSRSetOM(h_srs : OgrSpatialReferenceH, df_center_lat : LibC::Double, df_center_long : LibC::Double, df_azimuth : LibC::Double, df_rect_to_skew : LibC::Double, df_scale : LibC::Double, df_false_easting : LibC::Double, df_false_northing : LibC::Double) : OgrErr
    fun set_hom = OSRSetHOM(h_srs : OgrSpatialReferenceH, df_center_lat : LibC::Double, df_center_long : LibC::Double, df_azimuth : LibC::Double, df_rect_to_skew : LibC::Double, df_scale : LibC::Double, df_false_easting : LibC::Double, df_false_northing : LibC::Double) : OgrErr
    fun set_homac = OSRSetHOMAC(h_srs : OgrSpatialReferenceH, df_center_lat : LibC::Double, df_center_long : LibC::Double, df_azimuth : LibC::Double, df_rect_to_skew : LibC::Double, df_scale : LibC::Double, df_false_easting : LibC::Double, df_false_northing : LibC::Double) : OgrErr
    fun set_hom2_pno = OSRSetHOM2PNO(h_srs : OgrSpatialReferenceH, df_center_lat : LibC::Double, df_lat1 : LibC::Double, df_long1 : LibC::Double, df_lat2 : LibC::Double, df_long2 : LibC::Double, df_scale : LibC::Double, df_false_easting : LibC::Double, df_false_northing : LibC::Double) : OgrErr
    fun set_iwm_polyconic = OSRSetIWMPolyconic(h_srs : OgrSpatialReferenceH, df_lat1 : LibC::Double, df_lat2 : LibC::Double, df_center_long : LibC::Double, df_false_easting : LibC::Double, df_false_northing : LibC::Double) : OgrErr
    fun set_krovak = OSRSetKrovak(h_srs : OgrSpatialReferenceH, df_center_lat : LibC::Double, df_center_long : LibC::Double, df_azimuth : LibC::Double, df_pseudo_std_parallel_lat : LibC::Double, df_scale : LibC::Double, df_false_easting : LibC::Double, df_false_northing : LibC::Double) : OgrErr
    fun set_laea = OSRSetLAEA(h_srs : OgrSpatialReferenceH, df_center_lat : LibC::Double, df_center_long : LibC::Double, df_false_easting : LibC::Double, df_false_northing : LibC::Double) : OgrErr
    fun set_lcc = OSRSetLCC(h_srs : OgrSpatialReferenceH, df_std_p1 : LibC::Double, df_std_p2 : LibC::Double, df_center_lat : LibC::Double, df_center_long : LibC::Double, df_false_easting : LibC::Double, df_false_northing : LibC::Double) : OgrErr
    fun set_lcc1_sp = OSRSetLCC1SP(h_srs : OgrSpatialReferenceH, df_center_lat : LibC::Double, df_center_long : LibC::Double, df_scale : LibC::Double, df_false_easting : LibC::Double, df_false_northing : LibC::Double) : OgrErr
    fun set_lccb = OSRSetLCCB(h_srs : OgrSpatialReferenceH, df_std_p1 : LibC::Double, df_std_p2 : LibC::Double, df_center_lat : LibC::Double, df_center_long : LibC::Double, df_false_easting : LibC::Double, df_false_northing : LibC::Double) : OgrErr
    fun set_mc = OSRSetMC(h_srs : OgrSpatialReferenceH, df_center_lat : LibC::Double, df_center_long : LibC::Double, df_false_easting : LibC::Double, df_false_northing : LibC::Double) : OgrErr
    fun set_mercator = OSRSetMercator(h_srs : OgrSpatialReferenceH, df_center_lat : LibC::Double, df_center_long : LibC::Double, df_scale : LibC::Double, df_false_easting : LibC::Double, df_false_northing : LibC::Double) : OgrErr
    fun set_mercator2_sp = OSRSetMercator2SP(h_srs : OgrSpatialReferenceH, df_std_p1 : LibC::Double, df_center_lat : LibC::Double, df_center_long : LibC::Double, df_false_easting : LibC::Double, df_false_northing : LibC::Double) : OgrErr
    fun set_mollweide = OSRSetMollweide(h_srs : OgrSpatialReferenceH, df_central_meridian : LibC::Double, df_false_easting : LibC::Double, df_false_northing : LibC::Double) : OgrErr
    fun set_nzmg = OSRSetNZMG(h_srs : OgrSpatialReferenceH, df_center_lat : LibC::Double, df_center_long : LibC::Double, df_false_easting : LibC::Double, df_false_northing : LibC::Double) : OgrErr
    fun set_os = OSRSetOS(h_srs : OgrSpatialReferenceH, df_origin_lat : LibC::Double, df_c_meridian : LibC::Double, df_scale : LibC::Double, df_false_easting : LibC::Double, df_false_northing : LibC::Double) : OgrErr
    fun set_orthographic = OSRSetOrthographic(h_srs : OgrSpatialReferenceH, df_center_lat : LibC::Double, df_center_long : LibC::Double, df_false_easting : LibC::Double, df_false_northing : LibC::Double) : OgrErr
    fun set_polyconic = OSRSetPolyconic(h_srs : OgrSpatialReferenceH, df_center_lat : LibC::Double, df_center_long : LibC::Double, df_false_easting : LibC::Double, df_false_northing : LibC::Double) : OgrErr
    fun set_ps = OSRSetPS(h_srs : OgrSpatialReferenceH, df_center_lat : LibC::Double, df_center_long : LibC::Double, df_scale : LibC::Double, df_false_easting : LibC::Double, df_false_northing : LibC::Double) : OgrErr
    fun set_robinson = OSRSetRobinson(h_srs : OgrSpatialReferenceH, df_center_long : LibC::Double, df_false_easting : LibC::Double, df_false_northing : LibC::Double) : OgrErr
    fun set_sinusoidal = OSRSetSinusoidal(h_srs : OgrSpatialReferenceH, df_center_long : LibC::Double, df_false_easting : LibC::Double, df_false_northing : LibC::Double) : OgrErr
    fun set_stereographic = OSRSetStereographic(h_srs : OgrSpatialReferenceH, df_center_lat : LibC::Double, df_center_long : LibC::Double, df_scale : LibC::Double, df_false_easting : LibC::Double, df_false_northing : LibC::Double) : OgrErr
    fun set_soc = OSRSetSOC(h_srs : OgrSpatialReferenceH, df_latitude_of_origin : LibC::Double, df_central_meridian : LibC::Double, df_false_easting : LibC::Double, df_false_northing : LibC::Double) : OgrErr
    fun set_tm = OSRSetTM(h_srs : OgrSpatialReferenceH, df_center_lat : LibC::Double, df_center_long : LibC::Double, df_scale : LibC::Double, df_false_easting : LibC::Double, df_false_northing : LibC::Double) : OgrErr
    fun set_tm_variant = OSRSetTMVariant(h_srs : OgrSpatialReferenceH, psz_variant_name : LibC::Char*, df_center_lat : LibC::Double, df_center_long : LibC::Double, df_scale : LibC::Double, df_false_easting : LibC::Double, df_false_northing : LibC::Double) : OgrErr
    fun set_tmg = OSRSetTMG(h_srs : OgrSpatialReferenceH, df_center_lat : LibC::Double, df_center_long : LibC::Double, df_false_easting : LibC::Double, df_false_northing : LibC::Double) : OgrErr
    fun set_tmso = OSRSetTMSO(h_srs : OgrSpatialReferenceH, df_center_lat : LibC::Double, df_center_long : LibC::Double, df_scale : LibC::Double, df_false_easting : LibC::Double, df_false_northing : LibC::Double) : OgrErr
    fun set_tped = OSRSetTPED(h_srs : OgrSpatialReferenceH, df_lat1 : LibC::Double, df_long1 : LibC::Double, df_lat2 : LibC::Double, df_long2 : LibC::Double, df_false_easting : LibC::Double, df_false_northing : LibC::Double) : OgrErr
    fun set_vdg = OSRSetVDG(h_srs : OgrSpatialReferenceH, df_center_long : LibC::Double, df_false_easting : LibC::Double, df_false_northing : LibC::Double) : OgrErr
    fun set_wagner = OSRSetWagner(h_srs : OgrSpatialReferenceH, n_variation : LibC::Int, df_center_lat : LibC::Double, df_false_easting : LibC::Double, df_false_northing : LibC::Double) : OgrErr
    fun set_qsc = OSRSetQSC(h_srs : OgrSpatialReferenceH, df_center_lat : LibC::Double, df_center_long : LibC::Double) : OgrErr
    fun set_sch = OSRSetSCH(h_srs : OgrSpatialReferenceH, df_peg_lat : LibC::Double, df_peg_long : LibC::Double, df_peg_heading : LibC::Double, df_peg_hgt : LibC::Double) : OgrErr
    fun calc_inv_flattening = OSRCalcInvFlattening(df_semi_major : LibC::Double, df_semi_minor : LibC::Double) : LibC::Double
    fun calc_semi_minor_from_inv_flattening = OSRCalcSemiMinorFromInvFlattening(df_semi_major : LibC::Double, df_inv_flattening : LibC::Double) : LibC::Double
    fun cleanup = OSRCleanup
  end
end
