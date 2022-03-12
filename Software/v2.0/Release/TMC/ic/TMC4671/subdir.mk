################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../TMC/ic/TMC4671/TMC4671.c 

OBJS += \
./TMC/ic/TMC4671/TMC4671.o 

C_DEPS += \
./TMC/ic/TMC4671/TMC4671.d 


# Each subdirectory must supply rules for building sources it contributes
TMC/ic/TMC4671/%.o: ../TMC/ic/TMC4671/%.c TMC/ic/TMC4671/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32G474xx -c -I../Core/Inc -I../USB_Device/App -I../USB_Device/Target -I../Drivers/STM32G4xx_HAL_Driver/Inc -I../Drivers/STM32G4xx_HAL_Driver/Inc/Legacy -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../Drivers/CMSIS/Device/ST/STM32G4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/Thomas/Documents/GitHub/modFOC/Software/v2.0/TMC" -I"C:/Users/Thomas/Documents/GitHub/modFOC/Software/v2.0/TMC/helpers" -I"C:/Users/Thomas/Documents/GitHub/modFOC/Software/v2.0/TMC/ic" -I"C:/Users/Thomas/Documents/GitHub/modFOC/Software/v2.0/TMC/ramp" -I"C:/Users/Thomas/Documents/GitHub/modFOC/Software/v2.0/TMC/ic/TMC4671" -I"C:/Users/Thomas/Documents/GitHub/modFOC/Software/v2.0/TMCL" -I"C:/Users/Thomas/Documents/GitHub/modFOC/Software/v2.0/ESC" -Ofast -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-TMC-2f-ic-2f-TMC4671

clean-TMC-2f-ic-2f-TMC4671:
	-$(RM) ./TMC/ic/TMC4671/TMC4671.d ./TMC/ic/TMC4671/TMC4671.o

.PHONY: clean-TMC-2f-ic-2f-TMC4671

