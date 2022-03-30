#!/bin/bash

source $GATE_ROOT_DIR/scripts/pre-configure.sh

# Install Python dependencies
python3 -m venv $GATE_ROOT_DIR/env
. $GATE_ROOT_DIR/env/bin/activate
pip3 install --upgrade pip
pip3 install colored scikit-build PyQt6
