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
CMAKE_SOURCE_DIR = /home/firefly/projet/opencv-2.4.13

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/firefly/projet/opencv-2.4.13/build

# Utility rule file for pch_Generate_opencv_test_stitching.

# Include the progress variables for this target.
include modules/stitching/CMakeFiles/pch_Generate_opencv_test_stitching.dir/progress.make

modules/stitching/CMakeFiles/pch_Generate_opencv_test_stitching: modules/stitching/test_precomp.hpp.gch/opencv_test_stitching_Release.gch

modules/stitching/test_precomp.hpp.gch/opencv_test_stitching_Release.gch: ../modules/stitching/test/test_precomp.hpp
modules/stitching/test_precomp.hpp.gch/opencv_test_stitching_Release.gch: modules/stitching/test_precomp.hpp
modules/stitching/test_precomp.hpp.gch/opencv_test_stitching_Release.gch: lib/libopencv_test_stitching_pch_dephelp.a
	$(CMAKE_COMMAND) -E cmake_progress_report /home/firefly/projet/opencv-2.4.13/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating test_precomp.hpp.gch/opencv_test_stitching_Release.gch"
	cd /home/firefly/projet/opencv-2.4.13/build/modules/stitching && /usr/bin/cmake -E make_directory /home/firefly/projet/opencv-2.4.13/build/modules/stitching/test_precomp.hpp.gch
	cd /home/firefly/projet/opencv-2.4.13/build/modules/stitching && /usr/bin/c++ -O3 -DNDEBUG -DNDEBUG -I"/home/firefly/projet/opencv-2.4.13/modules/stitching/test" -I"/home/firefly/projet/opencv-2.4.13/modules/video/include" -I"/home/firefly/projet/opencv-2.4.13/modules/calib3d/include" -I"/home/firefly/projet/opencv-2.4.13/modules/features2d/include" -I"/home/firefly/projet/opencv-2.4.13/modules/highgui/include" -I"/home/firefly/projet/opencv-2.4.13/modules/imgproc/include" -I"/home/firefly/projet/opencv-2.4.13/modules/flann/include" -I"/home/firefly/projet/opencv-2.4.13/modules/core/include" -I"/home/firefly/projet/opencv-2.4.13/modules/highgui/include" -I"/home/firefly/projet/opencv-2.4.13/modules/ts/include" -I"/home/firefly/projet/opencv-2.4.13/modules/stitching/include" -I"/home/firefly/projet/opencv-2.4.13/modules/nonfree/include" -I"/home/firefly/projet/opencv-2.4.13/modules/ocl/include" -I"/home/firefly/projet/opencv-2.4.13/modules/gpu/include" -I"/home/firefly/projet/opencv-2.4.13/modules/photo/include" -I"/home/firefly/projet/opencv-2.4.13/modules/objdetect/include" -I"/home/firefly/projet/opencv-2.4.13/modules/legacy/include" -I"/home/firefly/projet/opencv-2.4.13/modules/video/include" -I"/home/firefly/projet/opencv-2.4.13/modules/ml/include" -I"/home/firefly/projet/opencv-2.4.13/modules/calib3d/include" -I"/home/firefly/projet/opencv-2.4.13/modules/features2d/include" -I"/home/firefly/projet/opencv-2.4.13/modules/highgui/include" -I"/home/firefly/projet/opencv-2.4.13/modules/imgproc/include" -I"/home/firefly/projet/opencv-2.4.13/modules/flann/include" -I"/home/firefly/projet/opencv-2.4.13/modules/core/include" -isystem"/home/firefly/projet/opencv-2.4.13/build/modules/stitching" -I"/home/firefly/projet/opencv-2.4.13/modules/stitching/src" -I"/home/firefly/projet/opencv-2.4.13/modules/stitching/include" -I"/home/firefly/projet/opencv-2.4.13/modules/nonfree/include" -I"/home/firefly/projet/opencv-2.4.13/modules/ocl/include" -I"/home/firefly/projet/opencv-2.4.13/modules/gpu/include" -I"/home/firefly/projet/opencv-2.4.13/modules/photo/include" -I"/home/firefly/projet/opencv-2.4.13/modules/objdetect/include" -I"/home/firefly/projet/opencv-2.4.13/modules/legacy/include" -I"/home/firefly/projet/opencv-2.4.13/modules/video/include" -I"/home/firefly/projet/opencv-2.4.13/modules/ml/include" -I"/home/firefly/projet/opencv-2.4.13/modules/calib3d/include" -I"/home/firefly/projet/opencv-2.4.13/modules/features2d/include" -I"/home/firefly/projet/opencv-2.4.13/modules/highgui/include" -I"/home/firefly/projet/opencv-2.4.13/modules/imgproc/include" -I"/home/firefly/projet/opencv-2.4.13/modules/flann/include" -I"/home/firefly/projet/opencv-2.4.13/modules/core/include" -isystem"/home/firefly/projet/opencv-2.4.13/build/modules/stitching" -I"/home/firefly/projet/opencv-2.4.13/modules/stitching/src" -I"/home/firefly/projet/opencv-2.4.13/modules/stitching/include" -isystem"/home/firefly/projet/opencv-2.4.13/build" -isystem"/usr/include/eigen3" -I"/home/firefly/projet/opencv-2.4.13/modules/stitching/test" -I"/home/firefly/projet/opencv-2.4.13/modules/video/include" -I"/home/firefly/projet/opencv-2.4.13/modules/calib3d/include" -I"/home/firefly/projet/opencv-2.4.13/modules/features2d/include" -I"/home/firefly/projet/opencv-2.4.13/modules/highgui/include" -I"/home/firefly/projet/opencv-2.4.13/modules/imgproc/include" -I"/home/firefly/projet/opencv-2.4.13/modules/flann/include" -I"/home/firefly/projet/opencv-2.4.13/modules/core/include" -I"/home/firefly/projet/opencv-2.4.13/modules/highgui/include" -I"/home/firefly/projet/opencv-2.4.13/modules/ts/include" -I"/home/firefly/projet/opencv-2.4.13/modules/stitching/include" -I"/home/firefly/projet/opencv-2.4.13/modules/nonfree/include" -I"/home/firefly/projet/opencv-2.4.13/modules/ocl/include" -I"/home/firefly/projet/opencv-2.4.13/modules/gpu/include" -I"/home/firefly/projet/opencv-2.4.13/modules/photo/include" -I"/home/firefly/projet/opencv-2.4.13/modules/objdetect/include" -I"/home/firefly/projet/opencv-2.4.13/modules/legacy/include" -I"/home/firefly/projet/opencv-2.4.13/modules/video/include" -I"/home/firefly/projet/opencv-2.4.13/modules/ml/include" -I"/home/firefly/projet/opencv-2.4.13/modules/calib3d/include" -I"/home/firefly/projet/opencv-2.4.13/modules/features2d/include" -I"/home/firefly/projet/opencv-2.4.13/modules/highgui/include" -I"/home/firefly/projet/opencv-2.4.13/modules/imgproc/include" -I"/home/firefly/projet/opencv-2.4.13/modules/flann/include" -I"/home/firefly/projet/opencv-2.4.13/modules/core/include" -isystem"/home/firefly/projet/opencv-2.4.13/build/modules/stitching" -I"/home/firefly/projet/opencv-2.4.13/modules/stitching/src" -I"/home/firefly/projet/opencv-2.4.13/modules/stitching/include" -I"/home/firefly/projet/opencv-2.4.13/modules/nonfree/include" -I"/home/firefly/projet/opencv-2.4.13/modules/ocl/include" -I"/home/firefly/projet/opencv-2.4.13/modules/gpu/include" -I"/home/firefly/projet/opencv-2.4.13/modules/photo/include" -I"/home/firefly/projet/opencv-2.4.13/modules/objdetect/include" -I"/home/firefly/projet/opencv-2.4.13/modules/legacy/include" -I"/home/firefly/projet/opencv-2.4.13/modules/video/include" -I"/home/firefly/projet/opencv-2.4.13/modules/ml/include" -I"/home/firefly/projet/opencv-2.4.13/modules/calib3d/include" -I"/home/firefly/projet/opencv-2.4.13/modules/features2d/include" -I"/home/firefly/projet/opencv-2.4.13/modules/highgui/include" -I"/home/firefly/projet/opencv-2.4.13/modules/imgproc/include" -I"/home/firefly/projet/opencv-2.4.13/modules/flann/include" -I"/home/firefly/projet/opencv-2.4.13/modules/core/include" -isystem"/home/firefly/projet/opencv-2.4.13/build/modules/stitching" -I"/home/firefly/projet/opencv-2.4.13/modules/stitching/src" -I"/home/firefly/projet/opencv-2.4.13/modules/stitching/include" -isystem"/home/firefly/projet/opencv-2.4.13/build" -isystem"/usr/include/eigen3" -fsigned-char -W -Wall -Werror=return-type -Werror=address -Werror=sequence-point -Wformat -Werror=format-security -Wmissing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-promo -Wno-narrowing -Wno-delete-non-virtual-dtor -Wno-array-bounds -Wno-aggressive-loop-optimizations -fdiagnostics-show-option -pthread -fomit-frame-pointer -ffunction-sections -x c++-header -o /home/firefly/projet/opencv-2.4.13/build/modules/stitching/test_precomp.hpp.gch/opencv_test_stitching_Release.gch /home/firefly/projet/opencv-2.4.13/build/modules/stitching/test_precomp.hpp

