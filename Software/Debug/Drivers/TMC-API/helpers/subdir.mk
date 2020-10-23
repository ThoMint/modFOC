################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/TMC-API/helpers/CRC.c \
../Drivers/TMC-API/helpers/Functions.c 

C_DEPS += \
./Drivers/TMC-API/helpers/CRC.d \
./Drivers/TMC-API/helpers/Functions.d 

OBJS += \
./Drivers/TMC-API/helpers/CRC.o \
./Drivers/TMC-API/helpers/Functions.o 


# Each subdirectory must supply rules for building sources it contributes
Drivers/TMC-API/helpers/CRC.o: ../Drivers/TMC-API/helpers/CRC.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F334x8 -DDEBUG -c -I../Core/Inc -I../Drivers/STM32F3xx_HAL_Driver/Inc -I../Drivers/STM32F3xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F3xx/Include -I../Drivers/CMSIS/Include -I../Drivers/TMC-API/helpers -I../Drivers/TMC-API/ramp -I../Drivers/TMC-API/TMC4671 -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/TMC-API/helpers/CRC.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Drivers/TMC-API/helpers/Functions.o: ../Drivers/TMC-API/helpers/Functions.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F334x8 -DDEBUG -c -I../Core/Inc -I../Drivers/STM32F3xx_HAL_Driver/Inc -I../Drivers/STM32F3xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F3xx/Include -I../Drivers/CMSIS/Include -I../Drivers/TMC-API/helpers -I../Drivers/TMC-API/ramp -I../Drivers/TMC-API/TMC4671 -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/TMC-API/helpers/Functions.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

