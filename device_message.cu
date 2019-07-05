#include "device_launch_parameters.h"
#include "cuda_runtime.h"
#include <iostream>

//如果使用vs 新建项目 注意有多个main函数情况
int main()
{
	int deviceCount;
	cudaGetDeviceCount(&deviceCount);
	for (int i = 0; i < deviceCount; i++)
	{
		cudaDeviceProp devProp;
		cudaGetDeviceProperties(&devProp, i);
		std::cout << "使用GPU device " << i << ": " << devProp.name << std::endl;
		std::cout << "设备全局内存总量： " << devProp.totalGlobalMem / 1024 / 1024 << "MB" << std::endl;
		std::cout << "SM的数量：" << devProp.multiProcessorCount << std::endl;
		std::cout << "每个线程块的共享内存大小：" << devProp.sharedMemPerBlock / 1024.0 << " KB" << std::endl;
		std::cout << "每个线程块的最大线程数：" << devProp.maxThreadsPerBlock << std::endl;
		std::cout << "设备上一个线程块（Block）种可用的32位寄存器数量： " << devProp.regsPerBlock << std::endl;
		std::cout << "每个EM的最大线程数：" << devProp.maxThreadsPerMultiProcessor << std::endl;
		std::cout << "每个EM的最大线程束数：" << devProp.maxThreadsPerMultiProcessor / 32 << std::endl;
		std::cout << "设备上多处理器的数量： " << devProp.multiProcessorCount << std::endl;
		std::cout << "======================================================" << std::endl;

	}
	return 0;
}

/*
使用GPU device 0: GeForce RTX 2070
设备全局内存总量： 8192MB
SM的数量：36
每个线程块的共享内存大小：48 KB
每个线程块的最大线程数：1024
设备上一个线程块（Block）种可用的32位寄存器数量： 65536
每个EM的最大线程数：1024
每个EM的最大线程束数：32
设备上多处理器的数量： 36
*/