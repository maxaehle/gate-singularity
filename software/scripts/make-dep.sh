#!/bin/bash
# Run this script inside the container to (re-)build all subprojects.

export MAX_NUM_BUILD_THREADS=32
source $GATE_ROOT_DIR/scripts/versions.sh

# CLHEP
cd $GATE_ROOT_DIR/clhep/bin && \
  cmake --build . -- -j $MAX_NUM_BUILD_THREADS && \
  cmake --build . --target install 
  
# Geant4
cd $GATE_ROOT_DIR/geant4/bin && \
  make -j $MAX_NUM_BUILD_THREADS install

# ITK
cd $GATE_ROOT_DIR/ITK/bin && \
  make -j $MAX_NUM_BUILD_THREADS

# ROOT
cd $GATE_ROOT_DIR/root-cern/bin && \
  make install -j $MAX_NUM_BUILD_THREADS







