#!/bin/bash
[ ! -d "libfmsynth" ] && git clone https://github.com/Themaister/libfmsynth
[ ! -d "build" ] && mkdir build
cd build
cmake ..
make
ls -l *so
cd ..