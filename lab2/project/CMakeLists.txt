cmake_minimum_required(VERSION 3.13.1)

project(lab2 LANGUAGES C VERSION 0.1.0)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

include_directories(/home/vladimirg/university/parallel/lab2/FW_1.2_ALL/FW_1.2_Lin64)
link_directories(/home/vladimirg/university/parallel/lab2/FW_1.2_ALL/FW_1.2_Lin64/lib)

link_libraries(m)
link_libraries(fwBase)
link_libraries(fwSignal)

add_executable(lab2-par main.c)
target_compile_options(lab2-par PRIVATE -m64 -g -Wall -Werror)

install(TARGETS lab2-par RUNTIME DESTINATION "bin")

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)