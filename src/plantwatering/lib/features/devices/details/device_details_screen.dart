import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:plantwatering/core/ble/plant_ble_service.dart';
import 'package:plantwatering/features/devices/details/stores/device_detail_store.dart';
import 'package:plantwatering/features/devices/stores/device_store.dart';
import 'package:provider/provider.dart';
import 'package:mobx/mobx.dart';

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
          DeviceDetailStore(device, Provider.of<PlantBleService>(context)),
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
  void initState() {
    widget.device.fetchServices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details")),
      body: SafeArea(
        child: Observer(builder: (_) {
          if (!widget.device.servicesAvailable) {
            return CircularProgressIndicator();
          }
          return Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text('Valve'),
              ),
              Observer(builder: (_) {
                return Text(widget.device.valveValues.join(","));
              }),
              Row(
                children: <Widget>[
                  RaisedButton(
                      onPressed: () {
                        widget.device.writeToValve();
                      },
                      child: Text("Write")),
                  RaisedButton(
                    onPressed: () {
                      widget.device.readValve();
                    },
                    child: Text("Read"),
                  )
                ],
              )
            ],
          );
        }),
      ),
    );
  }

  List<BluetoothService> _services() {
    return widget.device.services.value;
  }
}
