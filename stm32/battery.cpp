#include "battery.hpp"
#include "counter.hpp"
#include <iostream>
using namespace std;
Battery::Battery(BLE &ble, events::EventQueue &event_queue)
    : _ble(ble), _event_queue(event_queue), _led1(LED2, 1),
      _frequency_service(NULL), _uuid(0xA000), _adv_data_builder(_adv_buffer) {}

void Battery::start() {
  _ble.gap().setEventHandler(this);
  _ble.init(this, &Battery::on_init_complete);

  _event_queue.call_every(500, this, &Battery::blink);
  _event_queue.call_every(100, this, &Battery::updateData);
  _event_queue.call_every(4, this, &Battery::updateFrequency);

  _event_queue.dispatch_forever();
}

void Battery::on_init_complete(
    BLE::InitializationCompleteCallbackContext *params) {
  if (params->error != BLE_ERROR_NONE) {
    return;
  }

  _frequency_service = new FrequencyService(_ble);

  start_advertising();
}

void Battery::start_advertising() {

  ble::AdvertisingParameters adv_parameters(
      ble::advertising_type_t::CONNECTABLE_UNDIRECTED,
      ble::adv_interval_t(ble::millisecond_t(1000)));

  _adv_data_builder.setFlags();
  _adv_data_builder.setLocalServiceList(mbed::make_Span(&_uuid, 1));
  _adv_data_builder.setName("frequency");

  _ble.gap().setAdvertisingParameters(ble::LEGACY_ADVERTISING_HANDLE,
                                      adv_parameters);
  _ble.gap().setAdvertisingPayload(ble::LEGACY_ADVERTISING_HANDLE,
                                   _adv_data_builder.getAdvertisingData());
  _ble.gap().startAdvertising(ble::LEGACY_ADVERTISING_HANDLE);
}

void Battery::blink(void) { _led1 = !_led1; }

void Battery::updateData(void) { _frequency_service->update(); }
void Battery::updateFrequency(void) { counter.update(); }

void Battery::onDisconnectionComplete(const ble::DisconnectionCompleteEvent &) {
  _ble.gap().startAdvertising(ble::LEGACY_ADVERTISING_HANDLE);
}