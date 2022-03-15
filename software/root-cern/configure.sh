#!/bin/bash

source $GATE_ROOT_DIR/scripts/pre-configure.sh

cd $GATE_ROOT_DIR/root-cern/bin && \
  cmake ../src/ -Dpython=OFF \
                  -DCMAKE_INSTALL_PREFIX=$PWD/../install \
                  -DCMAKE_BUILD_TYPE=$CMAKE_BUILD_TYPE \
                  -DCMAKE_CXX_STANDARD=17 

