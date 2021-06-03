################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../Core/Startup/startup_stm32g474retx.s 

OBJS += \
./Core/Startup/startup_stm32g474retx.o 

S_DEPS += \
./Core/Startup/startup_stm32g474retx.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Startup/startup_stm32g474retx.o: ../Core/Startup/startup_stm32g474retx.s Core/Startup/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -c -I"C:/Users/Thomas/STM32CubeIDE/alternateWorkspace/modFOC-TMCL/TMC" -I"C:/Users/Thomas/STM32CubeIDE/alternateWorkspace/modFOC-TMCL/TMC/helpers" -I"C:/Users/Thomas/STM32CubeIDE/alternateWorkspace/modFOC-TMCL/TMC/ic" -I"C:/Users/Thomas/STM32CubeIDE/alternateWorkspace/modFOC-TMCL/TMC/ramp" -I"C:/Users/Thomas/STM32CubeIDE/alternateWorkspace/modFOC-TMCL/TMC/ic/TMC4671" -I"C:/Users/Thomas/STM32CubeIDE/alternateWorkspace/modFOC-TMCL/TMCL" -x assembler-with-cpp -MMD -MP -MF"Core/Startup/startup_stm32g474retx.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

