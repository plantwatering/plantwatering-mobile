import 'package:flutter/material.dart';
import 'package:plantwatering/core/ble/bluetooth_service.dart';
import 'package:plantwatering/features/devices/stores/devices_store.dart';
import 'package:provider/provider.dart';

class DevicesScreen extends StatelessWidget {
  static Route<dynamic> route() {
    return MaterialPageRoute(builder: (context) => DevicesScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => DevicesStore(Provider.of<BluetoothService>(context)),
      child: Builder(
          builder: (context) =>
              DevicesScreenContent(Provider.of<DevicesStore>(context))),
    );
  }
}

class DevicesScreenContent extends StatefulWidget {
  const DevicesScreenContent(
    this.store, {
    Key key,
  }) : super(key: key);
  final DevicesStore store;

  @override
  _DevicesScreenContentState createState() => _DevicesScreenContentState();
}

class _DevicesScreenContentState extends State<DevicesScreenContent> {

  @override
  void initState() {
    widget.store.discoverDevices();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Text('Devices', key: Key('title')),
      ),
    ));
  }
}
