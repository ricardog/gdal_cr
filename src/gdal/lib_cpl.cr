
module GDAL::CPL
  @[Link(ldflags: "`gdal-config --libs`")]
  lib Lib
    MULTIPROC_PTHREAD = 1
    LARGE_API_SUPPORTED = 1
    HAS_GINT64 = 1
    IS_LSB = 1
    STAT_EXISTS_FLAG = 1
    STAT_NATURE_FLAG = 2
    STAT_SIZE_FLAG = 4
    STAT_SET_ERROR_FLAG = 8
    E_NONE = 0
    E_APPDEFINED = 1
    E_OUTOFMEMORY = 2
    E_FILEIO = 3
    E_OPENFAILED = 4
    E_ILLEGALARG = 5
    E_NOTSUPPORTED = 6
    E_ASSERTIONFAILED = 7
    E_NOWRITEACCESS = 8
    E_USERINTERRUPT = 9
    E_OBJECTNULL = 10
    E_HTTPRESPONSE = 11
    E_AWSBUCKETNOTFOUND = 12
    E_AWSOBJECTNOTFOUND = 13
    E_AWSACCESSDENIED = 14
    E_AWSINVALIDCREDENTIALS = 15
    E_AWSSIGNATUREDOESNOTMATCH = 16
    fun f_open = VSIFOpen(x0 : LibC::Char*, x1 : LibC::Char*) : File*
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
    fun f_close = VSIFClose(x0 : File*) : LibC::Int
    fun f_seek = VSIFSeek(x0 : File*, x1 : LibC::Long, x2 : LibC::Int) : LibC::Int
    fun f_tell = VSIFTell(x0 : File*) : LibC::Long
    fun rewind = VSIRewind(x0 : File*)
    fun f_flush = VSIFFlush(x0 : File*)
    fun f_read = VSIFRead(x0 : Void*, x1 : LibC::SizeT, x2 : LibC::SizeT, x3 : File*) : LibC::SizeT
    fun f_write = VSIFWrite(x0 : Void*, x1 : LibC::SizeT, x2 : LibC::SizeT, x3 : File*) : LibC::SizeT
    fun f_gets = VSIFGets(x0 : LibC::Char*, x1 : LibC::Int, x2 : File*) : LibC::Char*
    fun f_puts = VSIFPuts(x0 : LibC::Char*, x1 : File*) : LibC::Int
    fun f_printf = VSIFPrintf(x0 : File*, x1 : LibC::Char*, ...) : LibC::Int
    fun f_getc = VSIFGetc(x0 : File*) : LibC::Int
    fun f_putc = VSIFPutc(x0 : LibC::Int, x1 : File*) : LibC::Int
    fun ungetc = VSIUngetc(x0 : LibC::Int, x1 : File*) : LibC::Int
    fun f_eof = VSIFEof(x0 : File*) : LibC::Int
    fun stat = VSIStat(x0 : LibC::Char*, x1 : StatBuf*) : LibC::Int
    struct Stat
      st_dev : X__DevT
      st_ino : X__InoT
      st_nlink : X__NlinkT
      st_mode : X__ModeT
      st_uid : X__UidT
      st_gid : X__GidT
      __pad0 : LibC::Int
      st_rdev : X__DevT
      st_size : X__OffT
      st_blksize : X__BlksizeT
      st_blocks : X__BlkcntT
      st_atim : Timespec
      st_mtim : Timespec
      st_ctim : Timespec
      __glibc_reserved : X__SyscallSlongT[3]
    end
    type StatBuf = Stat
    alias X__DevT = LibC::ULong
    alias X__InoT = LibC::ULong
    alias X__NlinkT = LibC::ULong
    alias X__ModeT = LibC::UInt
    alias X__UidT = LibC::UInt
    alias X__GidT = LibC::UInt
    alias X__BlksizeT = LibC::Long
    alias X__BlkcntT = LibC::Long
    struct Timespec
      tv_sec : X__TimeT
      tv_nsec : X__SyscallSlongT
    end
    alias X__TimeT = LibC::Long
    alias X__SyscallSlongT = LibC::Long
    fun f_open_l = VSIFOpenL(x0 : LibC::Char*, x1 : LibC::Char*) : Lfile*
    alias Lfile = File
    fun f_open_ex_l = VSIFOpenExL(x0 : LibC::Char*, x1 : LibC::Char*, x2 : LibC::Int) : Lfile*
    fun f_close_l = VSIFCloseL(x0 : Lfile*) : LibC::Int
    fun f_seek_l = VSIFSeekL(x0 : Lfile*, x1 : VsiLOffset, x2 : LibC::Int) : LibC::Int
    alias GuIntBig = LibC::ULongLong
    alias VsiLOffset = GuIntBig
    fun f_tell_l = VSIFTellL(x0 : Lfile*) : VsiLOffset
    fun rewind_l = VSIRewindL(x0 : Lfile*)
    fun f_read_l = VSIFReadL(x0 : Void*, x1 : LibC::SizeT, x2 : LibC::SizeT, x3 : Lfile*) : LibC::SizeT
    fun f_read_multi_range_l = VSIFReadMultiRangeL(n_ranges : LibC::Int, pp_data : Void**, pan_offsets : VsiLOffset*, pan_sizes : LibC::SizeT*, x4 : Lfile*) : LibC::Int
    fun f_write_l = VSIFWriteL(x0 : Void*, x1 : LibC::SizeT, x2 : LibC::SizeT, x3 : Lfile*) : LibC::SizeT
    fun f_eof_l = VSIFEofL(x0 : Lfile*) : LibC::Int
    fun f_truncate_l = VSIFTruncateL(x0 : Lfile*, x1 : VsiLOffset) : LibC::Int
    fun f_flush_l = VSIFFlushL(x0 : Lfile*) : LibC::Int
    fun f_printf_l = VSIFPrintfL(x0 : Lfile*, x1 : LibC::Char*, ...) : LibC::Int
    fun f_putc_l = VSIFPutcL(x0 : LibC::Int, x1 : Lfile*) : LibC::Int
    RangeStatusUnknown = 0_i64
    RangeStatusData = 1_i64
    RangeStatusHole = 2_i64
    fun f_get_range_status_l = VSIFGetRangeStatusL(fp : Lfile*, n_start : VsiLOffset, n_length : VsiLOffset) : RangeStatus
    enum RangeStatus
      RangeStatusUnknown = 0
      RangeStatusData = 1
      RangeStatusHole = 2
    end
    fun ingest_file = VSIIngestFile(fp : Lfile*, psz_filename : LibC::Char*, ppaby_ret : GByte**, pn_size : VsiLOffset*, n_max_size : GIntBig) : LibC::Int
    alias GByte = UInt8
    alias GIntBig = LibC::LongLong
    fun stat_l = VSIStatL(x0 : LibC::Char*, x1 : StatBufL) : LibC::Int
    type StatBufL = Void*
    fun stat_ex_l = VSIStatExL(psz_filename : LibC::Char*, ps_stat_buf : StatBufL, n_flags : LibC::Int) : LibC::Int
    fun is_case_sensitive_fs = VSIIsCaseSensitiveFS(psz_filename : LibC::Char*) : LibC::Int
    fun supports_sparse_files = VSISupportsSparseFiles(psz_path : LibC::Char*) : LibC::Int
    fun f_get_native_file_descriptor_l = VSIFGetNativeFileDescriptorL(x0 : Lfile*) : Void*
    fun calloc = VSICalloc(x0 : LibC::SizeT, x1 : LibC::SizeT) : Void*
    fun malloc = VSIMalloc(x0 : LibC::SizeT) : Void*
    fun free = VSIFree(x0 : Void*)
    fun realloc = VSIRealloc(x0 : Void*, x1 : LibC::SizeT) : Void*
    fun strdup = VSIStrdup(x0 : LibC::Char*) : LibC::Char*
    fun malloc_aligned = VSIMallocAligned(n_alignment : LibC::SizeT, n_size : LibC::SizeT) : Void*
    fun malloc_aligned_auto = VSIMallocAlignedAuto(n_size : LibC::SizeT) : Void*
    fun free_aligned = VSIFreeAligned(ptr : Void*)
    fun malloc_aligned_auto_verbose = VSIMallocAlignedAutoVerbose(n_size : LibC::SizeT, psz_file : LibC::Char*, n_line : LibC::Int) : Void*
    fun malloc2 = VSIMalloc2(n_size1 : LibC::SizeT, n_size2 : LibC::SizeT) : Void*
    fun malloc3 = VSIMalloc3(n_size1 : LibC::SizeT, n_size2 : LibC::SizeT, n_size3 : LibC::SizeT) : Void*
    fun malloc_verbose = VSIMallocVerbose(n_size : LibC::SizeT, psz_file : LibC::Char*, n_line : LibC::Int) : Void*
    fun malloc2_verbose = VSIMalloc2Verbose(n_size1 : LibC::SizeT, n_size2 : LibC::SizeT, psz_file : LibC::Char*, n_line : LibC::Int) : Void*
    fun malloc3_verbose = VSIMalloc3Verbose(n_size1 : LibC::SizeT, n_size2 : LibC::SizeT, n_size3 : LibC::SizeT, psz_file : LibC::Char*, n_line : LibC::Int) : Void*
    fun calloc_verbose = VSICallocVerbose(n_count : LibC::SizeT, n_size : LibC::SizeT, psz_file : LibC::Char*, n_line : LibC::Int) : Void*
    fun realloc_verbose = VSIReallocVerbose(p_old_ptr : Void*, n_new_size : LibC::SizeT, psz_file : LibC::Char*, n_line : LibC::Int) : Void*
    fun strdup_verbose = VSIStrdupVerbose(psz_str : LibC::Char*, psz_file : LibC::Char*, n_line : LibC::Int) : LibC::Char*
    fun get_physical_ram = CPLGetPhysicalRAM : GIntBig
    fun get_usable_physical_ram = CPLGetUsablePhysicalRAM : GIntBig
    fun read_dir = VSIReadDir(x0 : LibC::Char*) : LibC::Char**
    fun read_dir_recursive = VSIReadDirRecursive(psz_path : LibC::Char*) : LibC::Char**
    fun read_dir_ex = VSIReadDirEx(psz_path : LibC::Char*, n_max_files : LibC::Int) : LibC::Char**
    fun mkdir = VSIMkdir(pathname : LibC::Char*, mode : LibC::Long) : LibC::Int
    fun rmdir = VSIRmdir(pathname : LibC::Char*) : LibC::Int
    fun unlink = VSIUnlink(pathname : LibC::Char*) : LibC::Int
    fun rename = VSIRename(oldpath : LibC::Char*, newpath : LibC::Char*) : LibC::Int
    fun strerror = VSIStrerror(x0 : LibC::Int) : LibC::Char*
    fun get_disk_free_space = VSIGetDiskFreeSpace(psz_dirname : LibC::Char*) : GIntBig
    fun install_mem_file_handler = VSIInstallMemFileHandler
    fun install_large_file_handler = VSIInstallLargeFileHandler
    fun install_sub_file_handler = VSIInstallSubFileHandler
    fun install_curl_file_handler = VSIInstallCurlFileHandler
    fun curl_clear_cache = VSICurlClearCache
    fun install_curl_streaming_file_handler = VSIInstallCurlStreamingFileHandler
    fun install_s3_file_handler = VSIInstallS3FileHandler
    fun install_s3_streaming_file_handler = VSIInstallS3StreamingFileHandler
    fun install_gs_file_handler = VSIInstallGSFileHandler
    fun install_gs_streaming_file_handler = VSIInstallGSStreamingFileHandler
    fun install_g_zip_file_handler = VSIInstallGZipFileHandler
    fun install_zip_file_handler = VSIInstallZipFileHandler
    fun install_stdin_handler = VSIInstallStdinHandler
    fun install_stdout_handler = VSIInstallStdoutHandler
    fun install_sparse_file_handler = VSIInstallSparseFileHandler
    fun install_tar_file_handler = VSIInstallTarFileHandler
    fun install_crypt_file_handler = VSIInstallCryptFileHandler
    fun set_crypt_key = VSISetCryptKey(paby_key : GByte*, n_key_size : LibC::Int)
    fun cleanup_file_manager = VSICleanupFileManager
    fun file_from_mem_buffer = VSIFileFromMemBuffer(psz_filename : LibC::Char*, paby_data : GByte*, n_data_length : VsiLOffset, b_take_ownership : LibC::Int) : Lfile*
    fun get_mem_file_buffer = VSIGetMemFileBuffer(psz_filename : LibC::Char*, pn_data_length : VsiLOffset*, b_unlink_and_seize : LibC::Int) : GByte*
    fun stdout_set_redirection = VSIStdoutSetRedirection(p_fct : WriteFunction, stream : File*)
    alias WriteFunction = (Void*, LibC::SizeT, LibC::SizeT, File* -> LibC::SizeT)
    fun time = VSITime(x0 : LibC::ULong*) : LibC::ULong
    fun c_time = VSICTime(x0 : LibC::ULong) : LibC::Char*
    fun gm_time = VSIGMTime(pn_time : TimeT*, po_broken_time : Tm*) : Tm*
    alias TimeT = X__TimeT
    struct Tm
      tm_sec : LibC::Int
      tm_min : LibC::Int
      tm_hour : LibC::Int
      tm_mday : LibC::Int
      tm_mon : LibC::Int
      tm_year : LibC::Int
      tm_wday : LibC::Int
      tm_yday : LibC::Int
      tm_isdst : LibC::Int
      tm_gmtoff : LibC::Long
      tm_zone : LibC::Char*
    end
    fun local_time = VSILocalTime(pn_time : TimeT*, po_broken_time : Tm*) : Tm*
    fun error = CPLError(e_err_class : Err, err_no : ErrorNum, fmt : LibC::Char*, ...)
    enum Err
      CeNone = 0
      CeDebug = 1
      CeWarning = 2
      CeFailure = 3
      CeFatal = 4
    end
    alias ErrorNum = LibC::Int
    fun error_v = CPLErrorV(x0 : Err, x1 : ErrorNum, x2 : LibC::Char*, x3 : VaList)
    alias X__GnucVaList = LibC::VaList
    alias VaList = X__GnucVaList
    fun emergency_error = CPLEmergencyError(x0 : LibC::Char*)
    fun error_reset = CPLErrorReset
    fun get_last_error_no = CPLGetLastErrorNo : ErrorNum
    fun get_last_error_type = CPLGetLastErrorType : Err
    fun get_last_error_msg = CPLGetLastErrorMsg : LibC::Char*
    fun get_error_handler_user_data = CPLGetErrorHandlerUserData : Void*
    fun error_set_state = CPLErrorSetState(e_err_class : Err, err_no : ErrorNum, psz_msg : LibC::Char*)
    fun cleanup_error_mutex = CPLCleanupErrorMutex
    fun logging_error_handler = CPLLoggingErrorHandler(x0 : Err, x1 : ErrorNum, x2 : LibC::Char*)
    fun default_error_handler = CPLDefaultErrorHandler(x0 : Err, x1 : ErrorNum, x2 : LibC::Char*)
    fun quiet_error_handler = CPLQuietErrorHandler(x0 : Err, x1 : ErrorNum, x2 : LibC::Char*)
    fun turn_failure_into_warning = CPLTurnFailureIntoWarning(b_on : LibC::Int)
    fun set_error_handler = CPLSetErrorHandler(x0 : ErrorHandler) : ErrorHandler
    alias ErrorHandler = (Err, ErrorNum, LibC::Char* -> Void)
    fun set_error_handler_ex = CPLSetErrorHandlerEx(x0 : ErrorHandler, x1 : Void*) : ErrorHandler
    fun push_error_handler = CPLPushErrorHandler(x0 : ErrorHandler)
    fun push_error_handler_ex = CPLPushErrorHandlerEx(x0 : ErrorHandler, x1 : Void*)
    fun set_current_error_handler_catch_debug = CPLSetCurrentErrorHandlerCatchDebug(b_catch_debug : LibC::Int)
    fun pop_error_handler = CPLPopErrorHandler
    fun debug = CPLDebug(x0 : LibC::Char*, x1 : LibC::Char*, ...)
    fun verify_configuration = CPLVerifyConfiguration
    fun get_config_option = CPLGetConfigOption(x0 : LibC::Char*, x1 : LibC::Char*) : LibC::Char*
    fun get_thread_local_config_option = CPLGetThreadLocalConfigOption(x0 : LibC::Char*, x1 : LibC::Char*) : LibC::Char*
    fun set_config_option = CPLSetConfigOption(x0 : LibC::Char*, x1 : LibC::Char*)
    fun set_thread_local_config_option = CPLSetThreadLocalConfigOption(psz_key : LibC::Char*, psz_value : LibC::Char*)
    fun free_config = CPLFreeConfig
    fun get_config_options = CPLGetConfigOptions : LibC::Char**
    fun set_config_options = CPLSetConfigOptions(papsz_config_options : LibC::Char**)
    fun get_thread_local_config_options = CPLGetThreadLocalConfigOptions : LibC::Char**
    fun set_thread_local_config_options = CPLSetThreadLocalConfigOptions(papsz_config_options : LibC::Char**)
    fun malloc = CPLMalloc(x0 : LibC::SizeT) : Void*
    fun calloc = CPLCalloc(x0 : LibC::SizeT, x1 : LibC::SizeT) : Void*
    fun realloc = CPLRealloc(x0 : Void*, x1 : LibC::SizeT) : Void*
    fun strdup = CPLStrdup(x0 : LibC::Char*) : LibC::Char*
    fun strlwr = CPLStrlwr(x0 : LibC::Char*) : LibC::Char*
    fun f_gets = CPLFGets(x0 : LibC::Char*, x1 : LibC::Int, x2 : File*) : LibC::Char*
    fun read_line = CPLReadLine(x0 : File*) : LibC::Char*
    fun read_line_l = CPLReadLineL(x0 : Lfile*) : LibC::Char*
    fun read_line2_l = CPLReadLine2L(x0 : Lfile*, n_max_cols : LibC::Int, papsz_options : LibC::Char**) : LibC::Char*
    fun atof = CPLAtof(x0 : LibC::Char*) : LibC::Double
    fun atof_delim = CPLAtofDelim(x0 : LibC::Char*, x1 : LibC::Char) : LibC::Double
    fun strtod = CPLStrtod(x0 : LibC::Char*, x1 : LibC::Char**) : LibC::Double
    fun strtod_delim = CPLStrtodDelim(x0 : LibC::Char*, x1 : LibC::Char**, x2 : LibC::Char) : LibC::Double
    fun strtof = CPLStrtof(x0 : LibC::Char*, x1 : LibC::Char**) : LibC::Float
    fun strtof_delim = CPLStrtofDelim(x0 : LibC::Char*, x1 : LibC::Char**, x2 : LibC::Char) : LibC::Float
    fun atof_m = CPLAtofM(x0 : LibC::Char*) : LibC::Double
    fun scan_string = CPLScanString(x0 : LibC::Char*, x1 : LibC::Int, x2 : LibC::Int, x3 : LibC::Int) : LibC::Char*
    fun scan_double = CPLScanDouble(x0 : LibC::Char*, x1 : LibC::Int) : LibC::Double
    fun scan_long = CPLScanLong(x0 : LibC::Char*, x1 : LibC::Int) : LibC::Long
    fun scan_u_long = CPLScanULong(x0 : LibC::Char*, x1 : LibC::Int) : LibC::ULong
    fun scan_u_int_big = CPLScanUIntBig(x0 : LibC::Char*, x1 : LibC::Int) : GuIntBig
    fun ato_g_int_big = CPLAtoGIntBig(psz_string : LibC::Char*) : GIntBig
    fun ato_g_int_big_ex = CPLAtoGIntBigEx(psz_string : LibC::Char*, b_warn : LibC::Int, pb_overflow : LibC::Int*) : GIntBig
    fun scan_pointer = CPLScanPointer(x0 : LibC::Char*, x1 : LibC::Int) : Void*
    fun print_string = CPLPrintString(x0 : LibC::Char*, x1 : LibC::Char*, x2 : LibC::Int) : LibC::Int
    fun print_string_fill = CPLPrintStringFill(x0 : LibC::Char*, x1 : LibC::Char*, x2 : LibC::Int) : LibC::Int
    fun print_int32 = CPLPrintInt32(x0 : LibC::Char*, x1 : GInt32, x2 : LibC::Int) : LibC::Int
    alias GInt32 = LibC::Int
    fun print_u_int_big = CPLPrintUIntBig(x0 : LibC::Char*, x1 : GuIntBig, x2 : LibC::Int) : LibC::Int
    fun print_double = CPLPrintDouble(x0 : LibC::Char*, x1 : LibC::Char*, x2 : LibC::Double, x3 : LibC::Char*) : LibC::Int
    fun print_time = CPLPrintTime(x0 : LibC::Char*, x1 : LibC::Int, x2 : LibC::Char*, x3 : Tm*, x4 : LibC::Char*) : LibC::Int
    fun print_pointer = CPLPrintPointer(x0 : LibC::Char*, x1 : Void*, x2 : LibC::Int) : LibC::Int
    fun get_symbol = CPLGetSymbol(x0 : LibC::Char*, x1 : LibC::Char*) : Void*
    fun get_exec_path = CPLGetExecPath(psz_path_buf : LibC::Char*, n_max_length : LibC::Int) : LibC::Int
    fun get_path = CPLGetPath(x0 : LibC::Char*) : LibC::Char*
    fun get_dirname = CPLGetDirname(x0 : LibC::Char*) : LibC::Char*
    fun get_filename = CPLGetFilename(x0 : LibC::Char*) : LibC::Char*
    fun get_basename = CPLGetBasename(x0 : LibC::Char*) : LibC::Char*
    fun get_extension = CPLGetExtension(x0 : LibC::Char*) : LibC::Char*
    fun get_current_dir = CPLGetCurrentDir : LibC::Char*
    fun form_filename = CPLFormFilename(psz_path : LibC::Char*, psz_basename : LibC::Char*, psz_extension : LibC::Char*) : LibC::Char*
    fun form_ci_filename = CPLFormCIFilename(psz_path : LibC::Char*, psz_basename : LibC::Char*, psz_extension : LibC::Char*) : LibC::Char*
    fun reset_extension = CPLResetExtension(x0 : LibC::Char*, x1 : LibC::Char*) : LibC::Char*
    fun project_relative_filename = CPLProjectRelativeFilename(psz_project_dir : LibC::Char*, psz_secondary_filename : LibC::Char*) : LibC::Char*
    fun is_filename_relative = CPLIsFilenameRelative(psz_filename : LibC::Char*) : LibC::Int
    fun extract_relative_path = CPLExtractRelativePath(x0 : LibC::Char*, x1 : LibC::Char*, x2 : LibC::Int*) : LibC::Char*
    fun clean_trailing_slash = CPLCleanTrailingSlash(x0 : LibC::Char*) : LibC::Char*
    fun corresponding_paths = CPLCorrespondingPaths(psz_old_filename : LibC::Char*, psz_new_filename : LibC::Char*, papsz_file_list : LibC::Char**) : LibC::Char**
    fun check_for_file = CPLCheckForFile(psz_filename : LibC::Char*, papsz_sibling_list : LibC::Char**) : LibC::Int
    fun generate_temp_filename = CPLGenerateTempFilename(psz_stem : LibC::Char*) : LibC::Char*
    fun expand_tilde = CPLExpandTilde(psz_filename : LibC::Char*) : LibC::Char*
    fun find_file = CPLFindFile(psz_class : LibC::Char*, psz_basename : LibC::Char*) : LibC::Char*
    fun default_find_file = CPLDefaultFindFile(psz_class : LibC::Char*, psz_basename : LibC::Char*) : LibC::Char*
    fun push_file_finder = CPLPushFileFinder(pfn_finder : FileFinder)
    alias FileFinder = (LibC::Char*, LibC::Char* -> LibC::Char*)
    fun pop_file_finder = CPLPopFileFinder : FileFinder
    fun push_finder_location = CPLPushFinderLocation(x0 : LibC::Char*)
    fun pop_finder_location = CPLPopFinderLocation
    fun finder_clean = CPLFinderClean
    fun stat = CPLStat(x0 : LibC::Char*, x1 : StatBuf*) : LibC::Int
    fun open_shared = CPLOpenShared(x0 : LibC::Char*, x1 : LibC::Char*, x2 : LibC::Int) : File*
    fun close_shared = CPLCloseShared(x0 : File*)
    fun get_shared_list = CPLGetSharedList(x0 : LibC::Int*) : SharedFileInfo*
    struct SharedFileInfo
      fp : File*
      n_ref_count : LibC::Int
      b_large : LibC::Int
      psz_filename : LibC::Char*
      psz_access : LibC::Char*
    end
    fun dump_shared_list = CPLDumpSharedList(x0 : File*)
    fun cleanup_shared_file_mutex = CPLCleanupSharedFileMutex
    fun dms_to_dec = CPLDMSToDec(is : LibC::Char*) : LibC::Double
    fun dec_to_dms = CPLDecToDMS(df_angle : LibC::Double, psz_axis : LibC::Char*, n_precision : LibC::Int) : LibC::Char*
    fun packed_dms_to_dec = CPLPackedDMSToDec(x0 : LibC::Double) : LibC::Double
    fun dec_to_packed_dms = CPLDecToPackedDMS(df_dec : LibC::Double) : LibC::Double
    fun string_to_complex = CPLStringToComplex(psz_string : LibC::Char*, pdf_real : LibC::Double*, pdf_imag : LibC::Double*)
    fun unlink_tree = CPLUnlinkTree(x0 : LibC::Char*) : LibC::Int
    fun copy_file = CPLCopyFile(psz_new_path : LibC::Char*, psz_old_path : LibC::Char*) : LibC::Int
    fun copy_tree = CPLCopyTree(psz_new_path : LibC::Char*, psz_old_path : LibC::Char*) : LibC::Int
    fun move_file = CPLMoveFile(psz_new_path : LibC::Char*, psz_old_path : LibC::Char*) : LibC::Int
    fun symlink = CPLSymlink(psz_old_path : LibC::Char*, psz_new_path : LibC::Char*, papsz_options : LibC::Char**) : LibC::Int
    fun create_zip = CPLCreateZip(psz_zip_filename : LibC::Char*, papsz_options : LibC::Char**) : Void*
    fun create_file_in_zip = CPLCreateFileInZip(h_zip : Void*, psz_filename : LibC::Char*, papsz_options : LibC::Char**) : Err
    fun write_file_in_zip = CPLWriteFileInZip(h_zip : Void*, p_buffer : Void*, n_buffer_size : LibC::Int) : Err
    fun close_file_in_zip = CPLCloseFileInZip(h_zip : Void*) : Err
    fun close_zip = CPLCloseZip(h_zip : Void*) : Err
    fun z_lib_deflate = CPLZLibDeflate(ptr : Void*, n_bytes : LibC::SizeT, n_level : LibC::Int, outptr : Void*, n_out_available_bytes : LibC::SizeT, pn_out_bytes : LibC::SizeT*) : Void*
    fun z_lib_inflate = CPLZLibInflate(ptr : Void*, n_bytes : LibC::SizeT, outptr : Void*, n_out_available_bytes : LibC::SizeT, pn_out_bytes : LibC::SizeT*) : Void*
    fun validate_xml = CPLValidateXML(psz_xml_filename : LibC::Char*, psz_xsd_filename : LibC::Char*, papsz_options : LibC::Char**) : LibC::Int
    fun setlocale = CPLsetlocale(category : LibC::Int, locale : LibC::Char*) : LibC::Char*
    fun cleanup_setlocale_mutex = CPLCleanupSetlocaleMutex
  end
end
