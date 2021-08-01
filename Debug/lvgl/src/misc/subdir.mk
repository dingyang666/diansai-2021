################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/src/misc/lv_anim.c \
../lvgl/src/misc/lv_area.c \
../lvgl/src/misc/lv_async.c \
../lvgl/src/misc/lv_bidi.c \
../lvgl/src/misc/lv_color.c \
../lvgl/src/misc/lv_fs.c \
../lvgl/src/misc/lv_gc.c \
../lvgl/src/misc/lv_ll.c \
../lvgl/src/misc/lv_log.c \
../lvgl/src/misc/lv_math.c \
../lvgl/src/misc/lv_mem.c \
../lvgl/src/misc/lv_printf.c \
../lvgl/src/misc/lv_style.c \
../lvgl/src/misc/lv_style_gen.c \
../lvgl/src/misc/lv_templ.c \
../lvgl/src/misc/lv_timer.c \
../lvgl/src/misc/lv_tlsf.c \
../lvgl/src/misc/lv_txt.c \
../lvgl/src/misc/lv_txt_ap.c \
../lvgl/src/misc/lv_utils.c 

OBJS += \
./lvgl/src/misc/lv_anim.o \
./lvgl/src/misc/lv_area.o \
./lvgl/src/misc/lv_async.o \
./lvgl/src/misc/lv_bidi.o \
./lvgl/src/misc/lv_color.o \
./lvgl/src/misc/lv_fs.o \
./lvgl/src/misc/lv_gc.o \
./lvgl/src/misc/lv_ll.o \
./lvgl/src/misc/lv_log.o \
./lvgl/src/misc/lv_math.o \
./lvgl/src/misc/lv_mem.o \
./lvgl/src/misc/lv_printf.o \
./lvgl/src/misc/lv_style.o \
./lvgl/src/misc/lv_style_gen.o \
./lvgl/src/misc/lv_templ.o \
./lvgl/src/misc/lv_timer.o \
./lvgl/src/misc/lv_tlsf.o \
./lvgl/src/misc/lv_txt.o \
./lvgl/src/misc/lv_txt_ap.o \
./lvgl/src/misc/lv_utils.o 

C_DEPS += \
./lvgl/src/misc/lv_anim.d \
./lvgl/src/misc/lv_area.d \
./lvgl/src/misc/lv_async.d \
./lvgl/src/misc/lv_bidi.d \
./lvgl/src/misc/lv_color.d \
./lvgl/src/misc/lv_fs.d \
./lvgl/src/misc/lv_gc.d \
./lvgl/src/misc/lv_ll.d \
./lvgl/src/misc/lv_log.d \
./lvgl/src/misc/lv_math.d \
./lvgl/src/misc/lv_mem.d \
./lvgl/src/misc/lv_printf.d \
./lvgl/src/misc/lv_style.d \
./lvgl/src/misc/lv_style_gen.d \
./lvgl/src/misc/lv_templ.d \
./lvgl/src/misc/lv_timer.d \
./lvgl/src/misc/lv_tlsf.d \
./lvgl/src/misc/lv_txt.d \
./lvgl/src/misc/lv_txt_ap.d \
./lvgl/src/misc/lv_utils.d 


# Each subdirectory must supply rules for building sources it contributes
lvgl/src/misc/%.o: ../lvgl/src/misc/%.c lvgl/src/misc/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DSTM32 -DSTM32F7 -DSTM32F769NIHx -DSTM32F769I_DISCO -DDEBUG -DSTM32F769xx -DUSE_HAL_DRIVER -DLV_LVGL_H_INCLUDE_SIMPLE -c -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/ampire480272" -I"/Users/manke/repo/lv_port_stm32f769_disco" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/n25q512a" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/s5k5cag" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/mfxstm32l152" -I"/Users/manke/repo/lv_port_stm32f769_disco/CMSIS/device" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/n25q128a" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/ts3510" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/st7735" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/rk043fn48h" -I"/Users/manke/repo/lv_port_stm32f769_disco/HAL_Driver/Inc/Legacy" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/ov9655" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/otm8009a" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/Common" -I"/Users/manke/repo/lv_port_stm32f769_disco/HAL_Driver/Inc" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/stmpe811" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/wm8994" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Fonts" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/ft5336" -I"/Users/manke/repo/lv_port_stm32f769_disco/inc" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/ft6x06" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/exc7200" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/st7789h2" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Log" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/adv7533" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/ampire640480" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/STM32F769I-Discovery" -I"/Users/manke/repo/lv_port_stm32f769_disco/CMSIS/core" -I"/Users/manke/repo/lv_port_stm32f769_disco/Utilities/Components/mx25l512" -I"/Users/manke/repo/lv_port_stm32f769_disco/lvgl" -O3 -ffunction-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

