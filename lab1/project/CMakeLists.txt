cmake_minimum_required(VERSION 3.13.1)

project(lab1 LANGUAGES C VERSION 0.1.0)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

link_libraries(m)


if (CMAKE_C_COMPILER_ID EQUAL "GNU")
    set(THREADS 2)
    set(PARALLEL_OPT -floop-parallelize-all -ftree-parallelize-loops=${THREADS})
    add_executable(lab1-par-${THREADS} main.c)
    target_compile_options(lab1-par-${THREADS} PRIVATE -O3 -Wall -Werror ${PARALLEL_OPT})
    target_link_options(lab1-par-${THREADS} PRIVATE ${PARALLEL_OPT})

    set(THREADS 4)
    set(PARALLEL_OPT -floop-parallelize-all -ftree-parallelize-loops=${THREADS})
    add_executable(lab1-par-${THREADS} main.c)
    target_compile_options(lab1-par-${THREADS} PRIVATE -O3 -Wall -Werror ${PARALLEL_OPT})
    target_link_options(lab1-par-${THREADS} PRIVATE ${PARALLEL_OPT})

    set(THREADS 8)
    set(PARALLEL_OPT -floop-parallelize-all -ftree-parallelize-loops=${THREADS})
    add_executable(lab1-par-${THREADS} main.c)
    target_compile_options(lab1-par-${THREADS} PRIVATE -O3 -Wall -Werror ${PARALLEL_OPT})
    target_link_options(lab1-par-${THREADS} PRIVATE ${PARALLEL_OPT})

    set(THREADS 16)
    set(PARALLEL_OPT -floop-parallelize-all -ftree-parallelize-loops=${THREADS})
    add_executable(lab1-par-${THREADS} main.c)
    target_compile_options(lab1-par-${THREADS} PRIVATE -O3 -Wall -Werror ${PARALLEL_OPT})
    target_link_options(lab1-par-${THREADS} PRIVATE ${PARALLEL_OPT})

    set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
    add_executable(lab1-seq main.c)
    target_compile_options(lab1-seq PRIVATE -O3 -Wall -Werror)
    install(TARGETS lab1-seq lab1-par-2 lab1-par-4 lab1-par-8 lab1-par-16 RUNTIME DESTINATION "bin")
elseif (CMAKE_C_COMPILER_ID EQUAL "Clang")
    set(PARALLEL_OPT -polly-parallel)
    add_executable(lab1-par main.c)
    target_compile_options(lab1-par-${THREADS} PRIVATE -O3 -Wall -Werror ${PARALLEL_OPT})
    target_link_options(lab1-par-${THREADS} PRIVATE ${PARALLEL_OPT})

    set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
    add_executable(lab1-seq main.c)
    target_compile_options(lab1-seq PRIVATE -O3 -Wall -Werror)
    install(TARGETS lab1-seq lab1-par RUNTIME DESTINATION "bin")
endif()

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)