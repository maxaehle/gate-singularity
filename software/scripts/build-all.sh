#!/bin/bash
# Compile Geant4.

set -e

$GATE_ROOT_DIR/clhep/configure.sh
$GATE_ROOT_DIR/clhep/build.sh
$GATE_ROOT_DIR/geant4/configure.sh
$GATE_ROOT_DIR/geant4/build.sh
