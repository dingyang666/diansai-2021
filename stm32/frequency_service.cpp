#include "frequency_service.hpp"
#include "counter.hpp"
#include <iostream>

const uint16_t FREQUENCY_SERVICE_UUID = 0xA000;
const uint16_t FREQUENCY_STATE_CHARACTERISTIC_UUID = 0xA001;

FrequencyService::FrequencyService(BLE &_ble)
    : ble(_ble),
      frequencyState(FREQUENCY_STATE_CHARACTERISTIC_UUID, &frequencyData,
                     GattCharacteristic::BLE_GATT_CHAR_PROPERTIES_NOTIFY) {
  GattCharacteristic *charTable[] = {&frequencyState};
  GattService service(FREQUENCY_SERVICE_UUID, charTable, 1);
  ble.gattServer().addService(service);
}

void FrequencyService::update() {
  ble.gattServer().write(frequencyState.getValueHandle(),
                         (uint8_t *)&frequencyData, sizeof(FrequencyData));
}
