import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:plantwatering/core/ble/plant_ble_service.dart';
import 'package:plantwatering/features/devices/details/device_details_screen.dart';
import 'package:plantwatering/features/devices/list/stores/devices_store.dart';
import 'package:plantwatering/features/devices/list/widgets/devices_tile.dart';
import 'package:plantwatering/features/devices/models/devices.dart';
import 'package:plantwatering/features/devices/stores/device_store.dart';
import 'package:provider/provider.dart';

class DevicesScreen extends StatelessWidget {
  static Route<dynamic> route() {
    return MaterialPageRoute(builder: (context) => DevicesScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => DevicesStore(Provider.of<PlantBleService>(context)),
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
        appBar: AppBar(
          title: Text(
            "Devices",
            key: Key("title"),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                  child: RefreshIndicator(
                onRefresh: () => widget.store.discoverDevices(),
                child: Observer(builder: (_) {
                  return ListView.builder(
                    itemCount: _devices().length,
                    itemBuilder: (context, index) {
                      return DeviceTile(
                        onTap: () => {
                          Navigator.of(context)
                              .push(DeviceDetailScreen.route(_deviceAt(index)))
                        },
                        device: _deviceAt(index),
                      );
                    },
                  );
                }),
              )),
            ],
          ),
        ));
  }

  List<DeviceStore> _devices() {
    return widget.store.devices;
  }

  DeviceStore _deviceAt(int index) {
    return _devices().elementAt(index);
  }

  String getDeviceNameOrUnknown(Device device) {
    return "${device.name} ${device.isConnected ? "(Connected)" : ""}";
  }
}
