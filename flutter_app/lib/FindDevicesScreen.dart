import 'package:flutter/material.dart';
import 'package:flutter_app/DeviceScreen.dart';
import 'package:flutter_app/widgets.dart';
import 'package:flutter_blue/flutter_blue.dart';

class FindDevicesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('电赛 app'),
      ),
      body: buildBody(context),
      floatingActionButton: buildFloatButton(),
    );
  }

  Widget buildFloatButton() {
    return StreamBuilder<bool>(
      stream: FlutterBlue.instance.isScanning,
      initialData: false,
      builder: (c, snapshot) {
        if (snapshot.data!) {
          return FloatingActionButton(
            child: Icon(Icons.stop),
            onPressed: () => FlutterBlue.instance.stopScan(),
            backgroundColor: Colors.red,
          );
        } else {
          return FloatingActionButton(
              child: Icon(Icons.search),
              onPressed: () => FlutterBlue.instance
                  .startScan(timeout: Duration(seconds: 30)));
        }
      },
    );
  }

  Widget buildBody(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () =>
          FlutterBlue.instance.startScan(timeout: Duration(seconds: 4)),
      child: SingleChildScrollView(
        child: Column(
          children: buildDeviceList(context),
        ),
      ),
    );
  }

  List<Widget> buildDeviceList(BuildContext context) {
    return [
      StreamBuilder<List<BluetoothDevice>>(
        stream: Stream.periodic(Duration(seconds: 2))
            .asyncMap((_) => FlutterBlue.instance.connectedDevices),
        initialData: [],
        builder: (c, snapshot) => Column(
          children: snapshot.data!
              .map((d) => ListTile(
                    title: Text(d.name),
                    subtitle: Text(d.id.toString()),
                    trailing: StreamBuilder<BluetoothDeviceState>(
                      stream: d.state,
                      initialData: BluetoothDeviceState.disconnected,
                      builder: (c, snapshot) {
                        if (snapshot.data == BluetoothDeviceState.connected) {
                          return ElevatedButton(
                            child: Text('OPEN'),
                            onPressed: () => Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              d.discoverServices();
                              return DeviceScreen(device: d);
                            })),
                          );
                        }
                        return Text(snapshot.data.toString());
                      },
                    ),
                  ))
              .toList(),
        ),
      ),
      StreamBuilder<List<ScanResult>>(
        stream: FlutterBlue.instance.scanResults,
        initialData: [],
        builder: (c, snapshot) => Column(
          children:
              snapshot.data!.where((i) => i.device.name.isNotEmpty).map((r) {
            return ScanResultTile(
              result: r,
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) {
                r.device.connect();
                return DeviceScreen(device: r.device);
              })),
            );
          }).toList(),
        ),
      ),
    ];
  }
}
