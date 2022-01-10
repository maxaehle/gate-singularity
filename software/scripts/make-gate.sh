#!/bin/bash
# Run this script inside the container to (re-)build all subprojects.

export MAX_NUM_BUILD_THREADS=32
source $GATE_ROOT_DIR/scripts/versions.sh

# GATE
cd $GATE_ROOT_DIR/gate/bin && \
  source $PWD/../../geant4/install/bin/geant4.sh && \
  source $PWD/../../root-cern/install/bin/thisroot.sh && \
  make -j $MAX_NUM_BUILD_THREADS






