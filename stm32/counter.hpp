#pragma once

#include <array>
#include <cmath>
#include <mbed.h>

#include "stm32wbxx_hal.h"

struct FrequencyData {
  uint32_t frequency1, dutyRatio, interval;
};

class Counter {
private:
  static bool isInit;
  TIM_HandleTypeDef htim1;
  TIM_HandleTypeDef htim2;

  const int updateFrequency = 500;
  const int updatePeriod = 1000 / updateFrequency;
  //  用来滤波的数组
  std::array<int, 500> arr1, arr2, arr3;
  
  int index = 0, i = 0, t;

public:
  Counter();
  ~Counter();

  void calcFre();
  void calcDuty();
  void calcInterval();

  void begin();
  void update();
};

extern Counter counter;
extern FrequencyData frequencyData;
