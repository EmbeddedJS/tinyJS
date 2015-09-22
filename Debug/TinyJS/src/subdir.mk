################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../TinyJS/src/TinyJS.cpp \
../TinyJS/src/TinyJS_Functions.cpp \
../TinyJS/src/TinyJS_MathFunctions.cpp 

OBJS += \
./TinyJS/src/TinyJS.o \
./TinyJS/src/TinyJS_Functions.o \
./TinyJS/src/TinyJS_MathFunctions.o 

CPP_DEPS += \
./TinyJS/src/TinyJS.d \
./TinyJS/src/TinyJS_Functions.d \
./TinyJS/src/TinyJS_MathFunctions.d 


# Each subdirectory must supply rules for building sources it contributes
TinyJS/src/%.o: ../TinyJS/src/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C++ Compiler'
	arm-none-eabi-g++ -mcpu=cortex-m3 -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g3 -DSTM32F207xx -DUSE_HAL_DRIVER -I"/Users/InhoChoi/Documents/workspace/tinyJS/Drivers/CMSIS/Device/ST/STM32F2xx/Include" -I"/Users/InhoChoi/Documents/workspace/tinyJS/Drivers/CMSIS/Include" -I"/Users/InhoChoi/Documents/workspace/tinyJS/Drivers/STM32F2xx_HAL_Driver/Inc" -I"/Users/InhoChoi/Documents/workspace/tinyJS/include" -I"/Users/InhoChoi/Documents/workspace/tinyJS/TinyJS/inc" -std=gnu++11 -fabi-version=0 -fpermissive -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


