#!/bin/bash

source $GATE_ROOT_DIR/scripts/pre-configure.sh

cd $GATE_ROOT_DIR/geant4/bin && \
  cmake ../src/ -DGEANT4_INSTALL_DATA=ON \
                  -DGEANT4_INSTALL_DATADIR=../data \
                  -DGEANT4_USE_QT=ON \
                  -DCMAKE_INSTALL_PREFIX=$PWD/../install \
                  -DGEANT4_USE_OPENGL_X11=ON \
                  -DGEANT4_USE_SYSTEM_CLHEP=ON \
                  -DCLHEP_ROOT_DIR=$PWD/../../clhep/install \
                  -DGEANT4_BUILD_MULTITHREADED=ON \
                  -DCMAKE_BUILD_TYPE=$CMAKE_BUILD_TYPE

