import 'package:flutter/material.dart';
import 'package:flutter_app/chart.dart';
import 'package:flutter_blue/flutter_blue.dart';

class ScanResultTile extends StatelessWidget {
  const ScanResultTile({Key? key, required this.result, this.onTap})
      : super(key: key);

  final ScanResult result;
  final VoidCallback? onTap;

  Widget _buildTitle(BuildContext context) {
    if (result.device.name.length > 0) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            result.device.name,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            result.device.id.toString(),
            style: Theme.of(context).textTheme.caption,
          )
        ],
      );
    } else {
      return Text(result.device.id.toString());
    }
  }

  Widget _buildAdvRow(BuildContext context, String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title, style: Theme.of(context).textTheme.caption),
          SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context)
                  .textTheme
                  .caption
                  ?.apply(color: Colors.black),
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }

  String getNiceHexArray(List<int> bytes) {
    return '[${bytes.map((i) => i.toRadixString(16).padLeft(2, '0')).join(', ')}]'
        .toUpperCase();
  }

  String getNiceManufacturerData(Map<int, List<int>> data) {
    if (data.isEmpty) {
      return 'N/A';
    }
    List<String> res = [];
    data.forEach((id, bytes) {
      res.add(
          '${id.toRadixString(16).toUpperCase()}: ${getNiceHexArray(bytes)}');
    });
    return res.join(', ');
  }

  String getNiceServiceData(Map<String, List<int>> data) {
    if (data.isEmpty) {
      return 'N/A';
    }
    List<String> res = [];
    data.forEach((id, bytes) {
      res.add('${id.toUpperCase()}: ${getNiceHexArray(bytes)}');
    });
    return res.join(', ');
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: _buildTitle(context),
      leading: Text(result.rssi.toString()),
      trailing: ElevatedButton(
        child: Text('CONNECT'),
        style: ElevatedButton.styleFrom(
            primary: Colors.black,
            textStyle: TextStyle(
              color: Colors.white,
            )),
        onPressed: (result.advertisementData.connectable) ? onTap : null,
      ),
      children: <Widget>[
        _buildAdvRow(
            context, 'Complete Local Name', result.advertisementData.localName),
        _buildAdvRow(context, 'Tx Power Level',
            '${result.advertisementData.txPowerLevel ?? 'N/A'}'),
        _buildAdvRow(context, 'Manufacturer Data',
            getNiceManufacturerData(result.advertisementData.manufacturerData)),
        _buildAdvRow(
            context,
            'Service UUIDs',
            (result.advertisementData.serviceUuids.isNotEmpty)
                ? result.advertisementData.serviceUuids.join(', ').toUpperCase()
                : 'N/A'),
        _buildAdvRow(context, 'Service Data',
            getNiceServiceData(result.advertisementData.serviceData)),
      ],
    );
  }
}

class ServiceTile extends StatelessWidget {
  final BluetoothService service;
  final List<CharacteristicTile> characteristicTiles;

  const ServiceTile(
      {Key? key, required this.service, required this.characteristicTiles})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (characteristicTiles.length > 0) {
      return ExpansionTile(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Service'),
            Text('0x${service.uuid.toString().toUpperCase().substring(4, 8)}',
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    color: Theme.of(context).textTheme.caption?.color))
          ],
        ),
        children: characteristicTiles,
      );
    } else {
      return ListTile(
        title: Text('Service'),
        subtitle:
            Text('0x${service.uuid.toString().toUpperCase().substring(4, 8)}'),
      );
    }
  }
}

class CharacteristicTile extends StatelessWidget {
  final BluetoothCharacteristic characteristic;
  final VoidCallback? onNotificationPressed;

  const CharacteristicTile(
      {Key? key, required this.characteristic, this.onNotificationPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<int>>(
      stream: characteristic.value,
      initialData: characteristic.lastValue,
      builder: (c, snapshot) {
        final value = snapshot.data;
        return ExpansionTile(
          title: Column(
            children: [
              Text(
                "频率 : ${calcFrequency(value!)}\n占空比 :  ${calcDutyRatio(value)}\n${calcInterval(value)}",
                style: TextStyle(fontSize: 28),
              ),
              SizedBox.fromSize(
                size: Size(0, 20),
              ),
              FrequencyLineChart(),
            ],
          ),
        );
      },
    );
  }

  String calcInterval(List<int> value) {
    if (value.length < 12) return "相位：连接错误\n间隔时间：连接错误";
    var f =
        (value[0] + (value[1] << 8) + (value[2] << 16) + (value[3] << 24)) / 1;
    var i = (value[8] + (value[9] << 8) + (value[10] << 16) + (value[11] << 24)) / 1e5;
    var time = i * 1e6 / f;
    if (time > 1e3) return "相位：${(i * 360).toStringAsFixed(3)} 度\n间隔时间：${(time / 1e3).toStringAsFixed(3)} ms";
    return "相位：${(i * 360).toStringAsFixed(3)} 度\n间隔时间：${(time).toStringAsFixed(3)} μs";
  }

  String calcFrequency(List<int> value) {
    if (value.length < 12) return "连接错误";
    var f =
        (value[0] + (value[1] << 8) + (value[2] << 16) + (value[3] << 24)) / 1;
    return getUnit(f);
  }

  String calcDutyRatio(List<int> value) {
    if (value.length < 12) return "连接错误";
    var f =
        (value[0] + (value[1] << 8) + (value[2] << 16) + (value[3] << 24)) / 1;
    var d = (value[4] + (value[5] << 8) + (value[6] << 16) + (value[7] << 24));
    if (f > 1e6) {
      return "${(d / 1000 + 2).toStringAsFixed(3)}  %";
    } else if (f > 5e5) {
      return "${(d / 1000 + 0.8).toStringAsFixed(3)}  %";
    } else {
      return "${(d / 1000).toStringAsFixed(3)}  %";
    }
  }

  String getUnit(double f) {
    if (f < 1e3) {
      return "${(f).toStringAsFixed(3)}  Hz";
    } else if (f < 1e6) {
      return "${(f / 1e3).toStringAsFixed(3)}  kHz";
    } else if (f < 1e9) {
      return "${(f / 1e6).toStringAsFixed(3)}  MHz";
    }

    return "超过量程";
  }
}
