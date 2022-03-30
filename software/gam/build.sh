#!/bin/bash

source $GATE_ROOT_DIR/scripts/pre-build.sh

. $GATE_ROOT_DIR/env/bin/activate

# Configure and build gam-g4
export CMAKE_PREFIX_PATH=$GATE_ROOT_DIR/geant4/install:$GATE_ROOT_DIR/ITK/bin:$CMAKE_PREFIX_PATH
cd $GATE_ROOT_DIR/gam/src/gam_g4 && \
  pip3 install -e . -v

# Configure and build gam-gate
cd $GATE_ROOT_DIR/gam/src && \
  pip3 install -e . -v

