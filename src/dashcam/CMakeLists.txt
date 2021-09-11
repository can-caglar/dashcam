# The following lines of boilerplate have to be in your project's
# CMakeLists in this exact order for cmake to work correctly
cmake_minimum_required(VERSION 3.5)

add_compile_options (-fdiagnostics-color=always)

# Below is to include the extra esp component drivers from UncleRus
set(EXTRA_COMPONENT_DIRS ${CMAKE_CURRENT_LIST_DIR}/../esp/lib-esp-idf/components)

include($ENV{IDF_PATH}/tools/cmake/project.cmake)
project(dashcam)
