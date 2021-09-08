################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../TMC/ramp/LinearRamp.c \
../TMC/ramp/LinearRamp1.c \
../TMC/ramp/Ramp.c 

OBJS += \
./TMC/ramp/LinearRamp.o \
./TMC/ramp/LinearRamp1.o \
./TMC/ramp/Ramp.o 

C_DEPS += \
./TMC/ramp/LinearRamp.d \
./TMC/ramp/LinearRamp1.d \
./TMC/ramp/Ramp.d 


# Each subdirectory must supply rules for building sources it contributes
TMC/ramp/LinearRamp.o: ../TMC/ramp/LinearRamp.c TMC/ramp/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G474xx -c -I../Core/Inc -I../USB_Device/App -I../USB_Device/Target -I../Drivers/STM32G4xx_HAL_Driver/Inc -I../Drivers/STM32G4xx_HAL_Driver/Inc/Legacy -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../Drivers/CMSIS/Device/ST/STM32G4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/Thomas/Documents/GitHub/modFOC/Software/TMC" -I"C:/Users/Thomas/Documents/GitHub/modFOC/Software/TMC/helpers" -I"C:/Users/Thomas/Documents/GitHub/modFOC/Software/TMC/ic" -I"C:/Users/Thomas/Documents/GitHub/modFOC/Software/TMC/ramp" -I"C:/Users/Thomas/Documents/GitHub/modFOC/Software/TMC/ic/TMC4671" -I"C:/Users/Thomas/Documents/GitHub/modFOC/Software/TMCL" -I"C:/Users/Thomas/Documents/GitHub/modFOC/Software/ESC" -Ofast -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"TMC/ramp/LinearRamp.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
TMC/ramp/LinearRamp1.o: ../TMC/ramp/LinearRamp1.c TMC/ramp/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G474xx -c -I../Core/Inc -I../USB_Device/App -I../USB_Device/Target -I../Drivers/STM32G4xx_HAL_Driver/Inc -I../Drivers/STM32G4xx_HAL_Driver/Inc/Legacy -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../Drivers/CMSIS/Device/ST/STM32G4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/Thomas/Documents/GitHub/modFOC/Software/TMC" -I"C:/Users/Thomas/Documents/GitHub/modFOC/Software/TMC/helpers" -I"C:/Users/Thomas/Documents/GitHub/modFOC/Software/TMC/ic" -I"C:/Users/Thomas/Documents/GitHub/modFOC/Software/TMC/ramp" -I"C:/Users/Thomas/Documents/GitHub/modFOC/Software/TMC/ic/TMC4671" -I"C:/Users/Thomas/Documents/GitHub/modFOC/Software/TMCL" -I"C:/Users/Thomas/Documents/GitHub/modFOC/Software/ESC" -Ofast -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"TMC/ramp/LinearRamp1.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
TMC/ramp/Ramp.o: ../TMC/ramp/Ramp.c TMC/ramp/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G474xx -c -I../Core/Inc -I../USB_Device/App -I../USB_Device/Target -I../Drivers/STM32G4xx_HAL_Driver/Inc -I../Drivers/STM32G4xx_HAL_Driver/Inc/Legacy -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../Drivers/CMSIS/Device/ST/STM32G4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/Thomas/Documents/GitHub/modFOC/Software/TMC" -I"C:/Users/Thomas/Documents/GitHub/modFOC/Software/TMC/helpers" -I"C:/Users/Thomas/Documents/GitHub/modFOC/Software/TMC/ic" -I"C:/Users/Thomas/Documents/GitHub/modFOC/Software/TMC/ramp" -I"C:/Users/Thomas/Documents/GitHub/modFOC/Software/TMC/ic/TMC4671" -I"C:/Users/Thomas/Documents/GitHub/modFOC/Software/TMCL" -I"C:/Users/Thomas/Documents/GitHub/modFOC/Software/ESC" -Ofast -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"TMC/ramp/Ramp.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

