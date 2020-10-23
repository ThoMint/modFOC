################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../Core/Startup/startup_stm32f334r8tx.s 

S_DEPS += \
./Core/Startup/startup_stm32f334r8tx.d 

OBJS += \
./Core/Startup/startup_stm32f334r8tx.o 


# Each subdirectory must supply rules for building sources it contributes
Core/Startup/startup_stm32f334r8tx.o: ../Core/Startup/startup_stm32f334r8tx.s
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -c -I../Drivers/TMC-API/helpers -I../Drivers/TMC-API/ramp -I../Drivers/TMC-API/TMC4671 -x assembler-with-cpp -MMD -MP -MF"Core/Startup/startup_stm32f334r8tx.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

