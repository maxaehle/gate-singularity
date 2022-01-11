#!/bin/bash

source $GATE_ROOT_DIR/scripts/pre-configure.sh

cd $GATE_ROOT_DIR/ITK/bin && \
  cmake ../src/ -DCMAKE_CXX_FLAGS:STRING=-std=c++11 \
                  -DBUILD_DOCUMENTATION=OFF \
                  -DBUILD_EXAMPLES=OFF \
                  -DBUILD_TESTING=OFF \
                  -DModule_RTK=ON \
                  -DRTK_USE_CUDA=OFF \
                  -DCMAKE_BUILD_TYPE=$CMAKE_BUILD_TYPE \
                  -DRTK_BUILD_APPLICATIONS=OFF

