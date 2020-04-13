import 'package:flutter/material.dart';
import 'package:plantwatering/features/devices/models/devices.dart';

class DeviceTile extends StatelessWidget {
  const DeviceTile({Key key, @required this.device, @required this.onTap})
      : super(key: key);

  final Device device;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: this.onTap,
      title: Row(
        children: <Widget>[
          Text(_deviceNameOrUnkown()),
          if (device.isConnected) Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text("(Connected)"),
          )
        ],
      ),
      subtitle: Text(device.id),
    );
  }

  String _deviceNameOrUnkown() {
    return device.name ?? "Unknown";
  }
}
