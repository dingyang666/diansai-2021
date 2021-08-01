################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/examples/assets/animimg001.c \
../lvgl/examples/assets/animimg002.c \
../lvgl/examples/assets/animimg003.c \
../lvgl/examples/assets/img_caret_down.c \
../lvgl/examples/assets/img_cogwheel_alpha16.c \
../lvgl/examples/assets/img_cogwheel_argb.c \
../lvgl/examples/assets/img_cogwheel_chroma_keyed.c \
../lvgl/examples/assets/img_cogwheel_indexed16.c \
../lvgl/examples/assets/img_cogwheel_rgb.c \
../lvgl/examples/assets/img_hand.c \
../lvgl/examples/assets/img_skew_strip.c \
../lvgl/examples/assets/img_star.c \
../lvgl/examples/assets/imgbtn_left.c \
../lvgl/examples/assets/imgbtn_mid.c \
../lvgl/examples/assets/imgbtn_right.c 

OBJS += \
./lvgl/examples/assets/animimg001.o \
./lvgl/examples/assets/animimg002.o \
./lvgl/examples/assets/animimg003.o \
./lvgl/examples/assets/img_caret_down.o \
./lvgl/examples/assets/img_cogwheel_alpha16.o \
./lvgl/examples/assets/img_cogwheel_argb.o \
./lvgl/examples/assets/img_cogwheel_chroma_keyed.o \
./lvgl/examples/assets/img_cogwheel_indexed16.o \
./lvgl/examples/assets/img_cogwheel_rgb.o \
./lvgl/examples/assets/img_hand.o \
./lvgl/examples/assets/img_skew_strip.o \
./lvgl/examples/assets/img_star.o \
./lvgl/examples/assets/imgbtn_left.o \
./lvgl/examples/assets/imgbtn_mid.o \
./lvgl/examples/assets/imgbtn_right.o 

C_DEPS += \
./lvgl/examples/assets/animimg001.d \
./lvgl/examples/assets/animimg002.d \
./lvgl/examples/assets/animimg003.d \
./lvgl/examples/assets/img_caret_down.d \
./lvgl/examples/assets/img_cogwheel_alpha16.d \
./lvgl/examples/assets/img_cogwheel_argb.d \
./lvgl/examples/assets/img_cogwheel_chroma_keyed.d \
./lvgl/examples/assets/img_cogwheel_indexed16.d \
./lvgl/examples/assets/img_cogwheel_rgb.d \
./lvgl/examples/assets/img_hand.d \
./lvgl/examples/assets/img_skew_strip.d \
./lvgl/examples/assets/img_star.d \
./lvgl/examples/assets/imgbtn_left.d \
./lvgl/examples/assets/imgbtn_mid.d \
./lvgl/examples/assets/imgbtn_right.d 


# Each subdirectory must supply rules for building sources it contributes
lvgl/examples/assets/%.o: ../lvgl/examples/assets/%.c lvgl/examples/assets/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DSTM32 -DSTM32F7 -DSTM32F769NIHx -DSTM32F769I_DISCO -DDEBUG -DSTM32F769xx -DUSE_HAL_DRIVER -DLV_LVGL_H_INCLUDE_SIMPLE -c -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/ampire480272" -I"/Users/manke/repo/lv_port_stm32f769_disco" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/n25q512a" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/s5k5cag" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/mfxstm32l152" -I"/Users/manke/repo/lv_port_stm32f769_disco/CMSIS/device" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/n25q128a" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/ts3510" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/st7735" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/rk043fn48h" -I"/Users/manke/repo/lv_port_stm32f769_disco/HAL_Driver/Inc/Legacy" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/ov9655" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/otm8009a" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/Common" -I"/Users/manke/repo/lv_port_stm32f769_disco/HAL_Driver/Inc" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/stmpe811" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/wm8994" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Fonts" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/ft5336" -I"/Users/manke/repo/lv_port_stm32f769_disco/inc" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/ft6x06" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/exc7200" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/st7789h2" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Log" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/adv7533" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/ampire640480" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/STM32F769I-Discovery" -I"/Users/manke/repo/lv_port_stm32f769_disco/CMSIS/core" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/mx25l512" -I"/Users/manke/repo/lv_port_stm32f769_disco/lvgl" -O3 -ffunction-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

