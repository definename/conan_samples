cmake_minimum_required(VERSION 3.2.1)

project(poco_test)

include(PCHSupport)
include(CRTLinkage)

set(PROJECT_SOURCES
	src/main.cpp
	src/poco_test.cpp
	)

set(PROJECT_HEADES
	include/poco_test.h
	)

set(MISC
	src/pch.h
	src/pch.cpp
	)

source_group("Header Files" FILES ${PROJECT_HEADERS})
source_group("Source Files" FILES ${PROJECT_SOURCES})
source_group("" FILES ${MISC})

add_definitions(
	-DUNICODE
	-D_UNICODE
	)

add_executable(${PROJECT_NAME}
	${PROJECT_SOURCES}
	${PROJECT_HEADES}
	${MISC}
	)

add_precompiled_headers(${PROJECT_NAME} "src/")

include_directories(
	${CMAKE_CURRENT_LIST_DIR}/include
	)

target_link_libraries(${PROJECT_NAME}
	${CONAN_LIBS})

#add_dependencies(${PROJECT_NAME}
#	)

#set_target_properties(${PROJECT_NAME} PROPERTIES EXCLUDE_FROM_DEFAULT_BUILD 1)	
