# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/firefly/projet/aruco-2.0.7

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/firefly/projet/aruco-2.0.7/build

# Include any dependencies generated for this target.
include utils/CMakeFiles/aruco_print_dictionary.dir/depend.make

# Include the progress variables for this target.
include utils/CMakeFiles/aruco_print_dictionary.dir/progress.make

# Include the compile flags for this target's objects.
include utils/CMakeFiles/aruco_print_dictionary.dir/flags.make

utils/CMakeFiles/aruco_print_dictionary.dir/aruco_print_dictionary.cpp.o: utils/CMakeFiles/aruco_print_dictionary.dir/flags.make
utils/CMakeFiles/aruco_print_dictionary.dir/aruco_print_dictionary.cpp.o: ../utils/aruco_print_dictionary.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/firefly/projet/aruco-2.0.7/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object utils/CMakeFiles/aruco_print_dictionary.dir/aruco_print_dictionary.cpp.o"
	cd /home/firefly/projet/aruco-2.0.7/build/utils && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/aruco_print_dictionary.dir/aruco_print_dictionary.cpp.o -c /home/firefly/projet/aruco-2.0.7/utils/aruco_print_dictionary.cpp

utils/CMakeFiles/aruco_print_dictionary.dir/aruco_print_dictionary.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/aruco_print_dictionary.dir/aruco_print_dictionary.cpp.i"
	cd /home/firefly/projet/aruco-2.0.7/build/utils && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/firefly/projet/aruco-2.0.7/utils/aruco_print_dictionary.cpp > CMakeFiles/aruco_print_dictionary.dir/aruco_print_dictionary.cpp.i

utils/CMakeFiles/aruco_print_dictionary.dir/aruco_print_dictionary.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/aruco_print_dictionary.dir/aruco_print_dictionary.cpp.s"
	cd /home/firefly/projet/aruco-2.0.7/build/utils && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/firefly/projet/aruco-2.0.7/utils/aruco_print_dictionary.cpp -o CMakeFiles/aruco_print_dictionary.dir/aruco_print_dictionary.cpp.s

utils/CMakeFiles/aruco_print_dictionary.dir/aruco_print_dictionary.cpp.o.requires:
.PHONY : utils/CMakeFiles/aruco_print_dictionary.dir/aruco_print_dictionary.cpp.o.requires

utils/CMakeFiles/aruco_print_dictionary.dir/aruco_print_dictionary.cpp.o.provides: utils/CMakeFiles/aruco_print_dictionary.dir/aruco_print_dictionary.cpp.o.requires
	$(MAKE) -f utils/CMakeFiles/aruco_print_dictionary.dir/build.make utils/CMakeFiles/aruco_print_dictionary.dir/aruco_print_dictionary.cpp.o.provides.build
.PHONY : utils/CMakeFiles/aruco_print_dictionary.dir/aruco_print_dictionary.cpp.o.provides

utils/CMakeFiles/aruco_print_dictionary.dir/aruco_print_dictionary.cpp.o.provides.build: utils/CMakeFiles/aruco_print_dictionary.dir/aruco_print_dictionary.cpp.o

# Object files for target aruco_print_dictionary
aruco_print_dictionary_OBJECTS = \
"CMakeFiles/aruco_print_dictionary.dir/aruco_print_dictionary.cpp.o"

# External object files for target aruco_print_dictionary
aruco_print_dictionary_EXTERNAL_OBJECTS =

