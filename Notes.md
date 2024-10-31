# General stuff
- Cuda is heterogeneous so code runs on both cpu and gpu atst( at the same time. )
- In cuda the serial part runs on cpu and the parallel part runs on gpu. so not everything is on gpu. VRAM is managed by the cpu ( or host code ) for example.
# What is host code?
- Is the code that runs on cpu, and cpu memory.
- Cpu handles the serial part of the code.
- Device code is the gpu part.