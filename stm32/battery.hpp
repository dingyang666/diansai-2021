#pragma once

#include <BLE.h>
#include "frequency_service.hpp"
#include <mbed.h>

class Battery : ble::Gap::EventHandler {
public:
  explicit Battery(BLE &ble, events::EventQueue &event_queue);
  Battery() = delete;
  void start();

private:
  void on_init_complete(BLE::InitializationCompleteCallbackContext *params);

  void start_advertising();
  void blink(void);
  void updateData(void);
  void updateFrequency(void);

private:
  virtual void onDisconnectionComplete(const ble::DisconnectionCompleteEvent &);

private:
  BLE &_ble;
  events::EventQueue &_event_queue;

  DigitalOut _led1;
  FrequencyService *_frequency_service;

  UUID _uuid;

  uint8_t _adv_buffer[ble::LEGACY_ADVERTISING_MAX_SIZE];
  ble::AdvertisingDataBuilder _adv_data_builder;
};