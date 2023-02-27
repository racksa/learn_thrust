#include <cstdlib>
#include <iostream>
#include <fstream>
#include <thrust/host_vector.h>
#include <thrust/device_vector.h>

__global__
void kernel_print(int* input, int L){
    const int index = threadIdx.x + blockIdx.x*blockDim.x;

    if(index < L){
        printf("%d = %d\n", index, input[index]);
    }
    
}


int main(int argc, char** argv) {

    int length = 8;

    thrust::host_vector<int> H1(length);
    thrust::device_vector<int> D1(length);

    thrust::sequence(D1.begin(), D1.end());

    thrust::device_vector<int> D2(length);
    D2 = D1;
    H1 = D1;

    int* D1_ptr = (int*)thrust::raw_pointer_cast(D1.data());

    for(int i = 0; i < length; i++){
        std::cout<<"D1="<<D1[i]<<std::endl;
    }
    kernel_print<<<32, 1>>>(D1_ptr, length);
    

    return 0;
}

