add_library(FMODStudio::FMODStudio SHARED IMPORTED)
get_filename_component(FMODSTUDIO_BASE_DIR "${CMAKE_CURRENT_LIST_DIR}/../../" ABSOLUTE)

# add info about location of the dynamic library file
set_target_properties(
    FMODStudio::FMODStudio PROPERTIES
    IMPORTED_IMPLIB "${FMODSTUDIO_BASE_DIR}/lib/libFMODStudio.dylib"
)

target_include_directories(FMODStudio::FMODStudio INTERFACE "${FMODSTUDIO_BASE_DIR}/include")
