import 'package:flutter/material.dart';
import 'package:plantwatering/core/ble/bluetooth_service.dart';
import 'package:plantwatering/features/devices/details/stores/device_detail_store.dart';
import 'package:plantwatering/features/devices/stores/device_store.dart';
import 'package:provider/provider.dart';

class DeviceDetailScreen extends StatelessWidget {
  static Route<dynamic> route(DeviceStore device) {
    return MaterialPageRoute(
        builder: (context) => DeviceDetailScreen(
              device: device,
            ));
  }

  const DeviceDetailScreen({Key key, @required this.device}) : super(key: key);
  final DeviceStore device;

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) =>
          DeviceDetailStore(device, Provider.of<BluetoothService>(context)),
      child: Builder(
        builder: (context) => DeviceDetailsScreenContent(
          device: device,
        ),
      ),
    );
  }
}

class DeviceDetailsScreenContent extends StatefulWidget {
  DeviceDetailsScreenContent({Key key, @required this.device})
      : super(key: key);

  final DeviceStore device;
  @override
  _DeviceDetailsScreenContentState createState() =>
      _DeviceDetailsScreenContentState();
}

class _DeviceDetailsScreenContentState
    extends State<DeviceDetailsScreenContent> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
