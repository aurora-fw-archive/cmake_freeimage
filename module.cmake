message(STATUS "Loading cmake module: FreeImage")
include(${CMAKE_MODULE_FREEIMAGE}/FreeImageConfig.cmake)
find_package(FreeImage)
install(FILES ${CMAKE_MODULE_FREEIMAGE}/FreeImageConfig.cmake DESTINATION share/cmake/FreeImage )