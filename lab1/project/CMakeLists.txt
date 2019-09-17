cmake_minimum_required(VERSION 3.0.0)
project(lab1 LANGUAGES C VERSION 0.1.0)

link_libraries(m)

add_executable(lab1-seq main.c)
target_compile_options(lab1-seq PRIVATE -O3 -Wall -Werror)

set(THREADS 2)
add_executable(lab1-par-${THREADS} main.c)
target_compile_options(lab1-par-${THREADS} PRIVATE -O3 -Wall -Werror -floop-parallelize-all -ftree-parallelize-loops=${THREADS})
target_link_options(lab1-par-${THREADS} PRIVATE -floop-parallelize-all -ftree-parallelize-loops=${THREADS})

set(THREADS 4)
add_executable(lab1-par-${THREADS} main.c)
target_compile_options(lab1-par-${THREADS} PRIVATE -O3 -Wall -Werror -floop-parallelize-all -ftree-parallelize-loops=${THREADS})
target_link_options(lab1-par-${THREADS} PRIVATE -floop-parallelize-all -ftree-parallelize-loops=${THREADS})

set(THREADS 8)
add_executable(lab1-par-${THREADS} main.c)
target_compile_options(lab1-par-${THREADS} PRIVATE -O3 -Wall -Werror -floop-parallelize-all -ftree-parallelize-loops=${THREADS})
target_link_options(lab1-par-${THREADS} PRIVATE -floop-parallelize-all -ftree-parallelize-loops=${THREADS})

set(THREADS 16)
add_executable(lab1-par-${THREADS} main.c)
target_compile_options(lab1-par-${THREADS} PRIVATE -O3 -Wall -Werror -floop-parallelize-all -ftree-parallelize-loops=${THREADS})
target_link_options(lab1-par-${THREADS} PRIVATE -floop-parallelize-all -ftree-parallelize-loops=${THREADS})


set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
install(TARGETS lab1-seq lab1-par-2 lab1-par-4 lab1-par-8 lab1-par-16 RUNTIME DESTINATION "bin")
include(CPack)