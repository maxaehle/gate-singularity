#!/bin/bash

source $GATE_ROOT_DIR/scripts/pre-configure.sh

cd $GATE_ROOT_DIR/clhep/bin && \
  cmake -DCMAKE_INSTALL_PREFIX=$PWD/../install -DCMAKE_BUILD_TYPE=$CMAKE_BUILD_TYPE ../src/CLHEP

