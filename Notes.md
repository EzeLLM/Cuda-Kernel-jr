# Notes

## CUDA Programming Notes

### Declaring Pointers

- Host Pointers: Pointers that reference memory allocated on the CPU (host memory).
  float *a, *b, *out;
  
- Device Pointers: Pointers that reference memory allocated on the GPU (device memory).
  - We use the d_ prefix as a convention to indicate device pointers.
  - This prefix helps differentiate between host and device memory pointers.
  float *d_a, *d_b, *d_out; // Pointers allocated on the GPU (device)

### Allocating Memory

#### Allocating Memory on the Host
- We allocate memory for vectors on the CPU using malloc.
  a = (float*)malloc(sizeof(float) * Stuff);
  b = (float*)malloc(sizeof(float) * Stuff);
  c = (float*)malloc(sizeof(float) * Stuff);
  - Stuff is a predefined macro representing the size (in this case, 100).
  - malloc allocates a block of memory of the specified size and returns a pointer to the beginning of the block.

#### Allocating Memory on the Device
- We allocate memory on the GPU using cudaMalloc.
  - cudaMalloc works differently from standard malloc:
    - We pass the address of the pointer, and cudaMalloc modifies it to point to the allocated device memory.
    - It returns an error code (status) instead of a pointer.
  - The syntax for cudaMalloc is:
    cudaError_t cudaMalloc ( void** devPtr, size_t size );
  - Explanation of (void**)&d_a:
    - &d_a gets the address of the device pointer d_a.
    - We cast &d_a to (void**) because cudaMalloc expects a void** type for the first argument.
    - This ensures we're passing the address of the pointer by reference, allowing cudaMalloc to modify it.

### Initializing Vectors
- You can initialize the host vectors a, b, and c using a for loop.
- To move the initialized data from host to device memory, use cudaMemcpy:
  cudaMemcpy(d_a, a, sizeof(float) * Stuff, cudaMemcpyHostToDevice);
  cudaMemcpy(d_b, b, sizeof(float) * Stuff, cudaMemcpyHostToDevice);

- Future Implementation:
  - Plan to write a function that initializes two vectors in parallel.
  - This will require more study, as it is more complex.

### General CUDA Concepts

- Heterogeneous Computing:
  - CUDA allows code to run on both the CPU (host) and GPU (device) simultaneously.
  - The CPU handles the serial portions of code, while the GPU handles parallel computations.

- Host Code vs. Device Code:
  - Host Code:
    - Runs on the CPU.
    - Manages CPU memory and orchestrates computation.
    - Responsible for tasks like memory allocation, data initialization, and launching kernels.
  - Device Code:
    - Runs on the GPU.
    - Comprises functions (kernels) that execute in parallel on the GPU's streaming multiprocessors.
    - Used for computationally intensive tasks that can be parallelized.

- Memory Management:
  - VRAM (Video RAM) is managed by the host code.
  - Data must be explicitly transferred between host and device memory.
  - Efficient memory management is crucial for performance optimization.

### Next Steps
- Study how to implement parallel initialization of vectors.
- Learn more about CUDA's execution configuration (grid dimensions, block dimensions).
- Implement error checking for CUDA API calls to handle exceptions and ensure robust code.