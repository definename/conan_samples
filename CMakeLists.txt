cmake_minimum_required(VERSION 3.7.0)

project(conan_samples)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}")
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

option(BUILD_WITH_STATIC_CRT "Use static run-time libraries (/MT or /MTd linker flags)" OFF)
option(BUILD_SHARED_LIBS "Build shared libraries (.dll) instead of static ones (.lib)" OFF)

include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup()

find_package(Boost REQUIRED)
find_package(OpenSSL REQUIRED)
find_package(ZLIB REQUIRED)

add_subdirectory(modules/poco_test)

