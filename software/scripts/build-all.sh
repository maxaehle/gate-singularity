#!/bin/bash
# Run this script inside the container to (re-)build all subprojects.

export CMAKE_BUILD_TYPE=Debug
export MAX_NUM_BUILD_THREADS=32
source $GATE_ROOT_DIR/scripts/versions/Gate-9.1.sh

# Build CLHEP
cd $GATE_ROOT_DIR/clhep/bin && \
  cmake -DCMAKE_INSTALL_PREFIX=$PWD/../install -DCMAKE_BUILD_TYPE=$CMAKE_BUILD_TYPE ../src/CLHEP && \
  cmake --build . -- -j $MAX_NUM_BUILD_THREADS && \
  cmake --build . --target install 
  
# Build Geant4
cd $GATE_ROOT_DIR/geant4/bin && \
  cmake ../src/ -DGEANT4_INSTALL_DATA=ON \
                  -DGEANT4_INSTALL_DATADIR=../data \
                  -DGEANT4_USE_QT=ON \
                  -DCMAKE_INSTALL_PREFIX=$PWD/../install \
                  -DGEANT4_USE_OPENGL_X11=ON \
                  -DGEANT4_USE_SYSTEM_CLHEP=ON \
                  -DCLHEP_ROOT_DIR=$PWD/../../clhep/install \
                  -DCMAKE_BUILD_TYPE=$CMAKE_BUILD_TYPE && \
  make -j $MAX_NUM_BUILD_THREADS install

# Build ITK
cd $GATE_ROOT_DIR/ITK/bin && \
  cmake ../src/ -DCMAKE_CXX_FLAGS:STRING=-std=c++11 \
                  -DBUILD_DOCUMENTATION=OFF \
                  -DBUILD_EXAMPLES=OFF \
                  -DBUILD_TESTING=OFF \
                  -DModule_RTK=ON \
                  -DRTK_USE_CUDA=OFF \
                  -DCMAKE_BUILD_TYPE=$CMAKE_BUILD_TYPE \
                  -DRTK_BUILD_APPLICATIONS=OFF && \
  make -j $MAX_NUM_BUILD_THREADS

# Build ROOT
cd $GATE_ROOT_DIR/root-cern/bin && \
  cmake ../src/ -Dpython=OFF \
                  -DCMAKE_INSTALL_PREFIX=$PWD/../install \
                  -DCMAKE_BUILD_TYPE=$CMAKE_BUILD_TYPE && \
  make install -j $MAX_NUM_BUILD_THREADS

# Build GATE
cd $GATE_ROOT_DIR/gate/bin && \
  source $PWD/../../geant4/install/bin/geant4.sh && \
  source $PWD/../../root-cern/install/bin/thisroot.sh && \
  cmake ../src/ -DGeant4_DIR=$PWD/../../geant4/install \
                  -DGEANT4_USE_SYSTEM_CLHEP=ON \
                  -DGATE_USE_ITK=ON \
                  -DITK_DIR=$PWD/../../ITK/bin \
                  -DGATE_USE_RTK=$USE_RTK \
                  -DGATE_USE_OPTICAL=ON \
                  -DCMAKE_BUILD_TYPE=$CMAKE_BUILD_TYPE && \
  make -j $MAX_NUM_BUILD_THREADS






