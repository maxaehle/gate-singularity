Compile GATE+dependencies in a Singularity container
----------------------------------------------------

```
gate-singularity@local$ sudo singularity build cont.simg build.def
gate-singularity@local$ ... # Upload cont.simg and ./software to the cluster, and login
gate-singularity@cluster$ singularity run --bind software:/software cont.simg
Singularity> /software/scripts/download-all.sh
# ...
Singularity> /software/scripts/build-all.sh
# ...
```

- `build.def` is used to create a Singularity image with the necessary build tools. Do this 
  on your local machine because you need root privileges.
- GATE and the dependencies (CLHEP, Geant4, a CMake version, ...) can then be
  downloaded and compiled in the container running on the cluster. 
- The container can read the respective scripts because the directory `software` 
  of the repository on the host system has been mounted to `/software` in the container.
  Likewise, the container puts the downloaded and compiled files into that directory.
  Subsequent compilations can skip unchanged files and should thus be faster.

Compare this to the approach in `Gate/source/docker/`:  
When `DockerFileGeant`, `DockerFileGate` are used according to the commands in (e.g.) 
`Generate-9.1.sh`, this does not only install the necessary build tools. In addition,
this also downloads and builds Geant(+further dependencies) and GATE from scratch. There
is no persistence.

