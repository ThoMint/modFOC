################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../USB_Device/App/usb_device.c \
../USB_Device/App/usbd_cdc_if.c \
../USB_Device/App/usbd_desc.c 

OBJS += \
./USB_Device/App/usb_device.o \
./USB_Device/App/usbd_cdc_if.o \
./USB_Device/App/usbd_desc.o 

C_DEPS += \
./USB_Device/App/usb_device.d \
./USB_Device/App/usbd_cdc_if.d \
./USB_Device/App/usbd_desc.d 


# Each subdirectory must supply rules for building sources it contributes
USB_Device/App/%.o: ../USB_Device/App/%.c USB_Device/App/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32G474xx -c -I../Core/Inc -I../USB_Device/App -I../USB_Device/Target -I../Drivers/STM32G4xx_HAL_Driver/Inc -I../Drivers/STM32G4xx_HAL_Driver/Inc/Legacy -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../Drivers/CMSIS/Device/ST/STM32G4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/Thomas/Documents/GitHub/modFOC/Software/v2.1/TMC" -I"C:/Users/Thomas/Documents/GitHub/modFOC/Software/v2.1/TMC/helpers" -I"C:/Users/Thomas/Documents/GitHub/modFOC/Software/v2.1/TMC/ic" -I"C:/Users/Thomas/Documents/GitHub/modFOC/Software/v2.1/TMC/ramp" -I"C:/Users/Thomas/Documents/GitHub/modFOC/Software/v2.1/TMC/ic/TMC4671" -I"C:/Users/Thomas/Documents/GitHub/modFOC/Software/v2.1/TMCL" -I"C:/Users/Thomas/Documents/GitHub/modFOC/Software/v2.1/ESC" -Ofast -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-USB_Device-2f-App

clean-USB_Device-2f-App:
	-$(RM) ./USB_Device/App/usb_device.d ./USB_Device/App/usb_device.o ./USB_Device/App/usbd_cdc_if.d ./USB_Device/App/usbd_cdc_if.o ./USB_Device/App/usbd_desc.d ./USB_Device/App/usbd_desc.o

.PHONY: clean-USB_Device-2f-App

