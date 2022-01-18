Compile GATE+dependencies in a Singularity container
----------------------------------------------------

```
gate-singularity@local$ sudo singularity build cont.simg singularity.def
gate-singularity@local$ ... # Upload cont.simg and ./software to the cluster, and login
gate-singularity@cluster$ singularity run --bind software:/software cont.simg
Singularity> /software/scripts/download-all.sh
# ...
Singularity> /software/scripts/build-all.sh
# ...
```

- `singularity.def` is used to create a Singularity image with the necessary build tools, 
  and some convenient debugging tools. The image must probably be built on your local machine 
  because you need root privileges.
- GATE and the dependencies (CLHEP, Geant4, a CMake version, ...) can then be
  downloaded and compiled in the container running on the cluster. 
- The container can read the respective scripts because the directory `software` 
  of the repository on the host system has been mounted to `/software` in the container.
  Likewise, the container puts the downloaded and compiled files into that directory.
  Subsequent compilations can skip unchanged files and should thus be faster.

Compare this to the approach in 
[`Gate/source/docker/`](https://github.com/OpenGATE/Gate/tree/develop/source/docker):  
Building the images from `DockerFileGeant`, `DockerFileGate` according to (e.g.) 
`Generate-9.1.sh` does already download and build Geant4(+further dependencies) and GATE.
The source files are part of the container's isolated file system. They can be edited and 
recompiled in the container, but they cannot be accessed from the host system.

