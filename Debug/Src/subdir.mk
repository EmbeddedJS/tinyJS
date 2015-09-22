################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Src/stm32f2xx_it.c \
../Src/system_stm32f2xx.c 

CPP_SRCS += \
../Src/main.cpp 

OBJS += \
./Src/main.o \
./Src/stm32f2xx_it.o \
./Src/system_stm32f2xx.o 

C_DEPS += \
./Src/stm32f2xx_it.d \
./Src/system_stm32f2xx.d 

CPP_DEPS += \
./Src/main.d 


# Each subdirectory must supply rules for building sources it contributes
Src/%.o: ../Src/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C++ Compiler'
	arm-none-eabi-g++ -mcpu=cortex-m3 -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g3 -DSTM32F207xx -DUSE_HAL_DRIVER -I"/Users/InhoChoi/Documents/workspace/tinyJS/Drivers/CMSIS/Device/ST/STM32F2xx/Include" -I"/Users/InhoChoi/Documents/workspace/tinyJS/Drivers/CMSIS/Include" -I"/Users/InhoChoi/Documents/workspace/tinyJS/Drivers/STM32F2xx_HAL_Driver/Inc" -I"/Users/InhoChoi/Documents/workspace/tinyJS/include" -I"/Users/InhoChoi/Documents/workspace/tinyJS/TinyJS/inc" -std=gnu++11 -fabi-version=0 -fpermissive -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Src/%.o: ../Src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g3 -DSTM32F207xx -DUSE_HAL_DRIVER -I"/Users/InhoChoi/Documents/workspace/tinyJS/Drivers/CMSIS/Device/ST/STM32F2xx/Include" -I"/Users/InhoChoi/Documents/workspace/tinyJS/Drivers/CMSIS/Include" -I"/Users/InhoChoi/Documents/workspace/tinyJS/Drivers/STM32F2xx_HAL_Driver/Inc" -I"/Users/InhoChoi/Documents/workspace/tinyJS/include" -I"/Users/InhoChoi/Documents/workspace/tinyJS/TinyJS/inc" -std=gnu11 -fpermissive -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


