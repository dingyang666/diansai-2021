################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/examples/event/lv_example_event_1.c \
../lvgl/examples/event/lv_example_event_2.c \
../lvgl/examples/event/lv_example_event_3.c 

OBJS += \
./lvgl/examples/event/lv_example_event_1.o \
./lvgl/examples/event/lv_example_event_2.o \
./lvgl/examples/event/lv_example_event_3.o 

C_DEPS += \
./lvgl/examples/event/lv_example_event_1.d \
./lvgl/examples/event/lv_example_event_2.d \
./lvgl/examples/event/lv_example_event_3.d 


# Each subdirectory must supply rules for building sources it contributes
lvgl/examples/event/%.o: ../lvgl/examples/event/%.c lvgl/examples/event/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DSTM32 -DSTM32F7 -DSTM32F769NIHx -DSTM32F769I_DISCO -DDEBUG -DSTM32F769xx -DUSE_HAL_DRIVER -DLV_LVGL_H_INCLUDE_SIMPLE -c -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/ampire480272" -I"/Users/manke/repo/lv_port_stm32f769_disco" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/n25q512a" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/s5k5cag" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/mfxstm32l152" -I"/Users/manke/repo/lv_port_stm32f769_disco/CMSIS/device" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/n25q128a" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/ts3510" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/st7735" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/rk043fn48h" -I"/Users/manke/repo/lv_port_stm32f769_disco/HAL_Driver/Inc/Legacy" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/ov9655" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/otm8009a" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/Common" -I"/Users/manke/repo/lv_port_stm32f769_disco/HAL_Driver/Inc" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/stmpe811" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/wm8994" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Fonts" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/ft5336" -I"/Users/manke/repo/lv_port_stm32f769_disco/inc" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/ft6x06" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/exc7200" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/st7789h2" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Log" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/adv7533" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/ampire640480" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/STM32F769I-Discovery" -I"/Users/manke/repo/lv_port_stm32f769_disco/CMSIS/core" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/mx25l512" -I"/Users/manke/repo/lv_port_stm32f769_disco/lvgl" -O3 -ffunction-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

