################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/TMC-API/TMC4671/TMC4671.c 

C_DEPS += \
./Drivers/TMC-API/TMC4671/TMC4671.d 

OBJS += \
./Drivers/TMC-API/TMC4671/TMC4671.o 


# Each subdirectory must supply rules for building sources it contributes
Drivers/TMC-API/TMC4671/TMC4671.o: ../Drivers/TMC-API/TMC4671/TMC4671.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F334x8 -DDEBUG -c -I../Core/Inc -I../Drivers/STM32F3xx_HAL_Driver/Inc -I../Drivers/STM32F3xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F3xx/Include -I../Drivers/CMSIS/Include -I../Drivers/TMC-API/helpers -I../Drivers/TMC-API/ramp -I../Drivers/TMC-API/TMC4671 -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/TMC-API/TMC4671/TMC4671.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

