# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.14

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake3

# The command to remove a file.
RM = /usr/bin/cmake3 -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/vladimirg/university/parallel/lab2/project

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/vladimirg/university/parallel/lab2/project/build

# Include any dependencies generated for this target.
include CMakeFiles/lab2-par.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/lab2-par.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/lab2-par.dir/flags.make

CMakeFiles/lab2-par.dir/main.c.o: CMakeFiles/lab2-par.dir/flags.make
CMakeFiles/lab2-par.dir/main.c.o: ../main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/vladimirg/university/parallel/lab2/project/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/lab2-par.dir/main.c.o"
	/usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/lab2-par.dir/main.c.o   -c /home/vladimirg/university/parallel/lab2/project/main.c

CMakeFiles/lab2-par.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lab2-par.dir/main.c.i"
	$(CMAKE_COMMAND) -E cmake_unimplemented_variable CMAKE_C_CREATE_PREPROCESSED_SOURCE

CMakeFiles/lab2-par.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lab2-par.dir/main.c.s"
	$(CMAKE_COMMAND) -E cmake_unimplemented_variable CMAKE_C_CREATE_ASSEMBLY_SOURCE

# Object files for target lab2-par
lab2__par_OBJECTS = \
"CMakeFiles/lab2-par.dir/main.c.o"

# External object files for target lab2-par
lab2__par_EXTERNAL_OBJECTS =

lab2-par: CMakeFiles/lab2-par.dir/main.c.o
lab2-par: CMakeFiles/lab2-par.dir/build.make
lab2-par: CMakeFiles/lab2-par.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/vladimirg/university/parallel/lab2/project/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable lab2-par"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/lab2-par.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/lab2-par.dir/build: lab2-par

.PHONY : CMakeFiles/lab2-par.dir/build

# Object files for target lab2-par
lab2__par_OBJECTS = \
"CMakeFiles/lab2-par.dir/main.c.o"

# External object files for target lab2-par
lab2__par_EXTERNAL_OBJECTS =

CMakeFiles/CMakeRelink.dir/lab2-par: CMakeFiles/lab2-par.dir/main.c.o
CMakeFiles/CMakeRelink.dir/lab2-par: CMakeFiles/lab2-par.dir/build.make
CMakeFiles/CMakeRelink.dir/lab2-par: CMakeFiles/lab2-par.dir/relink.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/vladimirg/university/parallel/lab2/project/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable CMakeFiles/CMakeRelink.dir/lab2-par"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/lab2-par.dir/relink.txt --verbose=$(VERBOSE)

# Rule to relink during preinstall.
CMakeFiles/lab2-par.dir/preinstall: CMakeFiles/CMakeRelink.dir/lab2-par

.PHONY : CMakeFiles/lab2-par.dir/preinstall

CMakeFiles/lab2-par.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/lab2-par.dir/cmake_clean.cmake
.PHONY : CMakeFiles/lab2-par.dir/clean

CMakeFiles/lab2-par.dir/depend:
	cd /home/vladimirg/university/parallel/lab2/project/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/vladimirg/university/parallel/lab2/project /home/vladimirg/university/parallel/lab2/project /home/vladimirg/university/parallel/lab2/project/build /home/vladimirg/university/parallel/lab2/project/build /home/vladimirg/university/parallel/lab2/project/build/CMakeFiles/lab2-par.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/lab2-par.dir/depend