modules/stitching/test_precomp.hpp: ../modules/stitching/test/test_precomp.hpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/firefly/projet/opencv-2.4.13/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating test_precomp.hpp"
	cd /home/firefly/projet/opencv-2.4.13/build/modules/stitching && /usr/bin/cmake -E copy_if_different /home/firefly/projet/opencv-2.4.13/modules/stitching/test/test_precomp.hpp /home/firefly/projet/opencv-2.4.13/build/modules/stitching/test_precomp.hpp

pch_Generate_opencv_test_stitching: modules/stitching/CMakeFiles/pch_Generate_opencv_test_stitching
pch_Generate_opencv_test_stitching: modules/stitching/test_precomp.hpp.gch/opencv_test_stitching_Release.gch
pch_Generate_opencv_test_stitching: modules/stitching/test_precomp.hpp
pch_Generate_opencv_test_stitching: modules/stitching/CMakeFiles/pch_Generate_opencv_test_stitching.dir/build.make
.PHONY : pch_Generate_opencv_test_stitching

# Rule to build all files generated by this target.
modules/stitching/CMakeFiles/pch_Generate_opencv_test_stitching.dir/build: pch_Generate_opencv_test_stitching
.PHONY : modules/stitching/CMakeFiles/pch_Generate_opencv_test_stitching.dir/build

modules/stitching/CMakeFiles/pch_Generate_opencv_test_stitching.dir/clean:
	cd /home/firefly/projet/opencv-2.4.13/build/modules/stitching && $(CMAKE_COMMAND) -P CMakeFiles/pch_Generate_opencv_test_stitching.dir/cmake_clean.cmake
.PHONY : modules/stitching/CMakeFiles/pch_Generate_opencv_test_stitching.dir/clean

modules/stitching/CMakeFiles/pch_Generate_opencv_test_stitching.dir/depend:
	cd /home/firefly/projet/opencv-2.4.13/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/firefly/projet/opencv-2.4.13 /home/firefly/projet/opencv-2.4.13/modules/stitching /home/firefly/projet/opencv-2.4.13/build /home/firefly/projet/opencv-2.4.13/build/modules/stitching /home/firefly/projet/opencv-2.4.13/build/modules/stitching/CMakeFiles/pch_Generate_opencv_test_stitching.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : modules/stitching/CMakeFiles/pch_Generate_opencv_test_stitching.dir/depend

