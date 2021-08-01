################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/examples/styles/lv_example_style_1.c \
../lvgl/examples/styles/lv_example_style_10.c \
../lvgl/examples/styles/lv_example_style_11.c \
../lvgl/examples/styles/lv_example_style_12.c \
../lvgl/examples/styles/lv_example_style_13.c \
../lvgl/examples/styles/lv_example_style_14.c \
../lvgl/examples/styles/lv_example_style_2.c \
../lvgl/examples/styles/lv_example_style_3.c \
../lvgl/examples/styles/lv_example_style_4.c \
../lvgl/examples/styles/lv_example_style_5.c \
../lvgl/examples/styles/lv_example_style_6.c \
../lvgl/examples/styles/lv_example_style_7.c \
../lvgl/examples/styles/lv_example_style_8.c \
../lvgl/examples/styles/lv_example_style_9.c 

OBJS += \
./lvgl/examples/styles/lv_example_style_1.o \
./lvgl/examples/styles/lv_example_style_10.o \
./lvgl/examples/styles/lv_example_style_11.o \
./lvgl/examples/styles/lv_example_style_12.o \
./lvgl/examples/styles/lv_example_style_13.o \
./lvgl/examples/styles/lv_example_style_14.o \
./lvgl/examples/styles/lv_example_style_2.o \
./lvgl/examples/styles/lv_example_style_3.o \
./lvgl/examples/styles/lv_example_style_4.o \
./lvgl/examples/styles/lv_example_style_5.o \
./lvgl/examples/styles/lv_example_style_6.o \
./lvgl/examples/styles/lv_example_style_7.o \
./lvgl/examples/styles/lv_example_style_8.o \
./lvgl/examples/styles/lv_example_style_9.o 

C_DEPS += \
./lvgl/examples/styles/lv_example_style_1.d \
./lvgl/examples/styles/lv_example_style_10.d \
./lvgl/examples/styles/lv_example_style_11.d \
./lvgl/examples/styles/lv_example_style_12.d \
./lvgl/examples/styles/lv_example_style_13.d \
./lvgl/examples/styles/lv_example_style_14.d \
./lvgl/examples/styles/lv_example_style_2.d \
./lvgl/examples/styles/lv_example_style_3.d \
./lvgl/examples/styles/lv_example_style_4.d \
./lvgl/examples/styles/lv_example_style_5.d \
./lvgl/examples/styles/lv_example_style_6.d \
./lvgl/examples/styles/lv_example_style_7.d \
./lvgl/examples/styles/lv_example_style_8.d \
./lvgl/examples/styles/lv_example_style_9.d 


# Each subdirectory must supply rules for building sources it contributes
lvgl/examples/styles/%.o: ../lvgl/examples/styles/%.c lvgl/examples/styles/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DSTM32 -DSTM32F7 -DSTM32F769NIHx -DSTM32F769I_DISCO -DDEBUG -DSTM32F769xx -DUSE_HAL_DRIVER -DLV_LVGL_H_INCLUDE_SIMPLE -c -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/ampire480272" -I"/Users/manke/repo/lv_port_stm32f769_disco" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/n25q512a" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/s5k5cag" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/mfxstm32l152" -I"/Users/manke/repo/lv_port_stm32f769_disco/CMSIS/device" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/n25q128a" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/ts3510" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/st7735" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/rk043fn48h" -I"/Users/manke/repo/lv_port_stm32f769_disco/HAL_Driver/Inc/Legacy" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/ov9655" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/otm8009a" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/Common" -I"/Users/manke/repo/lv_port_stm32f769_disco/HAL_Driver/Inc" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/stmpe811" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/wm8994" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Fonts" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/ft5336" -I"/Users/manke/repo/lv_port_stm32f769_disco/inc" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/ft6x06" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/exc7200" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/st7789h2" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Log" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/adv7533" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/ampire640480" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/STM32F769I-Discovery" -I"/Users/manke/repo/lv_port_stm32f769_disco/CMSIS/core" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/mx25l512" -I"/Users/manke/repo/lv_port_stm32f769_disco/lvgl" -O3 -ffunction-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