utils/aruco_print_dictionary: utils/CMakeFiles/aruco_print_dictionary.dir/aruco_print_dictionary.cpp.o
utils/aruco_print_dictionary: utils/CMakeFiles/aruco_print_dictionary.dir/build.make
utils/aruco_print_dictionary: src/libaruco.so.2.0.7
utils/aruco_print_dictionary: /usr/lib/arm-linux-gnueabihf/libopencv_videostab.so.2.4.8
utils/aruco_print_dictionary: /usr/lib/arm-linux-gnueabihf/libopencv_video.so.2.4.8
utils/aruco_print_dictionary: /usr/lib/arm-linux-gnueabihf/libopencv_ts.so.2.4.8
utils/aruco_print_dictionary: /usr/lib/arm-linux-gnueabihf/libopencv_superres.so.2.4.8
utils/aruco_print_dictionary: /usr/lib/arm-linux-gnueabihf/libopencv_stitching.so.2.4.8
utils/aruco_print_dictionary: /usr/lib/arm-linux-gnueabihf/libopencv_photo.so.2.4.8
utils/aruco_print_dictionary: /usr/lib/arm-linux-gnueabihf/libopencv_ocl.so.2.4.8
utils/aruco_print_dictionary: /usr/lib/arm-linux-gnueabihf/libopencv_objdetect.so.2.4.8
utils/aruco_print_dictionary: /usr/lib/arm-linux-gnueabihf/libopencv_ml.so.2.4.8
utils/aruco_print_dictionary: /usr/lib/arm-linux-gnueabihf/libopencv_legacy.so.2.4.8
utils/aruco_print_dictionary: /usr/lib/arm-linux-gnueabihf/libopencv_imgproc.so.2.4.8
utils/aruco_print_dictionary: /usr/lib/arm-linux-gnueabihf/libopencv_highgui.so.2.4.8
utils/aruco_print_dictionary: /usr/lib/arm-linux-gnueabihf/libopencv_gpu.so.2.4.8
utils/aruco_print_dictionary: /usr/lib/arm-linux-gnueabihf/libopencv_flann.so.2.4.8
utils/aruco_print_dictionary: /usr/lib/arm-linux-gnueabihf/libopencv_features2d.so.2.4.8
utils/aruco_print_dictionary: /usr/lib/arm-linux-gnueabihf/libopencv_core.so.2.4.8
utils/aruco_print_dictionary: /usr/lib/arm-linux-gnueabihf/libopencv_contrib.so.2.4.8
utils/aruco_print_dictionary: /usr/lib/arm-linux-gnueabihf/libopencv_calib3d.so.2.4.8
utils/aruco_print_dictionary: /usr/lib/arm-linux-gnueabihf/libopencv_photo.so.2.4.8
utils/aruco_print_dictionary: /usr/lib/arm-linux-gnueabihf/libopencv_legacy.so.2.4.8
utils/aruco_print_dictionary: /usr/lib/arm-linux-gnueabihf/libopencv_video.so.2.4.8
utils/aruco_print_dictionary: /usr/lib/arm-linux-gnueabihf/libopencv_objdetect.so.2.4.8
utils/aruco_print_dictionary: /usr/lib/arm-linux-gnueabihf/libopencv_ml.so.2.4.8
utils/aruco_print_dictionary: /usr/lib/arm-linux-gnueabihf/libopencv_calib3d.so.2.4.8
utils/aruco_print_dictionary: /usr/lib/arm-linux-gnueabihf/libopencv_features2d.so.2.4.8
utils/aruco_print_dictionary: /usr/lib/arm-linux-gnueabihf/libopencv_highgui.so.2.4.8
utils/aruco_print_dictionary: /usr/lib/arm-linux-gnueabihf/libopencv_imgproc.so.2.4.8
utils/aruco_print_dictionary: /usr/lib/arm-linux-gnueabihf/libopencv_flann.so.2.4.8
utils/aruco_print_dictionary: /usr/lib/arm-linux-gnueabihf/libopencv_core.so.2.4.8
utils/aruco_print_dictionary: utils/CMakeFiles/aruco_print_dictionary.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable aruco_print_dictionary"
	cd /home/firefly/projet/aruco-2.0.7/build/utils && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/aruco_print_dictionary.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
utils/CMakeFiles/aruco_print_dictionary.dir/build: utils/aruco_print_dictionary
.PHONY : utils/CMakeFiles/aruco_print_dictionary.dir/build

utils/CMakeFiles/aruco_print_dictionary.dir/requires: utils/CMakeFiles/aruco_print_dictionary.dir/aruco_print_dictionary.cpp.o.requires
.PHONY : utils/CMakeFiles/aruco_print_dictionary.dir/requires

utils/CMakeFiles/aruco_print_dictionary.dir/clean:
	cd /home/firefly/projet/aruco-2.0.7/build/utils && $(CMAKE_COMMAND) -P CMakeFiles/aruco_print_dictionary.dir/cmake_clean.cmake
.PHONY : utils/CMakeFiles/aruco_print_dictionary.dir/clean

utils/CMakeFiles/aruco_print_dictionary.dir/depend:
	cd /home/firefly/projet/aruco-2.0.7/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/firefly/projet/aruco-2.0.7 /home/firefly/projet/aruco-2.0.7/utils /home/firefly/projet/aruco-2.0.7/build /home/firefly/projet/aruco-2.0.7/build/utils /home/firefly/projet/aruco-2.0.7/build/utils/CMakeFiles/aruco_print_dictionary.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : utils/CMakeFiles/aruco_print_dictionary.dir/depend

