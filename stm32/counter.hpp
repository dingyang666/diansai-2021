#pragma once

#include <array>
#include <mbed.h>

#include "stm32wbxx_hal.h"

struct FrequencyData { uint32_t frequency1, frequency2; };

class Counter {
private:
  static bool isInit;
  TIM_HandleTypeDef htim1;
  TIM_HandleTypeDef htim2;

  std::array<uint32_t, 1000> arr1, arr2;

public:
  Counter();
  ~Counter();

  void begin();
  void update();
};

extern Counter counter;
extern FrequencyData frequencyData;
