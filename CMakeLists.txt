cmake_minimum_required(VERSION 3.7 FATAL_ERROR)
project(libfmsynth_library VERSION 1.0.0 LANGUAGES C)

include_directories(libfmsynth/include)

add_library(libfmsynth_library SHARED libfmsynth/src/fmsynth.c fmsynth.def)

set_target_properties(libfmsynth_library PROPERTIES
    PUBLIC_HEADER libfmsynth/include/fmsynth.h
    VERSION ${PROJECT_VERSION}
    SOVERSION 1
    OUTPUT_NAME "fmsynth"
    XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "Hex_Identity_ID_Goes_Here"
)