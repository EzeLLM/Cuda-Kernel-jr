#include <stdio.h>
#define Stuff 100
__global__ void va(float *out, float *a, float *b,int n){
    for (int i=0;i<n;i++){
        out[i] = a[i] + b[i];
    }
}



int main(){
    """declaring pointers"""
    float *a,*b,*out;
    float *d_a,*d_b,*d_out; // this is a pointer allocated on gpu
                // we use d_ prefix to indicate that
                // the prefix is just a convention
    """we allocate memory on cpu(host) for the vectors"""
    a = (float*)malloc(sizeof(float)*Stuff)
    b = (float*)malloc(sizeof(float)*Stuff)
    c = (float*)malloc(sizeof(float)*Stuff)
    // Now we allocate memory on the gpu(device)
    // Cuda malloc works differently, we pass pointer
    // then cuda modifies it and allocate if the size we
    // passed. cuda malloc returns an error code instead of pointer.
    // im don't have the expertise required to simplify the (void**)&d_a part
    // but here it is: &d_a is the address. cuda expects void address, 
    // so we cast d_a to (void**). we use ** to be passing
    // by refrence not by value. so at the end we
    // pass the pointer of d_a (not a value of the pointer)
    // casted to void.
    cudaMalloc((void**)&d_a, sizeof(float)*Stuff)
    cudaMalloc((void**)&d_b, sizeof(float)*Stuff)
    cudaMalloc((void**)&d_out, sizeof(float)*Stuff)
    // You can initialize the vectors with a for loop now
    // then move them to gpu memory allocated by 
    // cudaMemcpy(void *d_a, void *a, size_t sizeof(float)*Stuff, cudaMemcpyKind cudaMemcpyHostToDevice)
    // But i want to write a function to initialize two vectors in parallel.

    // Im leaving to study now, will implement this later as it needs
    // more study, as it is more complex. 
    // **Commit**

}