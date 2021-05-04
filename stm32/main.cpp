#include "battery.hpp"
#include "cmsis_os2.h"
#include "counter.hpp"
#include "frequency_service.hpp"
#include "mbed_thread.h"
#include <iostream>

using namespace std;

static EventQueue event_queue(32 * EVENTS_EVENT_SIZE);

void schedule_ble_events(BLE::OnEventsToProcessCallbackContext *context) {
  event_queue.call(Callback<void()>(&context->ble, &BLE::processEvents));
}

int main() {
  BLE &ble = BLE::Instance();
  ble.onEventsToProcess(schedule_ble_events);
  counter.begin();
  thread_sleep_for(100);

  Battery battery(ble, event_queue);
  battery.start();

  return 0;
}
