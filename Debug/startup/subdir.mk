################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../startup/startup_stm32f769xx.s 

OBJS += \
./startup/startup_stm32f769xx.o 

S_DEPS += \
./startup/startup_stm32f769xx.d 


# Each subdirectory must supply rules for building sources it contributes
startup/%.o: ../startup/%.s startup/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m7 -g3 -c -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/ampire480272" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/n25q512a" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/s5k5cag" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/mfxstm32l152" -I"/Users/manke/repo/lv_port_stm32f769_disco/CMSIS/device" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/n25q128a" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/ts3510" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/st7735" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/rk043fn48h" -I"/Users/manke/repo/lv_port_stm32f769_disco/HAL_Driver/Inc/Legacy" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/ov9655" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/otm8009a" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/Common" -I"/Users/manke/repo/lv_port_stm32f769_disco/HAL_Driver/Inc" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/stmpe811" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/wm8994" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Fonts" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/ft5336" -I"/Users/manke/repo/lv_port_stm32f769_disco/inc" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/ft6x06" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/exc7200" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/st7789h2" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Log" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/adv7533" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/ampire640480" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/STM32F769I-Discovery" -I"/Users/manke/repo/lv_port_stm32f769_disco/CMSIS/core" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/mx25l512" -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

