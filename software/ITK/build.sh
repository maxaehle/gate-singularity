#!/bin/bash

source $GATE_ROOT_DIR/scripts/pre-build.sh

cd $GATE_ROOT_DIR/ITK/bin && \
  make -j $MAX_NUM_BUILD_THREADS

