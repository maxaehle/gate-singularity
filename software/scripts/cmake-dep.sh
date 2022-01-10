#!/bin/bash
# Run this script once inside the container to run CMake for all subprojects.

export CMAKE_BUILD_TYPE=Debug
source $GATE_ROOT_DIR/scripts/versions.sh

# CLHEP
cd $GATE_ROOT_DIR/clhep/bin && \
  cmake -DCMAKE_INSTALL_PREFIX=$PWD/../install -DCMAKE_BUILD_TYPE=$CMAKE_BUILD_TYPE ../src/CLHEP
  
# Geant4
cd $GATE_ROOT_DIR/geant4/bin && \
  cmake ../src/ -DGEANT4_INSTALL_DATA=ON \
                  -DGEANT4_INSTALL_DATADIR=../data \
                  -DGEANT4_USE_QT=ON \
                  -DCMAKE_INSTALL_PREFIX=$PWD/../install \
                  -DGEANT4_USE_OPENGL_X11=ON \
                  -DGEANT4_USE_SYSTEM_CLHEP=ON \
                  -DCLHEP_ROOT_DIR=$PWD/../../clhep/install \
                  -DCMAKE_BUILD_TYPE=$CMAKE_BUILD_TYPE 

# ITK
cd $GATE_ROOT_DIR/ITK/bin && \
  cmake ../src/ -DCMAKE_CXX_FLAGS:STRING=-std=c++11 \
                  -DBUILD_DOCUMENTATION=OFF \
                  -DBUILD_EXAMPLES=OFF \
                  -DBUILD_TESTING=OFF \
                  -DModule_RTK=ON \
                  -DRTK_USE_CUDA=OFF \
                  -DCMAKE_BUILD_TYPE=$CMAKE_BUILD_TYPE \
                  -DRTK_BUILD_APPLICATIONS=OFF

# ROOT
cd $GATE_ROOT_DIR/root-cern/bin && \
  cmake ../src/ -Dpython=OFF \
                  -DCMAKE_INSTALL_PREFIX=$PWD/../install \
                  -DCMAKE_BUILD_TYPE=$CMAKE_BUILD_TYPE







