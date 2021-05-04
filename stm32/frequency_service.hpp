#pragma once

#include "counter.hpp"
#include <BLE.h>
#include <mbed.h>

class FrequencyService {
public:
  FrequencyService(BLE &_ble);
  void update();

private:
  BLE &ble;
  ReadOnlyGattCharacteristic<FrequencyData> frequencyState;
};
