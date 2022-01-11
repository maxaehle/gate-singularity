#!/bin/bash

source $GATE_ROOT_DIR/scripts/pre-build.sh

cd $GATE_ROOT_DIR/clhep/bin && \
  cmake --build . -- -j $MAX_NUM_BUILD_THREADS && \
  cmake --build . --target install

