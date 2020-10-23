################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/TMC-API/ramp/LinearRamp.c \
../Drivers/TMC-API/ramp/LinearRamp1.c \
../Drivers/TMC-API/ramp/Ramp.c 

C_DEPS += \
./Drivers/TMC-API/ramp/LinearRamp.d \
./Drivers/TMC-API/ramp/LinearRamp1.d \
./Drivers/TMC-API/ramp/Ramp.d 

OBJS += \
./Drivers/TMC-API/ramp/LinearRamp.o \
./Drivers/TMC-API/ramp/LinearRamp1.o \
./Drivers/TMC-API/ramp/Ramp.o 


# Each subdirectory must supply rules for building sources it contributes
Drivers/TMC-API/ramp/LinearRamp.o: ../Drivers/TMC-API/ramp/LinearRamp.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F334x8 -DDEBUG -c -I../Core/Inc -I../Drivers/STM32F3xx_HAL_Driver/Inc -I../Drivers/STM32F3xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F3xx/Include -I../Drivers/CMSIS/Include -I../Drivers/TMC-API/helpers -I../Drivers/TMC-API/ramp -I../Drivers/TMC-API/TMC4671 -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/TMC-API/ramp/LinearRamp.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Drivers/TMC-API/ramp/LinearRamp1.o: ../Drivers/TMC-API/ramp/LinearRamp1.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F334x8 -DDEBUG -c -I../Core/Inc -I../Drivers/STM32F3xx_HAL_Driver/Inc -I../Drivers/STM32F3xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F3xx/Include -I../Drivers/CMSIS/Include -I../Drivers/TMC-API/helpers -I../Drivers/TMC-API/ramp -I../Drivers/TMC-API/TMC4671 -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/TMC-API/ramp/LinearRamp1.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Drivers/TMC-API/ramp/Ramp.o: ../Drivers/TMC-API/ramp/Ramp.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F334x8 -DDEBUG -c -I../Core/Inc -I../Drivers/STM32F3xx_HAL_Driver/Inc -I../Drivers/STM32F3xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F3xx/Include -I../Drivers/CMSIS/Include -I../Drivers/TMC-API/helpers -I../Drivers/TMC-API/ramp -I../Drivers/TMC-API/TMC4671 -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/TMC-API/ramp/Ramp.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

