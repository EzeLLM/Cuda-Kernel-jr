#include <stdio.h>
__global__ void cuda_hello(){
    printf("Hello from the gpu brah");
}

int main(){
    """
    the statement below tells cuda to run this function
    with 1 block and one thread, im still unclear on this
    side. gotta learn.
    """
    cuda_hello<<<1,1>>>();

    """
    The gpu may be still running even though
    the cpu has finished the host code. That is
    the 'why' of me not being able to see the print
    statement without sychronizing cuda with the cpu
    """
    cudaDeviceSynchronize();


    """
    The code below is a 'kinda convention' to add
    at the end of cuda programs to reset the device state
    """
    cudaDeviceReset();  
    
    return 0;
}