#!/bin/bash

source $GATE_ROOT_DIR/scripts/pre-build.sh

cd $GATE_ROOT_DIR/root-cern/bin && \
  make install -j $MAX_NUM_BUILD_THREADS
