import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:plantwatering/features/devices/stores/device_store.dart';

class DeviceTile extends StatelessWidget {
  const DeviceTile({Key key, @required this.device, @required this.onTap})
      : super(key: key);

  final DeviceStore device;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: this.onTap,
      onLongPress: () => device.connectOrDisconnect(),
      title: Observer(builder: (_) {
        return Row(
          children: <Widget>[
            Text(_deviceNameOrUnkown()),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text("(${device.stateMessage})"),
            )
          ],
        );
      }),
      subtitle: Text(device.id),
    );
  }

  String _deviceNameOrUnkown() {
    return device.name ?? "Unknown";
  }
}
