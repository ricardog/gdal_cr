module GDAL
  {% begin %}
    {% gdal_datadir = `gdal-config --datadir`.split.last %}  
    {% gdal_formats = `gdal-config --formats`.split %}
    lib Lib
      DATADIR = {{ gdal_datadir }}
      FORMATS = {{ gdal_formats }}
    end
  {% end %}

  @[Link(ldflags: "`gdal-config --libs`")]
  lib Lib
    VERSION_MAJOR = 2
    VERSION_MINOR = 2
    VERSION_REV = 3
    VERSION_BUILD = 0
    RELEASE_DATE = 20171120
    OF_READONLY = 0
    OF_UPDATE = 1
    OF_ALL = 0
    OF_RASTER = 2
    OF_VECTOR = 4
    OF_GNM = 8
    OF_KIND_MASK = 30
    OF_SHARED = 32
    OF_VERBOSE_ERROR = 64
    OF_INTERNAL = 128
    OF_DEFAULT_BLOCK_ACCESS = 0
    OF_ARRAY_BLOCK_ACCESS = 256
    OF_HASHSET_BLOCK_ACCESS = 512
    OF_RESERVED_1 = 768
    OF_BLOCK_ACCESS_MASK = 768
    DATA_COVERAGE_STATUS_UNIMPLEMENTED = 1
    DATA_COVERAGE_STATUS_DATA = 2
    DATA_COVERAGE_STATUS_EMPTY = 4
    fun dummy_progress = GDALDummyProgress(x0 : LibC::Double, x1 : LibC::Char*, x2 : Void*) : LibC::Int
    fun term_progress = GDALTermProgress(x0 : LibC::Double, x1 : LibC::Char*, x2 : Void*) : LibC::Int
    fun scaled_progress = GDALScaledProgress(x0 : LibC::Double, x1 : LibC::Char*, x2 : Void*) : LibC::Int
    fun create_scaled_progress = GDALCreateScaledProgress(x0 : LibC::Double, x1 : LibC::Double, x2 : ProgressFunc, x3 : Void*) : Void*
    alias ProgressFunc = (LibC::Double, LibC::Char*, Void* -> LibC::Int)
    fun destroy_scaled_progress = GDALDestroyScaledProgress(x0 : Void*)
    fun version_info = GDALVersionInfo(x0 : LibC::Char*) : LibC::Char*
    fun check_version = GDALCheckVersion(n_version_major : LibC::Int, n_version_minor : LibC::Int, psz_calling_component_name : LibC::Char*) : LibC::Int
    fun get_data_type_size = GDALGetDataTypeSize(x0 : DataType) : LibC::Int
    enum DataType
      GdtUnknown = 0
      GdtByte = 1
      GdtUInt16 = 2
      GdtInt16 = 3
      GdtUInt32 = 4
      GdtInt32 = 5
      GdtFloat32 = 6
      GdtFloat64 = 7
      GdtCInt16 = 8
      GdtCInt32 = 9
      GdtCFloat32 = 10
      GdtCFloat64 = 11
      GdtTypeCount = 12
    end
    fun get_data_type_size_bits = GDALGetDataTypeSizeBits(e_data_type : DataType) : LibC::Int
    fun get_data_type_size_bytes = GDALGetDataTypeSizeBytes(x0 : DataType) : LibC::Int
    fun data_type_is_complex = GDALDataTypeIsComplex(x0 : DataType) : LibC::Int
    fun get_data_type_name = GDALGetDataTypeName(x0 : DataType) : LibC::Char*
    fun get_data_type_by_name = GDALGetDataTypeByName(x0 : LibC::Char*) : DataType
    fun data_type_union = GDALDataTypeUnion(x0 : DataType, x1 : DataType) : DataType
    fun adjust_value_to_data_type = GDALAdjustValueToDataType(e_dt : DataType, df_value : LibC::Double, pb_clamped : LibC::Int*, pb_rounded : LibC::Int*) : LibC::Double
    fun get_non_complex_data_type = GDALGetNonComplexDataType(x0 : DataType) : DataType
    fun get_async_status_type_name = GDALGetAsyncStatusTypeName(x0 : AsyncStatusType) : LibC::Char*
    enum AsyncStatusType
      GarioPending = 0
      GarioUpdate = 1
      GarioError = 2
      GarioComplete = 3
      GarioTypeCount = 4
    end
    fun get_async_status_type_by_name = GDALGetAsyncStatusTypeByName(x0 : LibC::Char*) : AsyncStatusType
    fun get_color_interpretation_name = GDALGetColorInterpretationName(x0 : ColorInterp) : LibC::Char*
    enum ColorInterp
      GciUndefined = 0
      GciGrayIndex = 1
      GciPaletteIndex = 2
      GciRedBand = 3
      GciGreenBand = 4
      GciBlueBand = 5
      GciAlphaBand = 6
      GciHueBand = 7
      GciSaturationBand = 8
      GciLightnessBand = 9
      GciCyanBand = 10
      GciMagentaBand = 11
      GciYellowBand = 12
      GciBlackBand = 13
      GciYCbCrYBand = 14
      GciYCbCrCbBand = 15
      GciYCbCrCrBand = 16
      GciMax = 16
    end
    fun get_color_interpretation_by_name = GDALGetColorInterpretationByName(psz_name : LibC::Char*) : ColorInterp
    fun get_palette_interpretation_name = GDALGetPaletteInterpretationName(x0 : PaletteInterp) : LibC::Char*
    enum PaletteInterp
      GpiGray = 0
      GpiRgb = 1
      GpiCmyk = 2
      GpiHls = 3
    end
    fun all_register = GDALAllRegister
    fun create = GDALCreate(h_driver : DriverH, x1 : LibC::Char*, x2 : LibC::Int, x3 : LibC::Int, x4 : LibC::Int, x5 : DataType, x6 : LibC::Char**) : DatasetH
    alias DriverH = Void*
    alias DatasetH = Void*
    fun create_copy = GDALCreateCopy(x0 : DriverH, x1 : LibC::Char*, x2 : DatasetH, x3 : LibC::Int, x4 : LibC::Char**, x5 : ProgressFunc, x6 : Void*) : DatasetH
    fun identify_driver = GDALIdentifyDriver(psz_filename : LibC::Char*, papsz_file_list : LibC::Char**) : DriverH
    fun identify_driver_ex = GDALIdentifyDriverEx(psz_filename : LibC::Char*, n_identify_flags : LibC::UInt, papsz_allowed_drivers : LibC::Char**, papsz_file_list : LibC::Char**) : DriverH

    fun open = GDALOpen(psz_filename : LibC::Char*, e_access : Access) : DatasetH
    enum Access
      GaReadOnly = 0
      GaUpdate = 1
    end
    fun open_shared = GDALOpenShared(x0 : LibC::Char*, x1 : Access) : DatasetH
    fun open_ex = GDALOpenEx(psz_filename : LibC::Char*, n_open_flags : LibC::UInt, papsz_allowed_drivers : LibC::Char**, papsz_open_options : LibC::Char**, papsz_sibling_files : LibC::Char**) : DatasetH
    fun dump_open_datasets = GDALDumpOpenDatasets(x0 : File*) : LibC::Int
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
    fun get_driver_by_name = GDALGetDriverByName(x0 : LibC::Char*) : DriverH
    fun get_driver_count = GDALGetDriverCount : LibC::Int
    fun get_driver = GDALGetDriver(x0 : LibC::Int) : DriverH
    fun create_driver = GDALCreateDriver : DriverH
    fun destroy_driver = GDALDestroyDriver(x0 : DriverH)
    fun register_driver = GDALRegisterDriver(x0 : DriverH) : LibC::Int
    fun deregister_driver = GDALDeregisterDriver(x0 : DriverH)
    fun destroy_driver_manager = GDALDestroyDriverManager
    fun destroy = GDALDestroy
    fun delete_dataset = GDALDeleteDataset(x0 : DriverH, x1 : LibC::Char*) : CplErr
    enum CplErr
      CeNone = 0
      CeDebug = 1
      CeWarning = 2
      CeFailure = 3
      CeFatal = 4
    end
    fun rename_dataset = GDALRenameDataset(x0 : DriverH, psz_new_name : LibC::Char*, psz_old_name : LibC::Char*) : CplErr
    fun copy_dataset_files = GDALCopyDatasetFiles(x0 : DriverH, psz_new_name : LibC::Char*, psz_old_name : LibC::Char*) : CplErr
    fun validate_creation_options = GDALValidateCreationOptions(x0 : DriverH, papsz_creation_options : LibC::Char**) : LibC::Int
    fun get_driver_short_name = GDALGetDriverShortName(x0 : DriverH) : LibC::Char*
    fun get_driver_long_name = GDALGetDriverLongName(x0 : DriverH) : LibC::Char*
    fun get_driver_help_topic = GDALGetDriverHelpTopic(x0 : DriverH) : LibC::Char*
    fun get_driver_creation_option_list = GDALGetDriverCreationOptionList(x0 : DriverH) : LibC::Char*
    fun init_gc_ps = GDALInitGCPs(x0 : LibC::Int, x1 : Gcp*)
    struct Gcp
      psz_id : LibC::Char*
      psz_info : LibC::Char*
      df_gcp_pixel : LibC::Double
      df_gcp_line : LibC::Double
      df_gcpx : LibC::Double
      df_gcpy : LibC::Double
      df_gcpz : LibC::Double
    end
    fun deinit_gc_ps = GDALDeinitGCPs(x0 : LibC::Int, x1 : Gcp*)
    fun duplicate_gc_ps = GDALDuplicateGCPs(x0 : LibC::Int, x1 : Gcp*) : Gcp*
    fun gc_ps_to_geo_transform = GDALGCPsToGeoTransform(n_gcp_count : LibC::Int, pas_gc_ps : Gcp*, padf_geo_transform : LibC::Double*, b_approx_ok : LibC::Int) : LibC::Int
    fun inv_geo_transform = GDALInvGeoTransform(padf_geo_transform_in : LibC::Double*, padf_inv_geo_transform_out : LibC::Double*) : LibC::Int
    fun apply_geo_transform = GDALApplyGeoTransform(x0 : LibC::Double*, x1 : LibC::Double, x2 : LibC::Double, x3 : LibC::Double*, x4 : LibC::Double*)
    fun compose_geo_transforms = GDALComposeGeoTransforms(padf_geo_transform1 : LibC::Double*, padf_geo_transform2 : LibC::Double*, padf_geo_transform_out : LibC::Double*)
    fun get_metadata_domain_list = GDALGetMetadataDomainList(h_object : MajorObjectH) : LibC::Char**
    alias MajorObjectH = Void*
    fun get_metadata = GDALGetMetadata(x0 : MajorObjectH, x1 : LibC::Char*) : LibC::Char**
    fun set_metadata = GDALSetMetadata(x0 : MajorObjectH, x1 : LibC::Char**, x2 : LibC::Char*) : CplErr
    fun get_metadata_item = GDALGetMetadataItem(x0 : MajorObjectH, x1 : LibC::Char*, x2 : LibC::Char*) : LibC::Char*
    fun set_metadata_item = GDALSetMetadataItem(x0 : MajorObjectH, x1 : LibC::Char*, x2 : LibC::Char*, x3 : LibC::Char*) : CplErr
    fun get_description = GDALGetDescription(x0 : MajorObjectH) : LibC::Char*
    fun set_description = GDALSetDescription(x0 : MajorObjectH, x1 : LibC::Char*)
    fun get_dataset_driver = GDALGetDatasetDriver(x0 : DatasetH) : DriverH
    fun get_file_list = GDALGetFileList(x0 : DatasetH) : LibC::Char**
    fun close = GDALClose(x0 : DatasetH)
    fun get_raster_x_size = GDALGetRasterXSize(x0 : DatasetH) : LibC::Int
    fun get_raster_y_size = GDALGetRasterYSize(x0 : DatasetH) : LibC::Int
    fun get_raster_count = GDALGetRasterCount(x0 : DatasetH) : LibC::Int
    fun get_raster_band = GDALGetRasterBand(x0 : DatasetH, x1 : LibC::Int) : RasterBandH
    alias RasterBandH = Void*
    fun add_band = GDALAddBand(h_ds : DatasetH, e_type : DataType, papsz_options : LibC::Char**) : CplErr
    fun begin_async_reader = GDALBeginAsyncReader(h_ds : DatasetH, n_x_off : LibC::Int, n_y_off : LibC::Int, n_x_size : LibC::Int, n_y_size : LibC::Int, p_buf : Void*, n_buf_x_size : LibC::Int, n_buf_y_size : LibC::Int, e_buf_type : DataType, n_band_count : LibC::Int, pan_band_map : LibC::Int*, n_pixel_space : LibC::Int, n_line_space : LibC::Int, n_band_space : LibC::Int, papsz_options : LibC::Char**) : AsyncReaderH
    alias AsyncReaderH = Void*
    fun end_async_reader = GDALEndAsyncReader(h_ds : DatasetH, h_asynch_reader_h : AsyncReaderH)
    fun dataset_raster_io = GDALDatasetRasterIO(h_ds : DatasetH, e_rw_flag : RwFlag, n_dsx_off : LibC::Int, n_dsy_off : LibC::Int, n_dsx_size : LibC::Int, n_dsy_size : LibC::Int, p_buffer : Void*, n_bx_size : LibC::Int, n_by_size : LibC::Int, e_b_data_type : DataType, n_band_count : LibC::Int, pan_band_count : LibC::Int*, n_pixel_space : LibC::Int, n_line_space : LibC::Int, n_band_space : LibC::Int) : CplErr
    enum RwFlag
      GfRead = 0
      GfWrite = 1
    end
    fun dataset_raster_io_ex = GDALDatasetRasterIOEx(h_ds : DatasetH, e_rw_flag : RwFlag, n_dsx_off : LibC::Int, n_dsy_off : LibC::Int, n_dsx_size : LibC::Int, n_dsy_size : LibC::Int, p_buffer : Void*, n_bx_size : LibC::Int, n_by_size : LibC::Int, e_b_data_type : DataType, n_band_count : LibC::Int, pan_band_count : LibC::Int*, n_pixel_space : GSpacing, n_line_space : GSpacing, n_band_space : GSpacing, ps_extra_arg : RasterIoExtraArg*) : CplErr
    alias GIntBig = LibC::LongLong
    alias GSpacing = GIntBig
    struct RasterIoExtraArg
      n_version : LibC::Int
      e_resample_alg : RioResampleAlg
      pfn_progress : ProgressFunc
      p_progress_data : Void*
      b_floating_point_window_validity : LibC::Int
      df_x_off : LibC::Double
      df_y_off : LibC::Double
      df_x_size : LibC::Double
      df_y_size : LibC::Double
    end
    enum RioResampleAlg
      GrioraNearestNeighbour = 0
      GrioraBilinear = 1
      GrioraCubic = 2
      GrioraCubicSpline = 3
      GrioraLanczos = 4
      GrioraAverage = 5
      GrioraMode = 6
      GrioraGauss = 7
    end
    fun dataset_advise_read = GDALDatasetAdviseRead(h_ds : DatasetH, n_dsx_off : LibC::Int, n_dsy_off : LibC::Int, n_dsx_size : LibC::Int, n_dsy_size : LibC::Int, n_bx_size : LibC::Int, n_by_size : LibC::Int, e_b_data_type : DataType, n_band_count : LibC::Int, pan_band_count : LibC::Int*, papsz_options : LibC::Char**) : CplErr
    fun get_projection_ref = GDALGetProjectionRef(x0 : DatasetH) : LibC::Char*
    fun set_projection = GDALSetProjection(x0 : DatasetH, x1 : LibC::Char*) : CplErr
    fun get_geo_transform = GDALGetGeoTransform(x0 : DatasetH, x1 : LibC::Double*) : CplErr
    fun set_geo_transform = GDALSetGeoTransform(x0 : DatasetH, x1 : LibC::Double*) : CplErr
    fun get_gcp_count = GDALGetGCPCount(x0 : DatasetH) : LibC::Int
    fun get_gcp_projection = GDALGetGCPProjection(x0 : DatasetH) : LibC::Char*
    fun get_gc_ps = GDALGetGCPs(x0 : DatasetH) : Gcp*
    fun set_gc_ps = GDALSetGCPs(x0 : DatasetH, x1 : LibC::Int, x2 : Gcp*, x3 : LibC::Char*) : CplErr
    fun get_internal_handle = GDALGetInternalHandle(x0 : DatasetH, x1 : LibC::Char*) : Void*
    fun reference_dataset = GDALReferenceDataset(x0 : DatasetH) : LibC::Int
    fun dereference_dataset = GDALDereferenceDataset(x0 : DatasetH) : LibC::Int
    fun release_dataset = GDALReleaseDataset(x0 : DatasetH) : LibC::Int
    fun build_overviews = GDALBuildOverviews(x0 : DatasetH, x1 : LibC::Char*, x2 : LibC::Int, x3 : LibC::Int*, x4 : LibC::Int, x5 : LibC::Int*, x6 : ProgressFunc, x7 : Void*) : CplErr
    fun get_open_datasets = GDALGetOpenDatasets(h_ds : DatasetH**, pn_count : LibC::Int*)
    fun get_access = GDALGetAccess(h_ds : DatasetH) : LibC::Int
    fun flush_cache = GDALFlushCache(h_ds : DatasetH)
    fun create_dataset_mask_band = GDALCreateDatasetMaskBand(h_ds : DatasetH, n_flags : LibC::Int) : CplErr
    fun dataset_copy_whole_raster = GDALDatasetCopyWholeRaster(h_src_ds : DatasetH, h_dst_ds : DatasetH, papsz_options : LibC::Char**, pfn_progress : ProgressFunc, p_progress_data : Void*) : CplErr
    fun raster_band_copy_whole_raster = GDALRasterBandCopyWholeRaster(h_src_band : RasterBandH, h_dst_band : RasterBandH, constpapsz_options : LibC::Char**, pfn_progress : ProgressFunc, p_progress_data : Void*) : CplErr
    fun regenerate_overviews = GDALRegenerateOverviews(h_src_band : RasterBandH, n_overview_count : LibC::Int, pah_overview_bands : RasterBandH*, psz_resampling : LibC::Char*, pfn_progress : ProgressFunc, p_progress_data : Void*) : CplErr
    fun dataset_get_layer_count = GDALDatasetGetLayerCount(x0 : DatasetH) : LibC::Int
    fun dataset_get_layer = GDALDatasetGetLayer(x0 : DatasetH, x1 : LibC::Int) : OgrLayerH
    alias OgrLayerH = Void*
    fun dataset_get_layer_by_name = GDALDatasetGetLayerByName(x0 : DatasetH, x1 : LibC::Char*) : OgrLayerH
    fun dataset_delete_layer = GDALDatasetDeleteLayer(x0 : DatasetH, x1 : LibC::Int) : OgrErr
    alias OgrErr = LibC::Int
    fun dataset_create_layer = GDALDatasetCreateLayer(x0 : DatasetH, x1 : LibC::Char*, x2 : OgrSpatialReferenceH, x3 : OgRwkbGeometryType, x4 : LibC::Char**) : OgrLayerH
    alias OgrSpatialReferenceH = Void*
    enum OgRwkbGeometryType
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
    fun dataset_copy_layer = GDALDatasetCopyLayer(x0 : DatasetH, x1 : OgrLayerH, x2 : LibC::Char*, x3 : LibC::Char**) : OgrLayerH
    fun dataset_reset_reading = GDALDatasetResetReading(x0 : DatasetH)
    fun dataset_get_next_feature = GDALDatasetGetNextFeature(h_ds : DatasetH, ph_belonging_layer : OgrLayerH*, pdf_progress_pct : LibC::Double*, pfn_progress : ProgressFunc, p_progress_data : Void*) : OgrFeatureH
    alias OgrFeatureH = Void*
    fun dataset_test_capability = GDALDatasetTestCapability(x0 : DatasetH, x1 : LibC::Char*) : LibC::Int
    fun dataset_execute_sql = GDALDatasetExecuteSQL(x0 : DatasetH, x1 : LibC::Char*, x2 : OgrGeometryH, x3 : LibC::Char*) : OgrLayerH
    alias OgrGeometryH = Void*
    fun dataset_release_result_set = GDALDatasetReleaseResultSet(x0 : DatasetH, x1 : OgrLayerH)
    fun dataset_get_style_table = GDALDatasetGetStyleTable(x0 : DatasetH) : OgrStyleTableH
    alias OgrStyleTableH = Void*
    fun dataset_set_style_table_directly = GDALDatasetSetStyleTableDirectly(x0 : DatasetH, x1 : OgrStyleTableH)
    fun dataset_set_style_table = GDALDatasetSetStyleTable(x0 : DatasetH, x1 : OgrStyleTableH)
    fun dataset_start_transaction = GDALDatasetStartTransaction(h_ds : DatasetH, b_force : LibC::Int) : OgrErr
    fun dataset_commit_transaction = GDALDatasetCommitTransaction(h_ds : DatasetH) : OgrErr
    fun dataset_rollback_transaction = GDALDatasetRollbackTransaction(h_ds : DatasetH) : OgrErr
    fun get_raster_data_type = GDALGetRasterDataType(x0 : RasterBandH) : DataType
    fun get_block_size = GDALGetBlockSize(x0 : RasterBandH, pn_x_size : LibC::Int*, pn_y_size : LibC::Int*)
    fun get_actual_block_size = GDALGetActualBlockSize(x0 : RasterBandH, n_x_block_off : LibC::Int, n_y_block_off : LibC::Int, pn_x_valid : LibC::Int*, pn_y_valid : LibC::Int*) : CplErr
    fun raster_advise_read = GDALRasterAdviseRead(h_rb : RasterBandH, n_dsx_off : LibC::Int, n_dsy_off : LibC::Int, n_dsx_size : LibC::Int, n_dsy_size : LibC::Int, n_bx_size : LibC::Int, n_by_size : LibC::Int, e_b_data_type : DataType, papsz_options : LibC::Char**) : CplErr
    fun raster_io = GDALRasterIO(h_r_band : RasterBandH, e_rw_flag : RwFlag, n_dsx_off : LibC::Int, n_dsy_off : LibC::Int, n_dsx_size : LibC::Int, n_dsy_size : LibC::Int, p_buffer : Void*, n_bx_size : LibC::Int, n_by_size : LibC::Int, e_b_data_type : DataType, n_pixel_space : LibC::Int, n_line_space : LibC::Int) : CplErr
    fun raster_io_ex = GDALRasterIOEx(h_r_band : RasterBandH, e_rw_flag : RwFlag, n_dsx_off : LibC::Int, n_dsy_off : LibC::Int, n_dsx_size : LibC::Int, n_dsy_size : LibC::Int, p_buffer : Void*, n_bx_size : LibC::Int, n_by_size : LibC::Int, e_b_data_type : DataType, n_pixel_space : GSpacing, n_line_space : GSpacing, ps_extra_arg : RasterIoExtraArg*) : CplErr
    fun read_block = GDALReadBlock(x0 : RasterBandH, x1 : LibC::Int, x2 : LibC::Int, x3 : Void*) : CplErr
    fun write_block = GDALWriteBlock(x0 : RasterBandH, x1 : LibC::Int, x2 : LibC::Int, x3 : Void*) : CplErr
    fun get_raster_band_x_size = GDALGetRasterBandXSize(x0 : RasterBandH) : LibC::Int
    fun get_raster_band_y_size = GDALGetRasterBandYSize(x0 : RasterBandH) : LibC::Int
    fun get_raster_access = GDALGetRasterAccess(x0 : RasterBandH) : Access
    fun get_band_number = GDALGetBandNumber(x0 : RasterBandH) : LibC::Int
    fun get_band_dataset = GDALGetBandDataset(x0 : RasterBandH) : DatasetH
    fun get_raster_color_interpretation = GDALGetRasterColorInterpretation(x0 : RasterBandH) : ColorInterp
    fun set_raster_color_interpretation = GDALSetRasterColorInterpretation(x0 : RasterBandH, x1 : ColorInterp) : CplErr
    fun get_raster_color_table = GDALGetRasterColorTable(x0 : RasterBandH) : ColorTableH
    alias ColorTableH = Void*
    fun set_raster_color_table = GDALSetRasterColorTable(x0 : RasterBandH, x1 : ColorTableH) : CplErr
    fun has_arbitrary_overviews = GDALHasArbitraryOverviews(x0 : RasterBandH) : LibC::Int
    fun get_overview_count = GDALGetOverviewCount(x0 : RasterBandH) : LibC::Int
    fun get_overview = GDALGetOverview(x0 : RasterBandH, x1 : LibC::Int) : RasterBandH
    fun get_raster_no_data_value = GDALGetRasterNoDataValue(x0 : RasterBandH, x1 : LibC::Int*) : LibC::Double
    fun set_raster_no_data_value = GDALSetRasterNoDataValue(x0 : RasterBandH, x1 : LibC::Double) : CplErr
    fun delete_raster_no_data_value = GDALDeleteRasterNoDataValue(x0 : RasterBandH) : CplErr
    fun get_raster_category_names = GDALGetRasterCategoryNames(x0 : RasterBandH) : LibC::Char**
    fun set_raster_category_names = GDALSetRasterCategoryNames(x0 : RasterBandH, x1 : LibC::Char**) : CplErr
    fun get_raster_minimum = GDALGetRasterMinimum(x0 : RasterBandH, pb_success : LibC::Int*) : LibC::Double
    fun get_raster_maximum = GDALGetRasterMaximum(x0 : RasterBandH, pb_success : LibC::Int*) : LibC::Double
    fun get_raster_statistics = GDALGetRasterStatistics(x0 : RasterBandH, b_approx_ok : LibC::Int, b_force : LibC::Int, pdf_min : LibC::Double*, pdf_max : LibC::Double*, pdf_mean : LibC::Double*, pdf_std_dev : LibC::Double*) : CplErr
    fun compute_raster_statistics = GDALComputeRasterStatistics(x0 : RasterBandH, b_approx_ok : LibC::Int, pdf_min : LibC::Double*, pdf_max : LibC::Double*, pdf_mean : LibC::Double*, pdf_std_dev : LibC::Double*, pfn_progress : ProgressFunc, p_progress_data : Void*) : CplErr
    fun set_raster_statistics = GDALSetRasterStatistics(h_band : RasterBandH, df_min : LibC::Double, df_max : LibC::Double, df_mean : LibC::Double, df_std_dev : LibC::Double) : CplErr
    fun get_raster_unit_type = GDALGetRasterUnitType(x0 : RasterBandH) : LibC::Char*
    fun set_raster_unit_type = GDALSetRasterUnitType(h_band : RasterBandH, psz_new_value : LibC::Char*) : CplErr
    fun get_raster_offset = GDALGetRasterOffset(x0 : RasterBandH, pb_success : LibC::Int*) : LibC::Double
    fun set_raster_offset = GDALSetRasterOffset(h_band : RasterBandH, df_new_offset : LibC::Double) : CplErr
    fun get_raster_scale = GDALGetRasterScale(x0 : RasterBandH, pb_success : LibC::Int*) : LibC::Double
    fun set_raster_scale = GDALSetRasterScale(h_band : RasterBandH, df_new_offset : LibC::Double) : CplErr
    fun compute_raster_min_max = GDALComputeRasterMinMax(h_band : RasterBandH, b_approx_ok : LibC::Int, adf_min_max : LibC::Double[2])
    fun flush_raster_cache = GDALFlushRasterCache(h_band : RasterBandH) : CplErr
    fun get_raster_histogram = GDALGetRasterHistogram(h_band : RasterBandH, df_min : LibC::Double, df_max : LibC::Double, n_buckets : LibC::Int, pan_histogram : LibC::Int*, b_include_out_of_range : LibC::Int, b_approx_ok : LibC::Int, pfn_progress : ProgressFunc, p_progress_data : Void*) : CplErr
    fun get_raster_histogram_ex = GDALGetRasterHistogramEx(h_band : RasterBandH, df_min : LibC::Double, df_max : LibC::Double, n_buckets : LibC::Int, pan_histogram : GuIntBig*, b_include_out_of_range : LibC::Int, b_approx_ok : LibC::Int, pfn_progress : ProgressFunc, p_progress_data : Void*) : CplErr
    alias GuIntBig = LibC::ULongLong
    fun get_default_histogram = GDALGetDefaultHistogram(h_band : RasterBandH, pdf_min : LibC::Double*, pdf_max : LibC::Double*, pn_buckets : LibC::Int*, ppan_histogram : LibC::Int**, b_force : LibC::Int, pfn_progress : ProgressFunc, p_progress_data : Void*) : CplErr
    fun get_default_histogram_ex = GDALGetDefaultHistogramEx(h_band : RasterBandH, pdf_min : LibC::Double*, pdf_max : LibC::Double*, pn_buckets : LibC::Int*, ppan_histogram : GuIntBig**, b_force : LibC::Int, pfn_progress : ProgressFunc, p_progress_data : Void*) : CplErr
    fun set_default_histogram = GDALSetDefaultHistogram(h_band : RasterBandH, df_min : LibC::Double, df_max : LibC::Double, n_buckets : LibC::Int, pan_histogram : LibC::Int*) : CplErr
    fun set_default_histogram_ex = GDALSetDefaultHistogramEx(h_band : RasterBandH, df_min : LibC::Double, df_max : LibC::Double, n_buckets : LibC::Int, pan_histogram : GuIntBig*) : CplErr
    fun get_random_raster_sample = GDALGetRandomRasterSample(x0 : RasterBandH, x1 : LibC::Int, x2 : LibC::Float*) : LibC::Int
    fun get_raster_sample_overview = GDALGetRasterSampleOverview(x0 : RasterBandH, x1 : LibC::Int) : RasterBandH
    fun get_raster_sample_overview_ex = GDALGetRasterSampleOverviewEx(x0 : RasterBandH, x1 : GuIntBig) : RasterBandH
    fun fill_raster = GDALFillRaster(h_band : RasterBandH, df_real_value : LibC::Double, df_imaginary_value : LibC::Double) : CplErr
    fun compute_band_stats = GDALComputeBandStats(h_band : RasterBandH, n_sample_step : LibC::Int, pdf_mean : LibC::Double*, pdf_std_dev : LibC::Double*, pfn_progress : ProgressFunc, p_progress_data : Void*) : CplErr
    fun overview_magnitude_correction = GDALOverviewMagnitudeCorrection(h_base_band : RasterBandH, n_overview_count : LibC::Int, pah_overviews : RasterBandH*, pfn_progress : ProgressFunc, p_progress_data : Void*) : CplErr
    fun get_default_rat = GDALGetDefaultRAT(h_band : RasterBandH) : RasterAttributeTableH
    alias RasterAttributeTableH = Void*
    fun set_default_rat = GDALSetDefaultRAT(x0 : RasterBandH, x1 : RasterAttributeTableH) : CplErr
    fun add_derived_band_pixel_func = GDALAddDerivedBandPixelFunc(psz_name : LibC::Char*, pfn_pixel_func : DerivedPixelFunc) : CplErr
    alias DerivedPixelFunc = (Void**, LibC::Int, Void*, LibC::Int, LibC::Int, DataType, DataType, LibC::Int, LibC::Int -> CplErr)
    fun get_mask_band = GDALGetMaskBand(h_band : RasterBandH) : RasterBandH
    fun get_mask_flags = GDALGetMaskFlags(h_band : RasterBandH) : LibC::Int
    fun create_mask_band = GDALCreateMaskBand(h_band : RasterBandH, n_flags : LibC::Int) : CplErr
    fun get_data_coverage_status = GDALGetDataCoverageStatus(h_band : RasterBandH, n_x_off : LibC::Int, n_y_off : LibC::Int, n_x_size : LibC::Int, n_y_size : LibC::Int, n_mask_flag_stop : LibC::Int, pdf_data_pct : LibC::Double*) : LibC::Int
    fun ar_get_next_updated_region = GDALARGetNextUpdatedRegion(h_ario : AsyncReaderH, df_timeout : LibC::Double, pn_x_buf_off : LibC::Int*, pn_y_buf_off : LibC::Int*, pn_x_buf_size : LibC::Int*, pn_y_buf_size : LibC::Int*) : AsyncStatusType
    fun ar_lock_buffer = GDALARLockBuffer(h_ario : AsyncReaderH, df_timeout : LibC::Double) : LibC::Int
    fun ar_unlock_buffer = GDALARUnlockBuffer(h_ario : AsyncReaderH)
    fun general_cmd_line_processor = GDALGeneralCmdLineProcessor(n_argc : LibC::Int, ppapsz_argv : LibC::Char***, n_options : LibC::Int) : LibC::Int
    fun swap_words = GDALSwapWords(p_data : Void*, n_word_size : LibC::Int, n_word_count : LibC::Int, n_word_skip : LibC::Int)
    fun swap_words_ex = GDALSwapWordsEx(p_data : Void*, n_word_size : LibC::Int, n_word_count : LibC::SizeT, n_word_skip : LibC::Int)
    fun copy_words = GDALCopyWords(p_src_data : Void*, e_src_type : DataType, n_src_pixel_offset : LibC::Int, p_dst_data : Void*, e_dst_type : DataType, n_dst_pixel_offset : LibC::Int, n_word_count : LibC::Int)
    fun copy_bits = GDALCopyBits(paby_src_data : GByte*, n_src_offset : LibC::Int, n_src_step : LibC::Int, paby_dst_data : GByte*, n_dst_offset : LibC::Int, n_dst_step : LibC::Int, n_bit_count : LibC::Int, n_step_count : LibC::Int)
    alias GByte = UInt8
    fun load_world_file = GDALLoadWorldFile(x0 : LibC::Char*, x1 : LibC::Double*) : LibC::Int
    fun read_world_file = GDALReadWorldFile(x0 : LibC::Char*, x1 : LibC::Char*, x2 : LibC::Double*) : LibC::Int
    fun write_world_file = GDALWriteWorldFile(x0 : LibC::Char*, x1 : LibC::Char*, x2 : LibC::Double*) : LibC::Int
    fun load_tab_file = GDALLoadTabFile(x0 : LibC::Char*, x1 : LibC::Double*, x2 : LibC::Char**, x3 : LibC::Int*, x4 : Gcp**) : LibC::Int
    fun read_tab_file = GDALReadTabFile(x0 : LibC::Char*, x1 : LibC::Double*, x2 : LibC::Char**, x3 : LibC::Int*, x4 : Gcp**) : LibC::Int
    fun load_ozi_map_file = GDALLoadOziMapFile(x0 : LibC::Char*, x1 : LibC::Double*, x2 : LibC::Char**, x3 : LibC::Int*, x4 : Gcp**) : LibC::Int
    fun read_ozi_map_file = GDALReadOziMapFile(x0 : LibC::Char*, x1 : LibC::Double*, x2 : LibC::Char**, x3 : LibC::Int*, x4 : Gcp**) : LibC::Int
    fun dec_to_dms = GDALDecToDMS(x0 : LibC::Double, x1 : LibC::Char*, x2 : LibC::Int) : LibC::Char*
    fun packed_dms_to_dec = GDALPackedDMSToDec(x0 : LibC::Double) : LibC::Double
    fun dec_to_packed_dms = GDALDecToPackedDMS(x0 : LibC::Double) : LibC::Double
    fun extract_rpc_info = GDALExtractRPCInfo(x0 : LibC::Char**, x1 : RpcInfo*) : LibC::Int
    struct RpcInfo
      df_line_off : LibC::Double
      df_samp_off : LibC::Double
      df_lat_off : LibC::Double
      df_long_off : LibC::Double
      df_height_off : LibC::Double
      df_line_scale : LibC::Double
      df_samp_scale : LibC::Double
      df_lat_scale : LibC::Double
      df_long_scale : LibC::Double
      df_height_scale : LibC::Double
      adf_line_num_coeff : LibC::Double[20]
      adf_line_den_coeff : LibC::Double[20]
      adf_samp_num_coeff : LibC::Double[20]
      adf_samp_den_coeff : LibC::Double[20]
      df_min_long : LibC::Double
      df_min_lat : LibC::Double
      df_max_long : LibC::Double
      df_max_lat : LibC::Double
    end
    fun create_color_table = GDALCreateColorTable(x0 : PaletteInterp) : ColorTableH
    fun destroy_color_table = GDALDestroyColorTable(x0 : ColorTableH)
    fun clone_color_table = GDALCloneColorTable(x0 : ColorTableH) : ColorTableH
    fun get_palette_interpretation = GDALGetPaletteInterpretation(x0 : ColorTableH) : PaletteInterp
    fun get_color_entry_count = GDALGetColorEntryCount(x0 : ColorTableH) : LibC::Int
    fun get_color_entry = GDALGetColorEntry(x0 : ColorTableH, x1 : LibC::Int) : ColorEntry*
    struct ColorEntry
      c1 : LibC::Short
      c2 : LibC::Short
      c3 : LibC::Short
      c4 : LibC::Short
    end
    fun get_color_entry_as_rgb = GDALGetColorEntryAsRGB(x0 : ColorTableH, x1 : LibC::Int, x2 : ColorEntry*) : LibC::Int
    fun set_color_entry = GDALSetColorEntry(x0 : ColorTableH, x1 : LibC::Int, x2 : ColorEntry*)
    fun create_color_ramp = GDALCreateColorRamp(h_table : ColorTableH, n_start_index : LibC::Int, ps_start_color : ColorEntry*, n_end_index : LibC::Int, ps_end_color : ColorEntry*)
    fun create_raster_attribute_table = GDALCreateRasterAttributeTable : RasterAttributeTableH
    fun destroy_raster_attribute_table = GDALDestroyRasterAttributeTable(x0 : RasterAttributeTableH)
    fun rat_get_column_count = GDALRATGetColumnCount(x0 : RasterAttributeTableH) : LibC::Int
    fun rat_get_name_of_col = GDALRATGetNameOfCol(x0 : RasterAttributeTableH, x1 : LibC::Int) : LibC::Char*
    fun rat_get_usage_of_col = GDALRATGetUsageOfCol(x0 : RasterAttributeTableH, x1 : LibC::Int) : RatFieldUsage
    enum RatFieldUsage
      GfuGeneric = 0
      GfuPixelCount = 1
      GfuName = 2
      GfuMin = 3
      GfuMax = 4
      GfuMinMax = 5
      GfuRed = 6
      GfuGreen = 7
      GfuBlue = 8
      GfuAlpha = 9
      GfuRedMin = 10
      GfuGreenMin = 11
      GfuBlueMin = 12
      GfuAlphaMin = 13
      GfuRedMax = 14
      GfuGreenMax = 15
      GfuBlueMax = 16
      GfuAlphaMax = 17
      GfuMaxCount = 18
    end
    fun rat_get_type_of_col = GDALRATGetTypeOfCol(x0 : RasterAttributeTableH, x1 : LibC::Int) : RatFieldType
    enum RatFieldType
      GftInteger = 0
      GftReal = 1
      GftString = 2
    end
    fun rat_get_col_of_usage = GDALRATGetColOfUsage(x0 : RasterAttributeTableH, x1 : RatFieldUsage) : LibC::Int
    fun rat_get_row_count = GDALRATGetRowCount(x0 : RasterAttributeTableH) : LibC::Int
    fun rat_get_value_as_string = GDALRATGetValueAsString(x0 : RasterAttributeTableH, x1 : LibC::Int, x2 : LibC::Int) : LibC::Char*
    fun rat_get_value_as_int = GDALRATGetValueAsInt(x0 : RasterAttributeTableH, x1 : LibC::Int, x2 : LibC::Int) : LibC::Int
    fun rat_get_value_as_double = GDALRATGetValueAsDouble(x0 : RasterAttributeTableH, x1 : LibC::Int, x2 : LibC::Int) : LibC::Double
    fun rat_set_value_as_string = GDALRATSetValueAsString(x0 : RasterAttributeTableH, x1 : LibC::Int, x2 : LibC::Int, x3 : LibC::Char*)
    fun rat_set_value_as_int = GDALRATSetValueAsInt(x0 : RasterAttributeTableH, x1 : LibC::Int, x2 : LibC::Int, x3 : LibC::Int)
    fun rat_set_value_as_double = GDALRATSetValueAsDouble(x0 : RasterAttributeTableH, x1 : LibC::Int, x2 : LibC::Int, x3 : LibC::Double)
    fun rat_changes_are_written_to_file = GDALRATChangesAreWrittenToFile(h_rat : RasterAttributeTableH) : LibC::Int
    fun rat_values_io_as_double = GDALRATValuesIOAsDouble(h_rat : RasterAttributeTableH, e_rw_flag : RwFlag, i_field : LibC::Int, i_start_row : LibC::Int, i_length : LibC::Int, pdf_data : LibC::Double*) : CplErr
    fun rat_values_io_as_integer = GDALRATValuesIOAsInteger(h_rat : RasterAttributeTableH, e_rw_flag : RwFlag, i_field : LibC::Int, i_start_row : LibC::Int, i_length : LibC::Int, pn_data : LibC::Int*) : CplErr
    fun rat_values_io_as_string = GDALRATValuesIOAsString(h_rat : RasterAttributeTableH, e_rw_flag : RwFlag, i_field : LibC::Int, i_start_row : LibC::Int, i_length : LibC::Int, papsz_str_list : LibC::Char**) : CplErr
    fun rat_set_row_count = GDALRATSetRowCount(x0 : RasterAttributeTableH, x1 : LibC::Int)
    fun rat_create_column = GDALRATCreateColumn(x0 : RasterAttributeTableH, x1 : LibC::Char*, x2 : RatFieldType, x3 : RatFieldUsage) : CplErr
    fun rat_set_linear_binning = GDALRATSetLinearBinning(x0 : RasterAttributeTableH, x1 : LibC::Double, x2 : LibC::Double) : CplErr
    fun rat_get_linear_binning = GDALRATGetLinearBinning(x0 : RasterAttributeTableH, x1 : LibC::Double*, x2 : LibC::Double*) : LibC::Int
    fun rat_initialize_from_color_table = GDALRATInitializeFromColorTable(x0 : RasterAttributeTableH, x1 : ColorTableH) : CplErr
    fun rat_translate_to_color_table = GDALRATTranslateToColorTable(x0 : RasterAttributeTableH, n_entry_count : LibC::Int) : ColorTableH
    fun rat_dump_readable = GDALRATDumpReadable(x0 : RasterAttributeTableH, x1 : File*)
    fun rat_clone = GDALRATClone(x0 : RasterAttributeTableH) : RasterAttributeTableH
    fun rat_serialize_json = GDALRATSerializeJSON(x0 : RasterAttributeTableH) : Void*
    fun rat_get_row_of_value = GDALRATGetRowOfValue(x0 : RasterAttributeTableH, x1 : LibC::Double) : LibC::Int
    fun set_cache_max = GDALSetCacheMax(n_bytes : LibC::Int)
    fun get_cache_max = GDALGetCacheMax : LibC::Int
    fun get_cache_used = GDALGetCacheUsed : LibC::Int
    fun set_cache_max64 = GDALSetCacheMax64(n_bytes : GIntBig)
    fun get_cache_max64 = GDALGetCacheMax64 : GIntBig
    fun get_cache_used64 = GDALGetCacheUsed64 : GIntBig
    fun flush_cache_block = GDALFlushCacheBlock : LibC::Int
    fun dataset_get_virtual_mem = GDALDatasetGetVirtualMem(h_ds : DatasetH, e_rw_flag : RwFlag, n_x_off : LibC::Int, n_y_off : LibC::Int, n_x_size : LibC::Int, n_y_size : LibC::Int, n_buf_x_size : LibC::Int, n_buf_y_size : LibC::Int, e_buf_type : DataType, n_band_count : LibC::Int, pan_band_map : LibC::Int*, n_pixel_space : LibC::Int, n_line_space : GIntBig, n_band_space : GIntBig, n_cache_size : LibC::SizeT, n_page_size_hint : LibC::SizeT, b_single_thread_usage : LibC::Int, papsz_options : LibC::Char**) : CplVirtualMem
    type CplVirtualMem = Void*
    fun raster_band_get_virtual_mem = GDALRasterBandGetVirtualMem(h_band : RasterBandH, e_rw_flag : RwFlag, n_x_off : LibC::Int, n_y_off : LibC::Int, n_x_size : LibC::Int, n_y_size : LibC::Int, n_buf_x_size : LibC::Int, n_buf_y_size : LibC::Int, e_buf_type : DataType, n_pixel_space : LibC::Int, n_line_space : GIntBig, n_cache_size : LibC::SizeT, n_page_size_hint : LibC::SizeT, b_single_thread_usage : LibC::Int, papsz_options : LibC::Char**) : CplVirtualMem
    fun get_virtual_mem_auto = GDALGetVirtualMemAuto(h_band : RasterBandH, e_rw_flag : RwFlag, pn_pixel_space : LibC::Int*, pn_line_space : GIntBig*, papsz_options : LibC::Char**) : CplVirtualMem
    fun dataset_get_tiled_virtual_mem = GDALDatasetGetTiledVirtualMem(h_ds : DatasetH, e_rw_flag : RwFlag, n_x_off : LibC::Int, n_y_off : LibC::Int, n_x_size : LibC::Int, n_y_size : LibC::Int, n_tile_x_size : LibC::Int, n_tile_y_size : LibC::Int, e_buf_type : DataType, n_band_count : LibC::Int, pan_band_map : LibC::Int*, e_tile_organization : TileOrganization, n_cache_size : LibC::SizeT, b_single_thread_usage : LibC::Int, papsz_options : LibC::Char**) : CplVirtualMem
    enum TileOrganization
      GtoTip = 0
      GtoBit = 1
      GtoBsq = 2
    end
    fun raster_band_get_tiled_virtual_mem = GDALRasterBandGetTiledVirtualMem(h_band : RasterBandH, e_rw_flag : RwFlag, n_x_off : LibC::Int, n_y_off : LibC::Int, n_x_size : LibC::Int, n_y_size : LibC::Int, n_tile_x_size : LibC::Int, n_tile_y_size : LibC::Int, e_buf_type : DataType, n_cache_size : LibC::SizeT, b_single_thread_usage : LibC::Int, papsz_options : LibC::Char**) : CplVirtualMem
    fun create_pansharpened_vrt = GDALCreatePansharpenedVRT(psz_xml : LibC::Char*, h_panchro_band : RasterBandH, n_input_spectral_bands : LibC::Int, pah_input_spectral_bands : RasterBandH*) : DatasetH
    fun get_jpeg2000_structure = GDALGetJPEG2000Structure(psz_filename : LibC::Char*, papsz_options : LibC::Char**) : CplxmlNode*
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
  end
end
