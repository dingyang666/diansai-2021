#include "counter.hpp"
#include "stm32wbxx_hal.h"
#include <cstdint>

bool Counter::isInit = false;

Counter::Counter() {}

Counter::~Counter() {}

void Counter::begin() {
  if (isInit)
    return;
  isInit = true;
  __HAL_RCC_TIM1_CLK_ENABLE();
  __HAL_RCC_GPIOA_CLK_ENABLE();
  __HAL_RCC_TIM2_CLK_ENABLE();

  GPIO_InitTypeDef GPIO_InitStruct = {0};
  GPIO_InitStruct.Pin = GPIO_PIN_12;
  GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  GPIO_InitStruct.Alternate = GPIO_AF1_TIM1;
  HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

  GPIO_InitStruct = {0};
  GPIO_InitStruct.Pin = GPIO_PIN_0 | GPIO_PIN_1 | GPIO_PIN_2 | GPIO_PIN_3;
  GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  GPIO_InitStruct.Alternate = GPIO_AF1_TIM2;
  HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

  htim1.Instance = TIM1;
  htim1.Init.Prescaler = 0;
  htim1.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim1.Init.Period = 65535;
  htim1.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim1.Init.RepetitionCounter = 0;
  htim1.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
  HAL_TIM_Base_Init(&htim1);

  htim2.Instance = TIM2;
  htim2.Init.Prescaler = 0;
  htim2.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim2.Init.Period = 4294967295;
  htim2.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim2.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
  HAL_TIM_Base_Init(&htim2);

  TIM_ClockConfigTypeDef sClockSourceConfig = {0};

  sClockSourceConfig.ClockSource = TIM_CLOCKSOURCE_ETRMODE2;
  sClockSourceConfig.ClockPolarity = TIM_CLOCKPOLARITY_NONINVERTED;
  sClockSourceConfig.ClockPrescaler = TIM_CLOCKPRESCALER_DIV1;
  sClockSourceConfig.ClockFilter = 0;
  HAL_TIM_ConfigClockSource(&htim1, &sClockSourceConfig);

  sClockSourceConfig = {0};
  sClockSourceConfig.ClockSource = TIM_CLOCKSOURCE_INTERNAL;
  HAL_TIM_ConfigClockSource(&htim2, &sClockSourceConfig);

  TIM_MasterConfigTypeDef sMasterConfig = {0};

  sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
  sMasterConfig.MasterOutputTrigger2 = TIM_TRGO2_RESET;
  sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
  HAL_TIMEx_MasterConfigSynchronization(&htim1, &sMasterConfig);

  sMasterConfig = {0};
  sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
  sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
  HAL_TIMEx_MasterConfigSynchronization(&htim2, &sMasterConfig);

  TIM_IC_InitTypeDef sConfigIC = {0};

  sConfigIC.ICPolarity = TIM_INPUTCHANNELPOLARITY_RISING;
  sConfigIC.ICSelection = TIM_ICSELECTION_DIRECTTI;
  sConfigIC.ICPrescaler = TIM_ICPSC_DIV1;
  sConfigIC.ICFilter = 0;
  HAL_TIM_IC_ConfigChannel(&htim2, &sConfigIC, TIM_CHANNEL_1);
  HAL_TIM_IC_ConfigChannel(&htim2, &sConfigIC, TIM_CHANNEL_2);
  sConfigIC.ICPolarity = TIM_INPUTCHANNELPOLARITY_FALLING;
  HAL_TIM_IC_ConfigChannel(&htim2, &sConfigIC, TIM_CHANNEL_3);
  HAL_TIM_IC_ConfigChannel(&htim2, &sConfigIC, TIM_CHANNEL_4);

  HAL_TIM_Base_Start(&htim1);
  HAL_TIM_IC_Start(&htim2, TIM_CHANNEL_1);
  HAL_TIM_IC_Start(&htim2, TIM_CHANNEL_2);
  HAL_TIM_IC_Start(&htim2, TIM_CHANNEL_3);
  HAL_TIM_IC_Start(&htim2, TIM_CHANNEL_4);
}

void Counter::update() {
  static uint32_t lastUpdate;

  if (HAL_GetTick() > lastUpdate && HAL_GetTick() - lastUpdate > updatePeriod) {
    lastUpdate += updatePeriod;
    calcFre();
    calcDuty();
    calcInterval();
    if (++index == updateFrequency) {
      index = 0;
    }
  }
}

void Counter::calcFre() {

  frequencyData.frequency1 -= arr1[index];
  arr1[index] = htim1.Instance->CNT;
  htim1.Instance->CNT = 0;
  frequencyData.frequency1 += arr1[index];

  if (frequencyData.frequency1 != 0)
    t = 32000000 / frequencyData.frequency1;
}

void Counter::calcDuty() {
  static long long tmp = 0;
  tmp -= arr2[index];
  arr2[index] = htim2.Instance->CCR3 - htim2.Instance->CCR1;
  // 如果发生溢出，直接用上一次的
  if (arr2[index] > 1e10 || arr2[index] < -1e10) {
    if (index != 0) {
      arr2[index] = arr2[index - 1];
    } else {
      arr2[index] = arr2[updateFrequency - 1];
    }
  } else {
    if (arr2[index] < 0) {
      arr2[index] = std::abs(arr2[index] + t);
    }
    arr2[index] = arr2[index] % t;
  }
  tmp += arr2[index];
  frequencyData.dutyRatio = tmp * 1000 * 100 / updateFrequency / t;
}

void Counter::calcInterval() {
  static long long tmp = 0;
  tmp -= arr3[index];
  arr3[index] = htim2.Instance->CCR2 - htim2.Instance->CCR1;
  // 如果发生溢出，直接用上一次的
  if (arr3[index] > 1e10 || arr3[index] < -1e10) {
    if (index != 0) {
      arr3[index] = arr3[index - 1];
    } else {
      arr3[index] = arr3[updateFrequency - 1];
    }
  } else {
    if (arr3[index] < 0) {
      arr3[index] = std::abs(arr3[index] + t);
    }
    arr3[index] = arr3[index] % t;
  }
  tmp += arr3[index];
  frequencyData.interval = tmp * 1000 * 100 / updateFrequency / t ;
}

Counter counter;
FrequencyData frequencyData;
