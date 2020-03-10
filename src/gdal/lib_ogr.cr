{% begin %}
  {% ogr_available = `gdal-config --ogr-enabled`.split.last == "yes" %}
  {% unless ogr_available %}
    {% raise "OGR not part of the GDAL installation" %}
  {% end %}
{% end %}

module GDAL::OGR
  @[Link(ldflags: "`gdal-config --libs`")]
  lib Lib
    ERR_NONE = 0
    ERR_NOT_ENOUGH_DATA = 1
    ERR_NOT_ENOUGH_MEMORY = 2
    ERR_UNSUPPORTED_GEOMETRY_TYPE = 3
    ERR_UNSUPPORTED_OPERATION = 4
    ERR_CORRUPT_DATA = 5
    ERR_FAILURE = 6
    ERR_UNSUPPORTED_SRS = 7
    ERR_INVALID_HANDLE = 8
    ERR_NON_EXISTING_FEATURE = 9
    F_VAL_NULL = 1
    F_VAL_GEOM_TYPE = 2
    F_VAL_WIDTH = 4
    F_VAL_ALLOW_NULL_WHEN_DEFAULT = 8
    F_VAL_ALLOW_DIFFERENT_GEOM_DIM = 16
    NULLFID = -1
    UNSETMARKER = -21121
    NULLMARKER = -21122
    fun malloc = OGRMalloc(x0 : LibC::SizeT) : Void*
    fun calloc = OGRCalloc(x0 : LibC::SizeT, x1 : LibC::SizeT) : Void*
    fun realloc = OGRRealloc(x0 : Void*, x1 : LibC::SizeT) : Void*
    fun strdup = OGRStrdup(x0 : LibC::Char*) : LibC::Char*
    fun free = OGRFree(x0 : Void*)
    fun geometry_type_to_name = OGRGeometryTypeToName(e_type : WkbGeometryType) : LibC::Char*
    enum WkbGeometryType
      WkbUnknown = 0
      WkbPoint = 1
      WkbLineString = 2
      WkbPolygon = 3
      WkbMultiPoint = 4
      WkbMultiLineString = 5
      WkbMultiPolygon = 6
      WkbGeometryCollection = 7
      WkbCircularString = 8
      WkbCompoundCurve = 9
      WkbCurvePolygon = 10
      WkbMultiCurve = 11
      WkbMultiSurface = 12
      WkbCurve = 13
      WkbSurface = 14
      WkbPolyhedralSurface = 15
      WkbTin = 16
      WkbTriangle = 17
      WkbNone = 100
      WkbLinearRing = 101
      WkbCircularStringZ = 1008
      WkbCompoundCurveZ = 1009
      WkbCurvePolygonZ = 1010
      WkbMultiCurveZ = 1011
      WkbMultiSurfaceZ = 1012
      WkbCurveZ = 1013
      WkbSurfaceZ = 1014
      WkbPolyhedralSurfaceZ = 1015
      WkbTinz = 1016
      WkbTriangleZ = 1017
      WkbPointM = 2001
      WkbLineStringM = 2002
      WkbPolygonM = 2003
      WkbMultiPointM = 2004
      WkbMultiLineStringM = 2005
      WkbMultiPolygonM = 2006
      WkbGeometryCollectionM = 2007
      WkbCircularStringM = 2008
      WkbCompoundCurveM = 2009
      WkbCurvePolygonM = 2010
      WkbMultiCurveM = 2011
      WkbMultiSurfaceM = 2012
      WkbCurveM = 2013
      WkbSurfaceM = 2014
      WkbPolyhedralSurfaceM = 2015
      WkbTinm = 2016
      WkbTriangleM = 2017
      WkbPointZm = 3001
      WkbLineStringZm = 3002
      WkbPolygonZm = 3003
      WkbMultiPointZm = 3004
      WkbMultiLineStringZm = 3005
      WkbMultiPolygonZm = 3006
      WkbGeometryCollectionZm = 3007
      WkbCircularStringZm = 3008
      WkbCompoundCurveZm = 3009
      WkbCurvePolygonZm = 3010
      WkbMultiCurveZm = 3011
      WkbMultiSurfaceZm = 3012
      WkbCurveZm = 3013
      WkbSurfaceZm = 3014
      WkbPolyhedralSurfaceZm = 3015
      WkbTinzm = 3016
      WkbTriangleZm = 3017
      WkbPoint25D = -2147483647
      WkbLineString25D = -2147483646
      WkbPolygon25D = -2147483645
      WkbMultiPoint25D = -2147483644
      WkbMultiLineString25D = -2147483643
      WkbMultiPolygon25D = -2147483642
      WkbGeometryCollection25D = -2147483641
    end
    fun merge_geometry_types = OGRMergeGeometryTypes(e_main : WkbGeometryType, e_extra : WkbGeometryType) : WkbGeometryType
    fun merge_geometry_types_ex = OGRMergeGeometryTypesEx(e_main : WkbGeometryType, e_extra : WkbGeometryType, b_allow_promoting_to_curves : LibC::Int) : WkbGeometryType
    fun gt_flatten = OGR_GT_Flatten(e_type : WkbGeometryType) : WkbGeometryType
    fun gt_set_z = OGR_GT_SetZ(e_type : WkbGeometryType) : WkbGeometryType
    fun gt_set_m = OGR_GT_SetM(e_type : WkbGeometryType) : WkbGeometryType
    fun gt_set_modifier = OGR_GT_SetModifier(e_type : WkbGeometryType, b_set_z : LibC::Int, b_set_m : LibC::Int) : WkbGeometryType
    fun gt_has_z = OGR_GT_HasZ(e_type : WkbGeometryType) : LibC::Int
    fun gt_has_m = OGR_GT_HasM(e_type : WkbGeometryType) : LibC::Int
    fun gt_is_sub_class_of = OGR_GT_IsSubClassOf(e_type : WkbGeometryType, e_super_type : WkbGeometryType) : LibC::Int
    fun gt_is_curve = OGR_GT_IsCurve(x0 : WkbGeometryType) : LibC::Int
    fun gt_is_surface = OGR_GT_IsSurface(x0 : WkbGeometryType) : LibC::Int
    fun gt_is_non_linear = OGR_GT_IsNonLinear(x0 : WkbGeometryType) : LibC::Int
    fun gt_get_collection = OGR_GT_GetCollection(e_type : WkbGeometryType) : WkbGeometryType
    fun gt_get_curve = OGR_GT_GetCurve(e_type : WkbGeometryType) : WkbGeometryType
    fun gt_get_linear = OGR_GT_GetLinear(e_type : WkbGeometryType) : WkbGeometryType
    fun parse_date = OGRParseDate(psz_input : LibC::Char*, ps_output : Field*, n_options : LibC::Int) : LibC::Int
    union Field
      integer : LibC::Int
      integer64 : GIntBig
      real : LibC::Double
      string : LibC::Char*
      integer_list : FieldIntegerList
      integer64_list : FieldInteger64List
      real_list : FieldRealList
      string_list : FieldStringList
      binary : FieldBinary
      set : FieldSet
      date : FieldDate
    end
    alias GIntBig = LibC::LongLong
    struct FieldIntegerList
      n_count : LibC::Int
      pa_list : LibC::Int*
    end
    struct FieldInteger64List
      n_count : LibC::Int
      pa_list : GIntBig*
    end
    struct FieldRealList
      n_count : LibC::Int
      pa_list : LibC::Double*
    end
    struct FieldStringList
      n_count : LibC::Int
      pa_list : LibC::Char**
    end
    struct FieldBinary
      n_count : LibC::Int
      pa_data : GByte*
    end
    alias GByte = UInt8
    struct FieldSet
      n_marker1 : LibC::Int
      n_marker2 : LibC::Int
      n_marker3 : LibC::Int
    end
    struct FieldDate
      year : GInt16
      month : GByte
      day : GByte
      hour : GByte
      minute : GByte
      tz_flag : GByte
      reserved : GByte
      second : LibC::Float
    end
    alias GInt16 = LibC::Short
    fun g_create_from_wkb = OGR_G_CreateFromWkb(x0 : UInt8*, x1 : SpatialReferenceH, x2 : GeometryH*, x3 : LibC::Int) : Err
    alias SpatialReferenceH = Void*
    alias GeometryH = Void*
    alias Err = LibC::Int
    fun g_create_from_wkt = OGR_G_CreateFromWkt(x0 : LibC::Char**, x1 : SpatialReferenceH, x2 : GeometryH*) : Err
    fun g_create_from_fgf = OGR_G_CreateFromFgf(x0 : UInt8*, x1 : SpatialReferenceH, x2 : GeometryH*, x3 : LibC::Int, x4 : LibC::Int*) : Err
    fun g_destroy_geometry = OGR_G_DestroyGeometry(x0 : GeometryH)
    fun g_create_geometry = OGR_G_CreateGeometry(x0 : WkbGeometryType) : GeometryH
    fun g_approximate_arc_angles = OGR_G_ApproximateArcAngles(df_center_x : LibC::Double, df_center_y : LibC::Double, df_z : LibC::Double, df_primary_radius : LibC::Double, df_secondary_axis : LibC::Double, df_rotation : LibC::Double, df_start_angle : LibC::Double, df_end_angle : LibC::Double, df_max_angle_step_size_degrees : LibC::Double) : GeometryH
    fun g_force_to_polygon = OGR_G_ForceToPolygon(x0 : GeometryH) : GeometryH
    fun g_force_to_line_string = OGR_G_ForceToLineString(x0 : GeometryH) : GeometryH
    fun g_force_to_multi_polygon = OGR_G_ForceToMultiPolygon(x0 : GeometryH) : GeometryH
    fun g_force_to_multi_point = OGR_G_ForceToMultiPoint(x0 : GeometryH) : GeometryH
    fun g_force_to_multi_line_string = OGR_G_ForceToMultiLineString(x0 : GeometryH) : GeometryH
    fun g_force_to = OGR_G_ForceTo(h_geom : GeometryH, e_target_type : WkbGeometryType, papsz_options : LibC::Char**) : GeometryH
    fun g_get_dimension = OGR_G_GetDimension(x0 : GeometryH) : LibC::Int
    fun g_get_coordinate_dimension = OGR_G_GetCoordinateDimension(x0 : GeometryH) : LibC::Int
    fun g_coordinate_dimension = OGR_G_CoordinateDimension(x0 : GeometryH) : LibC::Int
    fun g_set_coordinate_dimension = OGR_G_SetCoordinateDimension(x0 : GeometryH, x1 : LibC::Int)
    fun g_is3_d = OGR_G_Is3D(x0 : GeometryH) : LibC::Int
    fun g_is_measured = OGR_G_IsMeasured(x0 : GeometryH) : LibC::Int
    fun g_set3_d = OGR_G_Set3D(x0 : GeometryH, x1 : LibC::Int)
    fun g_set_measured = OGR_G_SetMeasured(x0 : GeometryH, x1 : LibC::Int)
    fun g_clone = OGR_G_Clone(x0 : GeometryH) : GeometryH
    fun g_get_envelope = OGR_G_GetEnvelope(x0 : GeometryH, x1 : Envelope*)
    struct Envelope
      min_x : LibC::Double
      max_x : LibC::Double
      min_y : LibC::Double
      max_y : LibC::Double
    end
    fun g_get_envelope3_d = OGR_G_GetEnvelope3D(x0 : GeometryH, x1 : Envelope3D*)
    struct Envelope3D
      min_x : LibC::Double
      max_x : LibC::Double
      min_y : LibC::Double
      max_y : LibC::Double
      min_z : LibC::Double
      max_z : LibC::Double
    end
    fun g_import_from_wkb = OGR_G_ImportFromWkb(x0 : GeometryH, x1 : UInt8*, x2 : LibC::Int) : Err
    fun g_export_to_wkb = OGR_G_ExportToWkb(x0 : GeometryH, x1 : WkbByteOrder, x2 : UInt8*) : Err
    enum WkbByteOrder
      WkbXdr = 0
      WkbNdr = 1
    end
    fun g_export_to_iso_wkb = OGR_G_ExportToIsoWkb(x0 : GeometryH, x1 : WkbByteOrder, x2 : UInt8*) : Err
    fun g_wkb_size = OGR_G_WkbSize(h_geom : GeometryH) : LibC::Int
    fun g_import_from_wkt = OGR_G_ImportFromWkt(x0 : GeometryH, x1 : LibC::Char**) : Err
    fun g_export_to_wkt = OGR_G_ExportToWkt(x0 : GeometryH, x1 : LibC::Char**) : Err
    fun g_export_to_iso_wkt = OGR_G_ExportToIsoWkt(x0 : GeometryH, x1 : LibC::Char**) : Err
    fun g_get_geometry_type = OGR_G_GetGeometryType(x0 : GeometryH) : WkbGeometryType
    fun g_get_geometry_name = OGR_G_GetGeometryName(x0 : GeometryH) : LibC::Char*
    fun g_dump_readable = OGR_G_DumpReadable(x0 : GeometryH, x1 : File*, x2 : LibC::Char*)
    struct X_IoFile
      _flags : LibC::Int
      _io_read_ptr : LibC::Char*
      _io_read_end : LibC::Char*
      _io_read_base : LibC::Char*
      _io_write_base : LibC::Char*
      _io_write_ptr : LibC::Char*
      _io_write_end : LibC::Char*
      _io_buf_base : LibC::Char*
      _io_buf_end : LibC::Char*
      _io_save_base : LibC::Char*
      _io_backup_base : LibC::Char*
      _io_save_end : LibC::Char*
      _markers : X_IoMarker*
      _chain : X_IoFile*
      _fileno : LibC::Int
      _flags2 : LibC::Int
      _old_offset : X__OffT
      _cur_column : LibC::UShort
      _vtable_offset : LibC::Char
      _shortbuf : LibC::Char[1]
      _lock : X_IoLockT*
      _offset : X__Off64T
      __pad1 : Void*
      __pad2 : Void*
      __pad3 : Void*
      __pad4 : Void*
      __pad5 : LibC::SizeT
      _mode : LibC::Int
      _unused2 : LibC::Char[20]
    end
    type File = X_IoFile
    struct X_IoMarker
      _next : X_IoMarker*
      _sbuf : X_IoFile*
      _pos : LibC::Int
    end
    alias X__OffT = LibC::Long
    alias X_IoLockT = Void
    alias X__Off64T = LibC::Long
    fun g_flatten_to2_d = OGR_G_FlattenTo2D(x0 : GeometryH)
    fun g_close_rings = OGR_G_CloseRings(x0 : GeometryH)
    fun g_create_from_gml = OGR_G_CreateFromGML(x0 : LibC::Char*) : GeometryH
    fun g_export_to_gml = OGR_G_ExportToGML(x0 : GeometryH) : LibC::Char*
    fun g_export_to_gml_ex = OGR_G_ExportToGMLEx(x0 : GeometryH, papsz_options : LibC::Char**) : LibC::Char*
    fun g_create_from_gml_tree = OGR_G_CreateFromGMLTree(x0 : CplxmlNode*) : GeometryH
    struct CplxmlNode
      e_type : CplxmlNodeType
      psz_value : LibC::Char*
      ps_next : CplxmlNode*
      ps_child : CplxmlNode*
    end
    enum CplxmlNodeType
      CxtElement = 0
      CxtText = 1
      CxtAttribute = 2
      CxtComment = 3
      CxtLiteral = 4
    end
    fun g_export_to_gml_tree = OGR_G_ExportToGMLTree(x0 : GeometryH) : CplxmlNode*
    fun g_export_envelope_to_gml_tree = OGR_G_ExportEnvelopeToGMLTree(x0 : GeometryH) : CplxmlNode*
    fun g_export_to_kml = OGR_G_ExportToKML(x0 : GeometryH, psz_altitude_mode : LibC::Char*) : LibC::Char*
    fun g_export_to_json = OGR_G_ExportToJson(x0 : GeometryH) : LibC::Char*
    fun g_export_to_json_ex = OGR_G_ExportToJsonEx(x0 : GeometryH, papsz_options : LibC::Char**) : LibC::Char*
    fun g_create_geometry_from_json = OGR_G_CreateGeometryFromJson(x0 : LibC::Char*) : GeometryH
    fun g_assign_spatial_reference = OGR_G_AssignSpatialReference(x0 : GeometryH, x1 : SpatialReferenceH)
    fun g_get_spatial_reference = OGR_G_GetSpatialReference(x0 : GeometryH) : SpatialReferenceH
    fun g_transform = OGR_G_Transform(x0 : GeometryH, x1 : CoordinateTransformationH) : Err
    alias CoordinateTransformationH = Void*
    fun g_transform_to = OGR_G_TransformTo(x0 : GeometryH, x1 : SpatialReferenceH) : Err
    fun g_simplify = OGR_G_Simplify(h_this : GeometryH, tolerance : LibC::Double) : GeometryH
    fun g_simplify_preserve_topology = OGR_G_SimplifyPreserveTopology(h_this : GeometryH, tolerance : LibC::Double) : GeometryH
    fun g_delaunay_triangulation = OGR_G_DelaunayTriangulation(h_this : GeometryH, df_tolerance : LibC::Double, b_only_edges : LibC::Int) : GeometryH
    fun g_segmentize = OGR_G_Segmentize(h_geom : GeometryH, df_max_length : LibC::Double)
    fun g_intersects = OGR_G_Intersects(x0 : GeometryH, x1 : GeometryH) : LibC::Int
    fun g_equals = OGR_G_Equals(x0 : GeometryH, x1 : GeometryH) : LibC::Int
    fun g_disjoint = OGR_G_Disjoint(x0 : GeometryH, x1 : GeometryH) : LibC::Int
    fun g_touches = OGR_G_Touches(x0 : GeometryH, x1 : GeometryH) : LibC::Int
    fun g_crosses = OGR_G_Crosses(x0 : GeometryH, x1 : GeometryH) : LibC::Int
    fun g_within = OGR_G_Within(x0 : GeometryH, x1 : GeometryH) : LibC::Int
    fun g_contains = OGR_G_Contains(x0 : GeometryH, x1 : GeometryH) : LibC::Int
    fun g_overlaps = OGR_G_Overlaps(x0 : GeometryH, x1 : GeometryH) : LibC::Int
    fun g_boundary = OGR_G_Boundary(x0 : GeometryH) : GeometryH
    fun g_convex_hull = OGR_G_ConvexHull(x0 : GeometryH) : GeometryH
    fun g_buffer = OGR_G_Buffer(x0 : GeometryH, x1 : LibC::Double, x2 : LibC::Int) : GeometryH
    fun g_intersection = OGR_G_Intersection(x0 : GeometryH, x1 : GeometryH) : GeometryH
    fun g_union = OGR_G_Union(x0 : GeometryH, x1 : GeometryH) : GeometryH
    fun g_union_cascaded = OGR_G_UnionCascaded(x0 : GeometryH) : GeometryH
    fun g_point_on_surface = OGR_G_PointOnSurface(x0 : GeometryH) : GeometryH
    fun g_difference = OGR_G_Difference(x0 : GeometryH, x1 : GeometryH) : GeometryH
    fun g_sym_difference = OGR_G_SymDifference(x0 : GeometryH, x1 : GeometryH) : GeometryH
    fun g_distance = OGR_G_Distance(x0 : GeometryH, x1 : GeometryH) : LibC::Double
    fun g_distance3_d = OGR_G_Distance3D(x0 : GeometryH, x1 : GeometryH) : LibC::Double
    fun g_length = OGR_G_Length(x0 : GeometryH) : LibC::Double
    fun g_area = OGR_G_Area(x0 : GeometryH) : LibC::Double
    fun g_centroid = OGR_G_Centroid(x0 : GeometryH, x1 : GeometryH) : LibC::Int
    fun g_value = OGR_G_Value(x0 : GeometryH, df_distance : LibC::Double) : GeometryH
    fun g_empty = OGR_G_Empty(x0 : GeometryH)
    fun g_is_empty = OGR_G_IsEmpty(x0 : GeometryH) : LibC::Int
    fun g_is_valid = OGR_G_IsValid(x0 : GeometryH) : LibC::Int
    fun g_is_simple = OGR_G_IsSimple(x0 : GeometryH) : LibC::Int
    fun g_is_ring = OGR_G_IsRing(x0 : GeometryH) : LibC::Int
    fun g_polygonize = OGR_G_Polygonize(x0 : GeometryH) : GeometryH
    fun g_intersect = OGR_G_Intersect(x0 : GeometryH, x1 : GeometryH) : LibC::Int
    fun g_equal = OGR_G_Equal(x0 : GeometryH, x1 : GeometryH) : LibC::Int
    fun g_symmetric_difference = OGR_G_SymmetricDifference(x0 : GeometryH, x1 : GeometryH) : GeometryH
    fun g_get_area = OGR_G_GetArea(x0 : GeometryH) : LibC::Double
    fun g_get_boundary = OGR_G_GetBoundary(x0 : GeometryH) : GeometryH
    fun g_get_point_count = OGR_G_GetPointCount(x0 : GeometryH) : LibC::Int
    fun g_get_points = OGR_G_GetPoints(h_geom : GeometryH, paby_x : Void*, n_x_stride : LibC::Int, paby_y : Void*, n_y_stride : LibC::Int, paby_z : Void*, n_z_stride : LibC::Int) : LibC::Int
    fun g_get_points_zm = OGR_G_GetPointsZM(h_geom : GeometryH, paby_x : Void*, n_x_stride : LibC::Int, paby_y : Void*, n_y_stride : LibC::Int, paby_z : Void*, n_z_stride : LibC::Int, paby_m : Void*, n_m_stride : LibC::Int) : LibC::Int
    fun g_get_x = OGR_G_GetX(x0 : GeometryH, x1 : LibC::Int) : LibC::Double
    fun g_get_y = OGR_G_GetY(x0 : GeometryH, x1 : LibC::Int) : LibC::Double
    fun g_get_z = OGR_G_GetZ(x0 : GeometryH, x1 : LibC::Int) : LibC::Double
    fun g_get_m = OGR_G_GetM(x0 : GeometryH, x1 : LibC::Int) : LibC::Double
    fun g_get_point = OGR_G_GetPoint(x0 : GeometryH, i_point : LibC::Int, x2 : LibC::Double*, x3 : LibC::Double*, x4 : LibC::Double*)
    fun g_get_point_zm = OGR_G_GetPointZM(x0 : GeometryH, i_point : LibC::Int, x2 : LibC::Double*, x3 : LibC::Double*, x4 : LibC::Double*, x5 : LibC::Double*)
    fun g_set_point_count = OGR_G_SetPointCount(h_geom : GeometryH, n_new_point_count : LibC::Int)
    fun g_set_point = OGR_G_SetPoint(x0 : GeometryH, i_point : LibC::Int, x2 : LibC::Double, x3 : LibC::Double, x4 : LibC::Double)
    fun g_set_point_2_d = OGR_G_SetPoint_2D(x0 : GeometryH, i_point : LibC::Int, x2 : LibC::Double, x3 : LibC::Double)
    fun g_set_point_m = OGR_G_SetPointM(x0 : GeometryH, i_point : LibC::Int, x2 : LibC::Double, x3 : LibC::Double, x4 : LibC::Double)
    fun g_set_point_zm = OGR_G_SetPointZM(x0 : GeometryH, i_point : LibC::Int, x2 : LibC::Double, x3 : LibC::Double, x4 : LibC::Double, x5 : LibC::Double)
    fun g_add_point = OGR_G_AddPoint(x0 : GeometryH, x1 : LibC::Double, x2 : LibC::Double, x3 : LibC::Double)
    fun g_add_point_2_d = OGR_G_AddPoint_2D(x0 : GeometryH, x1 : LibC::Double, x2 : LibC::Double)
    fun g_add_point_m = OGR_G_AddPointM(x0 : GeometryH, x1 : LibC::Double, x2 : LibC::Double, x3 : LibC::Double)
    fun g_add_point_zm = OGR_G_AddPointZM(x0 : GeometryH, x1 : LibC::Double, x2 : LibC::Double, x3 : LibC::Double, x4 : LibC::Double)
    fun g_set_points = OGR_G_SetPoints(h_geom : GeometryH, n_points_in : LibC::Int, paby_x : Void*, n_x_stride : LibC::Int, paby_y : Void*, n_y_stride : LibC::Int, paby_z : Void*, n_z_stride : LibC::Int)
    fun g_set_points_zm = OGR_G_SetPointsZM(h_geom : GeometryH, n_points_in : LibC::Int, paby_x : Void*, n_x_stride : LibC::Int, paby_y : Void*, n_y_stride : LibC::Int, paby_z : Void*, n_z_stride : LibC::Int, paby_m : Void*, n_m_stride : LibC::Int)
    fun g_get_geometry_count = OGR_G_GetGeometryCount(x0 : GeometryH) : LibC::Int
    fun g_get_geometry_ref = OGR_G_GetGeometryRef(x0 : GeometryH, x1 : LibC::Int) : GeometryH
    fun g_add_geometry = OGR_G_AddGeometry(x0 : GeometryH, x1 : GeometryH) : Err
    fun g_add_geometry_directly = OGR_G_AddGeometryDirectly(x0 : GeometryH, x1 : GeometryH) : Err
    fun g_remove_geometry = OGR_G_RemoveGeometry(x0 : GeometryH, x1 : LibC::Int, x2 : LibC::Int) : Err
    fun g_has_curve_geometry = OGR_G_HasCurveGeometry(x0 : GeometryH, b_look_for_non_linear : LibC::Int) : LibC::Int
    fun g_get_linear_geometry = OGR_G_GetLinearGeometry(h_geom : GeometryH, df_max_angle_step_size_degrees : LibC::Double, papsz_options : LibC::Char**) : GeometryH
    fun g_get_curve_geometry = OGR_G_GetCurveGeometry(h_geom : GeometryH, papsz_options : LibC::Char**) : GeometryH
    fun build_polygon_from_edges = OGRBuildPolygonFromEdges(h_lines_as_collection : GeometryH, b_best_effort : LibC::Int, b_auto_close : LibC::Int, df_tolerance : LibC::Double, pe_err : Err*) : GeometryH
    fun set_generate_db2_v72_byte_order = OGRSetGenerate_DB2_V72_BYTE_ORDER(b_generate_db2_v72_byte_order : LibC::Int) : Err
    fun get_generate_db2_v72_byte_order = OGRGetGenerate_DB2_V72_BYTE_ORDER : LibC::Int
    fun set_non_linear_geometries_enabled_flag = OGRSetNonLinearGeometriesEnabledFlag(b_flag : LibC::Int)
    fun get_non_linear_geometries_enabled_flag = OGRGetNonLinearGeometriesEnabledFlag : LibC::Int
    alias GeomFieldDefnHs = Void
    fun fld_create = OGR_Fld_Create(x0 : LibC::Char*, x1 : FieldType) : FieldDefnH
    enum FieldType
      OftInteger = 0
      OftIntegerList = 1
      OftReal = 2
      OftRealList = 3
      OftString = 4
      OftStringList = 5
      OftWideString = 6
      OftWideStringList = 7
      OftBinary = 8
      OftDate = 9
      OftTime = 10
      OftDateTime = 11
      OftInteger64 = 12
      OftInteger64List = 13
      OftMaxType = 13
    end
    alias FieldDefnH = Void*
    fun fld_destroy = OGR_Fld_Destroy(x0 : FieldDefnH)
    fun fld_set_name = OGR_Fld_SetName(x0 : FieldDefnH, x1 : LibC::Char*)
    fun fld_get_name_ref = OGR_Fld_GetNameRef(x0 : FieldDefnH) : LibC::Char*
    fun fld_get_type = OGR_Fld_GetType(x0 : FieldDefnH) : FieldType
    fun fld_set_type = OGR_Fld_SetType(x0 : FieldDefnH, x1 : FieldType)
    fun fld_get_sub_type = OGR_Fld_GetSubType(x0 : FieldDefnH) : FieldSubType
    enum FieldSubType
      OfstNone = 0
      OfstBoolean = 1
      OfstInt16 = 2
      OfstFloat32 = 3
      OfstMaxSubType = 3
    end
    fun fld_set_sub_type = OGR_Fld_SetSubType(x0 : FieldDefnH, x1 : FieldSubType)
    fun fld_get_justify = OGR_Fld_GetJustify(x0 : FieldDefnH) : Justification
    enum Justification
      OjUndefined = 0
      OjLeft = 1
      OjRight = 2
    end
    fun fld_set_justify = OGR_Fld_SetJustify(x0 : FieldDefnH, x1 : Justification)
    fun fld_get_width = OGR_Fld_GetWidth(x0 : FieldDefnH) : LibC::Int
    fun fld_set_width = OGR_Fld_SetWidth(x0 : FieldDefnH, x1 : LibC::Int)
    fun fld_get_precision = OGR_Fld_GetPrecision(x0 : FieldDefnH) : LibC::Int
    fun fld_set_precision = OGR_Fld_SetPrecision(x0 : FieldDefnH, x1 : LibC::Int)
    fun fld_set = OGR_Fld_Set(x0 : FieldDefnH, x1 : LibC::Char*, x2 : FieldType, x3 : LibC::Int, x4 : LibC::Int, x5 : Justification)
    fun fld_is_ignored = OGR_Fld_IsIgnored(h_defn : FieldDefnH) : LibC::Int
    fun fld_set_ignored = OGR_Fld_SetIgnored(h_defn : FieldDefnH, x1 : LibC::Int)
    fun fld_is_nullable = OGR_Fld_IsNullable(h_defn : FieldDefnH) : LibC::Int
    fun fld_set_nullable = OGR_Fld_SetNullable(h_defn : FieldDefnH, x1 : LibC::Int)
    fun fld_get_default = OGR_Fld_GetDefault(h_defn : FieldDefnH) : LibC::Char*
    fun fld_set_default = OGR_Fld_SetDefault(h_defn : FieldDefnH, x1 : LibC::Char*)
    fun fld_is_default_driver_specific = OGR_Fld_IsDefaultDriverSpecific(h_defn : FieldDefnH) : LibC::Int
    fun get_field_type_name = OGR_GetFieldTypeName(x0 : FieldType) : LibC::Char*
    fun get_field_sub_type_name = OGR_GetFieldSubTypeName(x0 : FieldSubType) : LibC::Char*
    fun are_type_sub_type_compatible = OGR_AreTypeSubTypeCompatible(e_type : FieldType, e_sub_type : FieldSubType) : LibC::Int
    fun g_fld_create = OGR_GFld_Create(x0 : LibC::Char*, x1 : WkbGeometryType) : GeomFieldDefnH
    type GeomFieldDefnH = Void*
    fun g_fld_destroy = OGR_GFld_Destroy(x0 : GeomFieldDefnH)
    fun g_fld_set_name = OGR_GFld_SetName(x0 : GeomFieldDefnH, x1 : LibC::Char*)
    fun g_fld_get_name_ref = OGR_GFld_GetNameRef(x0 : GeomFieldDefnH) : LibC::Char*
    fun g_fld_get_type = OGR_GFld_GetType(x0 : GeomFieldDefnH) : WkbGeometryType
    fun g_fld_set_type = OGR_GFld_SetType(x0 : GeomFieldDefnH, x1 : WkbGeometryType)
    fun g_fld_get_spatial_ref = OGR_GFld_GetSpatialRef(x0 : GeomFieldDefnH) : SpatialReferenceH
    fun g_fld_set_spatial_ref = OGR_GFld_SetSpatialRef(x0 : GeomFieldDefnH, h_srs : SpatialReferenceH)
    fun g_fld_is_nullable = OGR_GFld_IsNullable(h_defn : GeomFieldDefnH) : LibC::Int
    fun g_fld_set_nullable = OGR_GFld_SetNullable(h_defn : GeomFieldDefnH, x1 : LibC::Int)
    fun g_fld_is_ignored = OGR_GFld_IsIgnored(h_defn : GeomFieldDefnH) : LibC::Int
    fun g_fld_set_ignored = OGR_GFld_SetIgnored(h_defn : GeomFieldDefnH, x1 : LibC::Int)
    fun fd_create = OGR_FD_Create(x0 : LibC::Char*) : FeatureDefnH
    alias FeatureDefnH = Void*
    fun fd_destroy = OGR_FD_Destroy(x0 : FeatureDefnH)
    fun fd_release = OGR_FD_Release(x0 : FeatureDefnH)
    fun fd_get_name = OGR_FD_GetName(x0 : FeatureDefnH) : LibC::Char*
    fun fd_get_field_count = OGR_FD_GetFieldCount(x0 : FeatureDefnH) : LibC::Int
    fun fd_get_field_defn = OGR_FD_GetFieldDefn(x0 : FeatureDefnH, x1 : LibC::Int) : FieldDefnH
    fun fd_get_field_index = OGR_FD_GetFieldIndex(x0 : FeatureDefnH, x1 : LibC::Char*) : LibC::Int
    fun fd_add_field_defn = OGR_FD_AddFieldDefn(x0 : FeatureDefnH, x1 : FieldDefnH)
    fun fd_delete_field_defn = OGR_FD_DeleteFieldDefn(h_defn : FeatureDefnH, i_field : LibC::Int) : Err
    fun fd_reorder_field_defns = OGR_FD_ReorderFieldDefns(h_defn : FeatureDefnH, pan_map : LibC::Int*) : Err
    fun fd_get_geom_type = OGR_FD_GetGeomType(x0 : FeatureDefnH) : WkbGeometryType
    fun fd_set_geom_type = OGR_FD_SetGeomType(x0 : FeatureDefnH, x1 : WkbGeometryType)
    fun fd_is_geometry_ignored = OGR_FD_IsGeometryIgnored(x0 : FeatureDefnH) : LibC::Int
    fun fd_set_geometry_ignored = OGR_FD_SetGeometryIgnored(x0 : FeatureDefnH, x1 : LibC::Int)
    fun fd_is_style_ignored = OGR_FD_IsStyleIgnored(x0 : FeatureDefnH) : LibC::Int
    fun fd_set_style_ignored = OGR_FD_SetStyleIgnored(x0 : FeatureDefnH, x1 : LibC::Int)
    fun fd_reference = OGR_FD_Reference(x0 : FeatureDefnH) : LibC::Int
    fun fd_dereference = OGR_FD_Dereference(x0 : FeatureDefnH) : LibC::Int
    fun fd_get_reference_count = OGR_FD_GetReferenceCount(x0 : FeatureDefnH) : LibC::Int
    fun fd_get_geom_field_count = OGR_FD_GetGeomFieldCount(h_f_defn : FeatureDefnH) : LibC::Int
    fun fd_get_geom_field_defn = OGR_FD_GetGeomFieldDefn(h_f_defn : FeatureDefnH, i : LibC::Int) : GeomFieldDefnH
    fun fd_get_geom_field_index = OGR_FD_GetGeomFieldIndex(h_f_defn : FeatureDefnH, psz_name : LibC::Char*) : LibC::Int
    fun fd_add_geom_field_defn = OGR_FD_AddGeomFieldDefn(h_f_defn : FeatureDefnH, h_g_fld_defn : GeomFieldDefnH)
    fun fd_delete_geom_field_defn = OGR_FD_DeleteGeomFieldDefn(h_f_defn : FeatureDefnH, i_geom_field : LibC::Int) : Err
    fun fd_is_same = OGR_FD_IsSame(h_f_defn : FeatureDefnH, h_other_f_defn : FeatureDefnH) : LibC::Int
    fun f_create = OGR_F_Create(x0 : FeatureDefnH) : FeatureH
    alias FeatureH = Void*
    fun f_destroy = OGR_F_Destroy(x0 : FeatureH)
    fun f_get_defn_ref = OGR_F_GetDefnRef(x0 : FeatureH) : FeatureDefnH
    fun f_set_geometry_directly = OGR_F_SetGeometryDirectly(x0 : FeatureH, x1 : GeometryH) : Err
    fun f_set_geometry = OGR_F_SetGeometry(x0 : FeatureH, x1 : GeometryH) : Err
    fun f_get_geometry_ref = OGR_F_GetGeometryRef(x0 : FeatureH) : GeometryH
    fun f_steal_geometry = OGR_F_StealGeometry(x0 : FeatureH) : GeometryH
    fun f_clone = OGR_F_Clone(x0 : FeatureH) : FeatureH
    fun f_equal = OGR_F_Equal(x0 : FeatureH, x1 : FeatureH) : LibC::Int
    fun f_get_field_count = OGR_F_GetFieldCount(x0 : FeatureH) : LibC::Int
    fun f_get_field_defn_ref = OGR_F_GetFieldDefnRef(x0 : FeatureH, x1 : LibC::Int) : FieldDefnH
    fun f_get_field_index = OGR_F_GetFieldIndex(x0 : FeatureH, x1 : LibC::Char*) : LibC::Int
    fun f_is_field_set = OGR_F_IsFieldSet(x0 : FeatureH, x1 : LibC::Int) : LibC::Int
    fun f_unset_field = OGR_F_UnsetField(x0 : FeatureH, x1 : LibC::Int)
    fun f_is_field_null = OGR_F_IsFieldNull(x0 : FeatureH, x1 : LibC::Int) : LibC::Int
    fun f_is_field_set_and_not_null = OGR_F_IsFieldSetAndNotNull(x0 : FeatureH, x1 : LibC::Int) : LibC::Int
    fun f_set_field_null = OGR_F_SetFieldNull(x0 : FeatureH, x1 : LibC::Int)
    fun f_get_raw_field_ref = OGR_F_GetRawFieldRef(x0 : FeatureH, x1 : LibC::Int) : Field*
    fun raw_field_is_unset = OGR_RawField_IsUnset(x0 : Field*) : LibC::Int
    fun raw_field_is_null = OGR_RawField_IsNull(x0 : Field*) : LibC::Int
    fun raw_field_set_unset = OGR_RawField_SetUnset(x0 : Field*)
    fun raw_field_set_null = OGR_RawField_SetNull(x0 : Field*)
    fun f_get_field_as_integer = OGR_F_GetFieldAsInteger(x0 : FeatureH, x1 : LibC::Int) : LibC::Int
    fun f_get_field_as_integer64 = OGR_F_GetFieldAsInteger64(x0 : FeatureH, x1 : LibC::Int) : GIntBig
    fun f_get_field_as_double = OGR_F_GetFieldAsDouble(x0 : FeatureH, x1 : LibC::Int) : LibC::Double
    fun f_get_field_as_string = OGR_F_GetFieldAsString(x0 : FeatureH, x1 : LibC::Int) : LibC::Char*
    fun f_get_field_as_integer_list = OGR_F_GetFieldAsIntegerList(x0 : FeatureH, x1 : LibC::Int, x2 : LibC::Int*) : LibC::Int*
    fun f_get_field_as_integer64_list = OGR_F_GetFieldAsInteger64List(x0 : FeatureH, x1 : LibC::Int, x2 : LibC::Int*) : GIntBig*
    fun f_get_field_as_double_list = OGR_F_GetFieldAsDoubleList(x0 : FeatureH, x1 : LibC::Int, x2 : LibC::Int*) : LibC::Double*
    fun f_get_field_as_string_list = OGR_F_GetFieldAsStringList(x0 : FeatureH, x1 : LibC::Int) : LibC::Char**
    fun f_get_field_as_binary = OGR_F_GetFieldAsBinary(x0 : FeatureH, x1 : LibC::Int, x2 : LibC::Int*) : GByte*
    fun f_get_field_as_date_time = OGR_F_GetFieldAsDateTime(x0 : FeatureH, x1 : LibC::Int, x2 : LibC::Int*, x3 : LibC::Int*, x4 : LibC::Int*, x5 : LibC::Int*, x6 : LibC::Int*, x7 : LibC::Int*, x8 : LibC::Int*) : LibC::Int
    fun f_get_field_as_date_time_ex = OGR_F_GetFieldAsDateTimeEx(h_feat : FeatureH, i_field : LibC::Int, pn_year : LibC::Int*, pn_month : LibC::Int*, pn_day : LibC::Int*, pn_hour : LibC::Int*, pn_minute : LibC::Int*, pf_second : LibC::Float*, pn_tz_flag : LibC::Int*) : LibC::Int
    fun f_set_field_integer = OGR_F_SetFieldInteger(x0 : FeatureH, x1 : LibC::Int, x2 : LibC::Int)
    fun f_set_field_integer64 = OGR_F_SetFieldInteger64(x0 : FeatureH, x1 : LibC::Int, x2 : GIntBig)
    fun f_set_field_double = OGR_F_SetFieldDouble(x0 : FeatureH, x1 : LibC::Int, x2 : LibC::Double)
    fun f_set_field_string = OGR_F_SetFieldString(x0 : FeatureH, x1 : LibC::Int, x2 : LibC::Char*)
    fun f_set_field_integer_list = OGR_F_SetFieldIntegerList(x0 : FeatureH, x1 : LibC::Int, x2 : LibC::Int, x3 : LibC::Int*)
    fun f_set_field_integer64_list = OGR_F_SetFieldInteger64List(x0 : FeatureH, x1 : LibC::Int, x2 : LibC::Int, x3 : GIntBig*)
    fun f_set_field_double_list = OGR_F_SetFieldDoubleList(x0 : FeatureH, x1 : LibC::Int, x2 : LibC::Int, x3 : LibC::Double*)
    fun f_set_field_string_list = OGR_F_SetFieldStringList(x0 : FeatureH, x1 : LibC::Int, x2 : LibC::Char**)
    fun f_set_field_raw = OGR_F_SetFieldRaw(x0 : FeatureH, x1 : LibC::Int, x2 : Field*)
    fun f_set_field_binary = OGR_F_SetFieldBinary(x0 : FeatureH, x1 : LibC::Int, x2 : LibC::Int, x3 : GByte*)
    fun f_set_field_date_time = OGR_F_SetFieldDateTime(x0 : FeatureH, x1 : LibC::Int, x2 : LibC::Int, x3 : LibC::Int, x4 : LibC::Int, x5 : LibC::Int, x6 : LibC::Int, x7 : LibC::Int, x8 : LibC::Int)
    fun f_set_field_date_time_ex = OGR_F_SetFieldDateTimeEx(x0 : FeatureH, x1 : LibC::Int, x2 : LibC::Int, x3 : LibC::Int, x4 : LibC::Int, x5 : LibC::Int, x6 : LibC::Int, x7 : LibC::Float, x8 : LibC::Int)
    fun f_get_geom_field_count = OGR_F_GetGeomFieldCount(h_feat : FeatureH) : LibC::Int
    fun f_get_geom_field_defn_ref = OGR_F_GetGeomFieldDefnRef(h_feat : FeatureH, i_field : LibC::Int) : GeomFieldDefnH
    fun f_get_geom_field_index = OGR_F_GetGeomFieldIndex(h_feat : FeatureH, psz_name : LibC::Char*) : LibC::Int
    fun f_get_geom_field_ref = OGR_F_GetGeomFieldRef(h_feat : FeatureH, i_field : LibC::Int) : GeometryH
    fun f_set_geom_field_directly = OGR_F_SetGeomFieldDirectly(h_feat : FeatureH, i_field : LibC::Int, h_geom : GeometryH) : Err
    fun f_set_geom_field = OGR_F_SetGeomField(h_feat : FeatureH, i_field : LibC::Int, h_geom : GeometryH) : Err
    fun f_get_fid = OGR_F_GetFID(x0 : FeatureH) : GIntBig
    fun f_set_fid = OGR_F_SetFID(x0 : FeatureH, x1 : GIntBig) : Err
    fun f_dump_readable = OGR_F_DumpReadable(x0 : FeatureH, x1 : File*)
    fun f_set_from = OGR_F_SetFrom(x0 : FeatureH, x1 : FeatureH, x2 : LibC::Int) : Err
    fun f_set_from_with_map = OGR_F_SetFromWithMap(x0 : FeatureH, x1 : FeatureH, x2 : LibC::Int, x3 : LibC::Int*) : Err
    fun f_get_style_string = OGR_F_GetStyleString(x0 : FeatureH) : LibC::Char*
    fun f_set_style_string = OGR_F_SetStyleString(x0 : FeatureH, x1 : LibC::Char*)
    fun f_set_style_string_directly = OGR_F_SetStyleStringDirectly(x0 : FeatureH, x1 : LibC::Char*)
    fun f_get_style_table = OGR_F_GetStyleTable(x0 : FeatureH) : StyleTableH
    alias StyleTableH = Void*
    fun f_set_style_table_directly = OGR_F_SetStyleTableDirectly(x0 : FeatureH, x1 : StyleTableH)
    fun f_set_style_table = OGR_F_SetStyleTable(x0 : FeatureH, x1 : StyleTableH)
    fun f_get_native_data = OGR_F_GetNativeData(x0 : FeatureH) : LibC::Char*
    fun f_set_native_data = OGR_F_SetNativeData(x0 : FeatureH, x1 : LibC::Char*)
    fun f_get_native_media_type = OGR_F_GetNativeMediaType(x0 : FeatureH) : LibC::Char*
    fun f_set_native_media_type = OGR_F_SetNativeMediaType(x0 : FeatureH, x1 : LibC::Char*)
    fun f_fill_unset_with_default = OGR_F_FillUnsetWithDefault(h_feat : FeatureH, b_not_nullable_only : LibC::Int, papsz_options : LibC::Char**)
    fun f_validate = OGR_F_Validate(x0 : FeatureH, n_validate_flags : LibC::Int, b_emit_error : LibC::Int) : LibC::Int
    fun l_get_name = OGR_L_GetName(x0 : LayerH) : LibC::Char*
    alias LayerH = Void*
    fun l_get_geom_type = OGR_L_GetGeomType(x0 : LayerH) : WkbGeometryType
    fun l_get_spatial_filter = OGR_L_GetSpatialFilter(x0 : LayerH) : GeometryH
    fun l_set_spatial_filter = OGR_L_SetSpatialFilter(x0 : LayerH, x1 : GeometryH)
    fun l_set_spatial_filter_rect = OGR_L_SetSpatialFilterRect(x0 : LayerH, x1 : LibC::Double, x2 : LibC::Double, x3 : LibC::Double, x4 : LibC::Double)
    fun l_set_spatial_filter_ex = OGR_L_SetSpatialFilterEx(x0 : LayerH, i_geom_field : LibC::Int, h_geom : GeometryH)
    fun l_set_spatial_filter_rect_ex = OGR_L_SetSpatialFilterRectEx(x0 : LayerH, i_geom_field : LibC::Int, df_min_x : LibC::Double, df_min_y : LibC::Double, df_max_x : LibC::Double, df_max_y : LibC::Double)
    fun l_set_attribute_filter = OGR_L_SetAttributeFilter(x0 : LayerH, x1 : LibC::Char*) : Err
    fun l_reset_reading = OGR_L_ResetReading(x0 : LayerH)
    fun l_get_next_feature = OGR_L_GetNextFeature(x0 : LayerH) : FeatureH
    fun l_set_next_by_index = OGR_L_SetNextByIndex(x0 : LayerH, x1 : GIntBig) : Err
    fun l_get_feature = OGR_L_GetFeature(x0 : LayerH, x1 : GIntBig) : FeatureH
    fun l_set_feature = OGR_L_SetFeature(x0 : LayerH, x1 : FeatureH) : Err
    fun l_create_feature = OGR_L_CreateFeature(x0 : LayerH, x1 : FeatureH) : Err
    fun l_delete_feature = OGR_L_DeleteFeature(x0 : LayerH, x1 : GIntBig) : Err
    fun l_get_layer_defn = OGR_L_GetLayerDefn(x0 : LayerH) : FeatureDefnH
    fun l_get_spatial_ref = OGR_L_GetSpatialRef(x0 : LayerH) : SpatialReferenceH
    fun l_find_field_index = OGR_L_FindFieldIndex(x0 : LayerH, x1 : LibC::Char*, b_exact_match : LibC::Int) : LibC::Int
    fun l_get_feature_count = OGR_L_GetFeatureCount(x0 : LayerH, x1 : LibC::Int) : GIntBig
    fun l_get_extent = OGR_L_GetExtent(x0 : LayerH, x1 : Envelope*, x2 : LibC::Int) : Err
    fun l_get_extent_ex = OGR_L_GetExtentEx(x0 : LayerH, i_geom_field : LibC::Int, ps_extent : Envelope*, b_force : LibC::Int) : Err
    fun l_test_capability = OGR_L_TestCapability(x0 : LayerH, x1 : LibC::Char*) : LibC::Int
    fun l_create_field = OGR_L_CreateField(x0 : LayerH, x1 : FieldDefnH, x2 : LibC::Int) : Err
    fun l_create_geom_field = OGR_L_CreateGeomField(h_layer : LayerH, h_field_defn : GeomFieldDefnH, b_force : LibC::Int) : Err
    fun l_delete_field = OGR_L_DeleteField(x0 : LayerH, i_field : LibC::Int) : Err
    fun l_reorder_fields = OGR_L_ReorderFields(x0 : LayerH, pan_map : LibC::Int*) : Err
    fun l_reorder_field = OGR_L_ReorderField(x0 : LayerH, i_old_field_pos : LibC::Int, i_new_field_pos : LibC::Int) : Err
    fun l_alter_field_defn = OGR_L_AlterFieldDefn(x0 : LayerH, i_field : LibC::Int, h_new_field_defn : FieldDefnH, n_flags : LibC::Int) : Err
    fun l_start_transaction = OGR_L_StartTransaction(x0 : LayerH) : Err
    fun l_commit_transaction = OGR_L_CommitTransaction(x0 : LayerH) : Err
    fun l_rollback_transaction = OGR_L_RollbackTransaction(x0 : LayerH) : Err
    fun l_reference = OGR_L_Reference(x0 : LayerH) : LibC::Int
    fun l_dereference = OGR_L_Dereference(x0 : LayerH) : LibC::Int
    fun l_get_ref_count = OGR_L_GetRefCount(x0 : LayerH) : LibC::Int
    fun l_sync_to_disk = OGR_L_SyncToDisk(x0 : LayerH) : Err
    fun l_get_features_read = OGR_L_GetFeaturesRead(x0 : LayerH) : GIntBig
    fun l_get_fid_column = OGR_L_GetFIDColumn(x0 : LayerH) : LibC::Char*
    fun l_get_geometry_column = OGR_L_GetGeometryColumn(x0 : LayerH) : LibC::Char*
    fun l_get_style_table = OGR_L_GetStyleTable(x0 : LayerH) : StyleTableH
    fun l_set_style_table_directly = OGR_L_SetStyleTableDirectly(x0 : LayerH, x1 : StyleTableH)
    fun l_set_style_table = OGR_L_SetStyleTable(x0 : LayerH, x1 : StyleTableH)
    fun l_set_ignored_fields = OGR_L_SetIgnoredFields(x0 : LayerH, x1 : LibC::Char**) : Err
    fun l_intersection = OGR_L_Intersection(x0 : LayerH, x1 : LayerH, x2 : LayerH, x3 : LibC::Char**, x4 : GdalProgressFunc, x5 : Void*) : Err
    alias GdalProgressFunc = (LibC::Double, LibC::Char*, Void* -> LibC::Int)
    fun l_union = OGR_L_Union(x0 : LayerH, x1 : LayerH, x2 : LayerH, x3 : LibC::Char**, x4 : GdalProgressFunc, x5 : Void*) : Err
    fun l_sym_difference = OGR_L_SymDifference(x0 : LayerH, x1 : LayerH, x2 : LayerH, x3 : LibC::Char**, x4 : GdalProgressFunc, x5 : Void*) : Err
    fun l_identity = OGR_L_Identity(x0 : LayerH, x1 : LayerH, x2 : LayerH, x3 : LibC::Char**, x4 : GdalProgressFunc, x5 : Void*) : Err
    fun l_update = OGR_L_Update(x0 : LayerH, x1 : LayerH, x2 : LayerH, x3 : LibC::Char**, x4 : GdalProgressFunc, x5 : Void*) : Err
    fun l_clip = OGR_L_Clip(x0 : LayerH, x1 : LayerH, x2 : LayerH, x3 : LibC::Char**, x4 : GdalProgressFunc, x5 : Void*) : Err
    fun l_erase = OGR_L_Erase(x0 : LayerH, x1 : LayerH, x2 : LayerH, x3 : LibC::Char**, x4 : GdalProgressFunc, x5 : Void*) : Err
    fun ds_destroy = OGR_DS_Destroy(x0 : DataSourceH)
    alias DataSourceH = Void*
    fun ds_get_name = OGR_DS_GetName(x0 : DataSourceH) : LibC::Char*
    fun ds_get_layer_count = OGR_DS_GetLayerCount(x0 : DataSourceH) : LibC::Int
    fun ds_get_layer = OGR_DS_GetLayer(x0 : DataSourceH, x1 : LibC::Int) : LayerH
    fun ds_get_layer_by_name = OGR_DS_GetLayerByName(x0 : DataSourceH, x1 : LibC::Char*) : LayerH
    fun ds_delete_layer = OGR_DS_DeleteLayer(x0 : DataSourceH, x1 : LibC::Int) : Err
    fun ds_get_driver = OGR_DS_GetDriver(x0 : DataSourceH) : SfDriverH
    alias SfDriverH = Void*
    fun ds_create_layer = OGR_DS_CreateLayer(x0 : DataSourceH, x1 : LibC::Char*, x2 : SpatialReferenceH, x3 : WkbGeometryType, x4 : LibC::Char**) : LayerH
    fun ds_copy_layer = OGR_DS_CopyLayer(x0 : DataSourceH, x1 : LayerH, x2 : LibC::Char*, x3 : LibC::Char**) : LayerH
    fun ds_test_capability = OGR_DS_TestCapability(x0 : DataSourceH, x1 : LibC::Char*) : LibC::Int
    fun ds_execute_sql = OGR_DS_ExecuteSQL(x0 : DataSourceH, x1 : LibC::Char*, x2 : GeometryH, x3 : LibC::Char*) : LayerH
    fun ds_release_result_set = OGR_DS_ReleaseResultSet(x0 : DataSourceH, x1 : LayerH)
    fun ds_reference = OGR_DS_Reference(x0 : DataSourceH) : LibC::Int
    fun ds_dereference = OGR_DS_Dereference(x0 : DataSourceH) : LibC::Int
    fun ds_get_ref_count = OGR_DS_GetRefCount(x0 : DataSourceH) : LibC::Int
    fun ds_get_summary_ref_count = OGR_DS_GetSummaryRefCount(x0 : DataSourceH) : LibC::Int
    fun ds_sync_to_disk = OGR_DS_SyncToDisk(x0 : DataSourceH) : Err
    fun ds_get_style_table = OGR_DS_GetStyleTable(x0 : DataSourceH) : StyleTableH
    fun ds_set_style_table_directly = OGR_DS_SetStyleTableDirectly(x0 : DataSourceH, x1 : StyleTableH)
    fun ds_set_style_table = OGR_DS_SetStyleTable(x0 : DataSourceH, x1 : StyleTableH)
    fun dr_get_name = OGR_Dr_GetName(x0 : SfDriverH) : LibC::Char*
    fun dr_open = OGR_Dr_Open(x0 : SfDriverH, x1 : LibC::Char*, x2 : LibC::Int) : DataSourceH
    fun dr_test_capability = OGR_Dr_TestCapability(x0 : SfDriverH, x1 : LibC::Char*) : LibC::Int
    fun dr_create_data_source = OGR_Dr_CreateDataSource(x0 : SfDriverH, x1 : LibC::Char*, x2 : LibC::Char**) : DataSourceH
    fun dr_copy_data_source = OGR_Dr_CopyDataSource(x0 : SfDriverH, x1 : DataSourceH, x2 : LibC::Char*, x3 : LibC::Char**) : DataSourceH
    fun dr_delete_data_source = OGR_Dr_DeleteDataSource(x0 : SfDriverH, x1 : LibC::Char*) : Err
    fun open = OGROpen(x0 : LibC::Char*, x1 : LibC::Int, x2 : SfDriverH*) : DataSourceH
    fun open_shared = OGROpenShared(x0 : LibC::Char*, x1 : LibC::Int, x2 : SfDriverH*) : DataSourceH
    fun release_data_source = OGRReleaseDataSource(x0 : DataSourceH) : Err
    fun register_driver = OGRRegisterDriver(x0 : SfDriverH)
    fun deregister_driver = OGRDeregisterDriver(x0 : SfDriverH)
    fun get_driver_count = OGRGetDriverCount : LibC::Int
    fun get_driver = OGRGetDriver(x0 : LibC::Int) : SfDriverH
    fun get_driver_by_name = OGRGetDriverByName(x0 : LibC::Char*) : SfDriverH
    fun get_open_ds_count = OGRGetOpenDSCount : LibC::Int
    fun get_open_ds = OGRGetOpenDS(i_ds : LibC::Int) : DataSourceH
    fun register_all = OGRRegisterAll
    fun cleanup_all = OGRCleanupAll
    fun sm_create = OGR_SM_Create(h_style_table : StyleTableH) : StyleMgrH
    alias StyleMgrH = Void*
    fun sm_destroy = OGR_SM_Destroy(h_sm : StyleMgrH)
    fun sm_init_from_feature = OGR_SM_InitFromFeature(h_sm : StyleMgrH, h_feat : FeatureH) : LibC::Char*
    fun sm_init_style_string = OGR_SM_InitStyleString(h_sm : StyleMgrH, psz_style_string : LibC::Char*) : LibC::Int
    fun sm_get_part_count = OGR_SM_GetPartCount(h_sm : StyleMgrH, psz_style_string : LibC::Char*) : LibC::Int
    fun sm_get_part = OGR_SM_GetPart(h_sm : StyleMgrH, n_part_id : LibC::Int, psz_style_string : LibC::Char*) : StyleToolH
    alias StyleToolH = Void*
    fun sm_add_part = OGR_SM_AddPart(h_sm : StyleMgrH, h_st : StyleToolH) : LibC::Int
    fun sm_add_style = OGR_SM_AddStyle(h_sm : StyleMgrH, psz_style_name : LibC::Char*, psz_style_string : LibC::Char*) : LibC::Int
    fun st_create = OGR_ST_Create(e_class_id : StClassId) : StyleToolH
    enum OgrStyleToolClassId
      StcNone = 0
      StcPen = 1
      StcBrush = 2
      StcSymbol = 3
      StcLabel = 4
      StcVector = 5
    end
    type StClassId = OgrStyleToolClassId
    fun st_destroy = OGR_ST_Destroy(h_st : StyleToolH)
    fun st_get_type = OGR_ST_GetType(h_st : StyleToolH) : StClassId
    fun st_get_unit = OGR_ST_GetUnit(h_st : StyleToolH) : StUnitId
    enum OgrStyleToolUnitsId
      StuGround = 0
      StuPixel = 1
      StuPoints = 2
      Stumm = 3
      Stucm = 4
      StuInches = 5
    end
    type StUnitId = OgrStyleToolUnitsId
    fun st_set_unit = OGR_ST_SetUnit(h_st : StyleToolH, e_unit : StUnitId, df_ground_paper_scale : LibC::Double)
    fun st_get_param_str = OGR_ST_GetParamStr(h_st : StyleToolH, e_param : LibC::Int, b_value_is_null : LibC::Int*) : LibC::Char*
    fun st_get_param_num = OGR_ST_GetParamNum(h_st : StyleToolH, e_param : LibC::Int, b_value_is_null : LibC::Int*) : LibC::Int
    fun st_get_param_dbl = OGR_ST_GetParamDbl(h_st : StyleToolH, e_param : LibC::Int, b_value_is_null : LibC::Int*) : LibC::Double
    fun st_set_param_str = OGR_ST_SetParamStr(h_st : StyleToolH, e_param : LibC::Int, psz_value : LibC::Char*)
    fun st_set_param_num = OGR_ST_SetParamNum(h_st : StyleToolH, e_param : LibC::Int, n_value : LibC::Int)
    fun st_set_param_dbl = OGR_ST_SetParamDbl(h_st : StyleToolH, e_param : LibC::Int, df_value : LibC::Double)
    fun st_get_style_string = OGR_ST_GetStyleString(h_st : StyleToolH) : LibC::Char*
    fun st_get_rgb_from_string = OGR_ST_GetRGBFromString(h_st : StyleToolH, psz_color : LibC::Char*, pn_red : LibC::Int*, pn_green : LibC::Int*, pn_blue : LibC::Int*, pn_alpha : LibC::Int*) : LibC::Int
    fun stbl_create = OGR_STBL_Create : StyleTableH
    fun stbl_destroy = OGR_STBL_Destroy(h_stbl : StyleTableH)
    fun stbl_add_style = OGR_STBL_AddStyle(h_style_table : StyleTableH, psz_name : LibC::Char*, psz_style_string : LibC::Char*) : LibC::Int
    fun stbl_save_style_table = OGR_STBL_SaveStyleTable(h_style_table : StyleTableH, psz_filename : LibC::Char*) : LibC::Int
    fun stbl_load_style_table = OGR_STBL_LoadStyleTable(h_style_table : StyleTableH, psz_filename : LibC::Char*) : LibC::Int
    fun stbl_find = OGR_STBL_Find(h_style_table : StyleTableH, psz_name : LibC::Char*) : LibC::Char*
    fun stbl_reset_style_string_reading = OGR_STBL_ResetStyleStringReading(h_style_table : StyleTableH)
    fun stbl_get_next_style = OGR_STBL_GetNextStyle(h_style_table : StyleTableH) : LibC::Char*
    fun stbl_get_last_style_name = OGR_STBL_GetLastStyleName(h_style_table : StyleTableH) : LibC::Char*
  end
end
