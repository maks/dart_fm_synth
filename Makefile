# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.13

# Default target executed when no arguments are given to make.
default_target: all

.PHONY : default_target

# Allow only one "make -f Makefile2" at a time, but pass parallelism.
.NOTPARALLEL:


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
CMAKE_SOURCE_DIR = /home/maks/work/dart_fm_synth

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/maks/work/dart_fm_synth

#=============================================================================
# Targets provided globally by CMake.

# Special rule for the target rebuild_cache
rebuild_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake to regenerate build system..."
	/usr/bin/cmake -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : rebuild_cache

# Special rule for the target rebuild_cache
rebuild_cache/fast: rebuild_cache

.PHONY : rebuild_cache/fast

# Special rule for the target edit_cache
edit_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "No interactive CMake dialog available..."
	/usr/bin/cmake -E echo No\ interactive\ CMake\ dialog\ available.
.PHONY : edit_cache

# Special rule for the target edit_cache
edit_cache/fast: edit_cache

.PHONY : edit_cache/fast

# The main all target
all: cmake_check_build_system
	$(CMAKE_COMMAND) -E cmake_progress_start /home/maks/work/dart_fm_synth/CMakeFiles /home/maks/work/dart_fm_synth/CMakeFiles/progress.marks
	$(MAKE) -f CMakeFiles/Makefile2 all
	$(CMAKE_COMMAND) -E cmake_progress_start /home/maks/work/dart_fm_synth/CMakeFiles 0
.PHONY : all

# The main clean target
clean:
	$(MAKE) -f CMakeFiles/Makefile2 clean
.PHONY : clean

# The main clean target
clean/fast: clean

.PHONY : clean/fast

# Prepare targets for installation.
preinstall: all
	$(MAKE) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall

# Prepare targets for installation.
preinstall/fast:
	$(MAKE) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall/fast

# clear depends
depend:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 1
.PHONY : depend

#=============================================================================
# Target rules for targets named libfmsynth_library

# Build rule for target.
libfmsynth_library: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 libfmsynth_library
.PHONY : libfmsynth_library

# fast build rule for target.
libfmsynth_library/fast:
	$(MAKE) -f CMakeFiles/libfmsynth_library.dir/build.make CMakeFiles/libfmsynth_library.dir/build
.PHONY : libfmsynth_library/fast

libfmsynth/src/fmsynth.o: libfmsynth/src/fmsynth.c.o

.PHONY : libfmsynth/src/fmsynth.o

# target to build an object file
libfmsynth/src/fmsynth.c.o:
	$(MAKE) -f CMakeFiles/libfmsynth_library.dir/build.make CMakeFiles/libfmsynth_library.dir/libfmsynth/src/fmsynth.c.o
.PHONY : libfmsynth/src/fmsynth.c.o

libfmsynth/src/fmsynth.i: libfmsynth/src/fmsynth.c.i

.PHONY : libfmsynth/src/fmsynth.i

# target to preprocess a source file
libfmsynth/src/fmsynth.c.i:
	$(MAKE) -f CMakeFiles/libfmsynth_library.dir/build.make CMakeFiles/libfmsynth_library.dir/libfmsynth/src/fmsynth.c.i
.PHONY : libfmsynth/src/fmsynth.c.i

libfmsynth/src/fmsynth.s: libfmsynth/src/fmsynth.c.s

.PHONY : libfmsynth/src/fmsynth.s

# target to generate assembly for a file
libfmsynth/src/fmsynth.c.s:
	$(MAKE) -f CMakeFiles/libfmsynth_library.dir/build.make CMakeFiles/libfmsynth_library.dir/libfmsynth/src/fmsynth.c.s
.PHONY : libfmsynth/src/fmsynth.c.s

# Help Target
help:
	@echo "The following are some of the valid targets for this Makefile:"
	@echo "... all (the default if no target is provided)"
	@echo "... clean"
	@echo "... depend"
	@echo "... rebuild_cache"
	@echo "... libfmsynth_library"
	@echo "... edit_cache"
	@echo "... libfmsynth/src/fmsynth.o"
	@echo "... libfmsynth/src/fmsynth.i"
	@echo "... libfmsynth/src/fmsynth.s"
.PHONY : help



#=============================================================================
# Special targets to cleanup operation of make.

# Special rule to run CMake to check the build system integrity.
# No rule that depends on this can have commands that come from listfiles
# because they might be regenerated.
cmake_check_build_system:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 0
.PHONY : cmake_check_build_system

