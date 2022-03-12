################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../TMCL/TMCL.c 

OBJS += \
./TMCL/TMCL.o 

C_DEPS += \
./TMCL/TMCL.d 


# Each subdirectory must supply rules for building sources it contributes
TMCL/%.o: ../TMCL/%.c TMCL/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32G474xx -c -I../Core/Inc -I../USB_Device/App -I../USB_Device/Target -I../Drivers/STM32G4xx_HAL_Driver/Inc -I../Drivers/STM32G4xx_HAL_Driver/Inc/Legacy -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../Drivers/CMSIS/Device/ST/STM32G4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/Thomas/Documents/GitHub/modFOC/Software/v2.0/TMC" -I"C:/Users/Thomas/Documents/GitHub/modFOC/Software/v2.0/TMC/helpers" -I"C:/Users/Thomas/Documents/GitHub/modFOC/Software/v2.0/TMC/ic" -I"C:/Users/Thomas/Documents/GitHub/modFOC/Software/v2.0/TMC/ramp" -I"C:/Users/Thomas/Documents/GitHub/modFOC/Software/v2.0/TMC/ic/TMC4671" -I"C:/Users/Thomas/Documents/GitHub/modFOC/Software/v2.0/TMCL" -I"C:/Users/Thomas/Documents/GitHub/modFOC/Software/v2.0/ESC" -Ofast -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-TMCL

clean-TMCL:
	-$(RM) ./TMCL/TMCL.d ./TMCL/TMCL.o

.PHONY: clean-TMCL

