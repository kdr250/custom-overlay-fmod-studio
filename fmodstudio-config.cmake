add_library(FMODStudio::FMODStudio SHARED IMPORTED)
get_filename_component(FMODSTUDIO_BASE_DIR "${CMAKE_CURRENT_LIST_DIR}/../../" ABSOLUTE)

# add info about location of the dynamic library file
if (WIN32)
    cmake_path(SET FMODSTUDIO_DLL_PATH NORMALIZE ${FMODSTUDIO_BASE_DIR}/bin/fmodstudio.dll)
    cmake_path(SET FMODSTUDIO_LIB_PATH NORMALIZE ${FMODSTUDIO_BASE_DIR}/lib/fmodstudio_vc.lib)
    set_target_properties(
        FMODStudio::FMODStudio PROPERTIES
        IMPORTED_LOCATION "${FMODSTUDIO_DLL_PATH}"
        IMPORTED_IMPLIB "${FMODSTUDIO_LIB_PATH}"
    )
elseif (APPLE)
    set_target_properties(
        FMODStudio::FMODStudio PROPERTIES
        IMPORTED_IMPLIB "${FMODSTUDIO_BASE_DIR}/lib/libfmodstudio.dylib"
    )
endif()

target_include_directories(FMODStudio::FMODStudio INTERFACE "${FMODSTUDIO_BASE_DIR}/include")
