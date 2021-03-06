import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/widgets.dart';
import 'package:flutter_blue/flutter_blue.dart';

class DeviceScreen extends StatelessWidget {
  const DeviceScreen({Key? key, required this.device}) : super(key: key);
  final BluetoothDevice device;

  List<Widget> _buildServiceTiles(List<BluetoothService> services) {
    return services
        .where((element) => element.uuid.toString().split("-")[0] == "0000a000")
        .map((s) {
      if (s.characteristics.isNotEmpty) {
        s.characteristics[0].setNotifyValue(true);
      }
      return ServiceTile(
        service: s,
        characteristicTiles: s.characteristics.map(
          (c) {
            return CharacteristicTile(
              characteristic: c,
              onNotificationPressed: () async {
                await c.setNotifyValue(!c.isNotifying);
                await c.read();
              },
            );
          },
        ).toList(),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            buildBodyHead(),
            StreamBuilder<List<BluetoothService>>(
              stream: device.services,
              initialData: [],
              builder: (c, snapshot) {
                return Column(
                  children: _buildServiceTiles(snapshot.data!),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBodyHead() {
    return StreamBuilder<BluetoothDeviceState>(
      stream: device.state,
      initialData: BluetoothDeviceState.connecting,
      builder: (c, snapshot) {
        if (snapshot.data == BluetoothDeviceState.connected) {
          device.discoverServices();
        }
        return ListTile(
          leading: (snapshot.data == BluetoothDeviceState.connected)
              ? Icon(Icons.bluetooth_connected)
              : Icon(Icons.bluetooth_disabled),
          title: Text('Device is ${snapshot.data.toString().split('.')[1]}.'),
          subtitle: Text('${device.id}'),
        );
      },
    );
  }

  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("???????????????${device.name}"),
      actions: <Widget>[
        StreamBuilder<BluetoothDeviceState>(
          stream: device.state,
          initialData: BluetoothDeviceState.connecting,
          builder: (c, snapshot) {
            VoidCallback? onPressed;
            String text;
            switch (snapshot.data) {
              case BluetoothDeviceState.connected:
                onPressed = () => device.disconnect();
                text = '????????????';
                break;
              case BluetoothDeviceState.disconnected:
                onPressed = () => device.connect();
                text = '??????';
                break;
              default:
                onPressed = null;
                text = snapshot.data.toString().substring(21).toUpperCase();
                break;
            }
            return TextButton(
                onPressed: onPressed,
                child: Text(
                  text,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .button
                      ?.copyWith(color: Colors.white),
                ));
          },
        )
      ],
    );
  }
}
