#!/bin/bash

source $GATE_ROOT_DIR/scripts/pre-configure.sh

cd $GATE_ROOT_DIR/gate/bin && \
  source $PWD/../../geant4/install/bin/geant4.sh && \
  source $PWD/../../root-cern/install/bin/thisroot.sh && \
  cmake ../src/ -DGeant4_DIR=$PWD/../../geant4/install \
                  -DGEANT4_USE_SYSTEM_CLHEP=ON \
                  -DGATE_USE_ITK=ON \
                  -DITK_DIR=$PWD/../../ITK/bin \
                  -DGATE_USE_RTK=$USE_RTK \
                  -DGATE_USE_OPTICAL=ON \
                  -DCMAKE_BUILD_TYPE=$CMAKE_BUILD_TYPE \
                  -DCMAKE_CXX_STANDARD=17 

