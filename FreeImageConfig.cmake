# ┌─┐┬ ┬┬─┐┌─┐┬─┐┌─┐  ┌─┐┬─┐┌─┐┌┬┐┌─┐┬ ┬┌─┐┬─┐┬┌─
# ├─┤│ │├┬┘│ │├┬┘├─┤  ├┤ ├┬┘├─┤│││├┤ ││││ │├┬┘├┴┐
# ┴ ┴└─┘┴└─└─┘┴└─┴ ┴  └  ┴└─┴ ┴┴ ┴└─┘└┴┘└─┘┴└─┴ ┴
# A Powerful General Purpose Framework
# More information in: https://aurora-fw.github.io/
#
# Copyright (C) 2017 Aurora Framework, All rights reserved.
#
# This file is part of the Aurora Framework. This framework is free
# software; you can redistribute it and/or modify it under the terms of
# the GNU Lesser General Public License version 3 as published by the
# Free Software Foundation and appearing in the file LICENSE included in
# the packaging of this file. Please review the following information to
# ensure the GNU Lesser General Public License version 3 requirements
# will be met: https://www.gnu.org/licenses/lgpl-3.0.html.

################################################################################
# FreeImage package finder
################################################################################
# Find the native FreeImage includes and library
#
# This module defines
# FreeImage_INCLUDE_DIR, the FreeImage include directories 
# FreeImage_LIBRARIES, link these to use FreeImage
# FreeImage_FOUND, system has FreeImage

if(NOT DEFINED FREEIMAGE_MODULE_LOADED)
	set(FREEIMAGE_MODULE_LOADED true)
	IF(NOT DEFINED AURORAFW_IS_BUILDING)
		find_package(AuroraFWBuild REQUIRED)
	ENDIF()

	findpkg_begin(FreeImage)

	getenv_path(FREEIMAGE_HOME)

	set(FreeImage_PREFIX_PATH ${FREEIMAGE_HOME} ${ENV_FREEIMAGE_HOME})
	create_search_paths(FreeImage)

	clear_if_changed(FreeImage_PREFIX_PATH
		FreeImage_LIBRARY_FWK
		FreeImage_LIBRARY_REL
		FreeImage_LIBRARY_DBG
		FreeImage_INCLUDE_DIR
	)

	set(FreeImage_LIBRARY_NAMES freeimage freeimageLib FreeImage FreeImageLib)
	get_debug_names(FreeImage_LIBRARY_NAMES)

	findpkg_framework(FreeImage)

	find_path(FreeImage_INCLUDE_DIR NAMES FreeImage.h HINTS ${FreeImage_INC_SEARCH_PATH} ${FreeImage_PKGC_INCLUDE_DIRS})

	find_library(FreeImage_LIBRARY_REL NAMES ${FreeImage_LIBRARY_NAMES} HINTS ${FreeImage_LIB_SEARCH_PATH} ${FreeImage_PKGC_LIBRARY_DIRS} PATH_SUFFIXES "" Release RelWithDebInfo MinSizeRel)
	find_library(FreeImage_LIBRARY_DBG NAMES ${FreeImage_LIBRARY_NAMES_DBG} HINTS ${FreeImage_LIB_SEARCH_PATH} ${FreeImage_PKGC_LIBRARY_DIRS} PATH_SUFFIXES "" Debug)

	make_library_set(FreeImage_LIBRARY)

	findpkg_finish(FreeImage)

endif(NOT DEFINED FREEIMAGE_MODULE_LOADED)
################################################################################