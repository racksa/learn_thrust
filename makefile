NVCC_FLAGS=-arch=sm_75 -std=c++14 -O3 -I../include

LINK=-lcublas -lcufft -llapacke -lcblas -lcurand -lcuda -lineinfo

SOURCE_FILES_ROOT = src/

CUDA_FILES = $(SOURCE_FILES_ROOT)/main.cu

LEARN : $(SOURCE_FILES_ROOT)/main.cu
	nvcc $(NVCC_FLAGS) $(CUDA_FILES) $(LINK) -o bin/thrust