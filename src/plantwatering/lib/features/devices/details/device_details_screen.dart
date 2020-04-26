import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:plantwatering/core/ble/models/valve_state.dart';
import 'package:plantwatering/features/devices/stores/device_store.dart';

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
    return Builder(
      builder: (context) => DeviceDetailsScreenContent(
        device: device,
      ),
    );
  }
}

class DeviceDetailsScreenContent extends StatefulWidget {
  DeviceDetailsScreenContent({Key key, @required this.device}) : super(key: key);

  final DeviceStore device;
  @override
  _DeviceDetailsScreenContentState createState() => _DeviceDetailsScreenContentState();
}

class _DeviceDetailsScreenContentState extends State<DeviceDetailsScreenContent> {
  @override
  void initState() {
    widget.device.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.device.name)),
      body: SafeArea(
        child: Observer(builder: (_) {
          if (!widget.device.servicesAvailable) {
            return Center(child: CircularProgressIndicator());
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              KeyValueRow(
                title: "Name:",
                value: widget.device.name,
              ),
              KeyValueRow(
                title: "Id:",
                value: widget.device.id,
              ),
              Observer(builder: (_) {
                return KeyValueRow(
                  title: "Connection:",
                  value: widget.device.stateMessage,
                );
              }),
              Observer(builder: (_) {
                return KeyValueRow(
                  title: "Valve:",
                  value: _convertValveState(widget.device.valveState),
                );
              }),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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

  String _convertValveState(ValveState state) {
    switch (state) {
      case ValveState.open:
        return "open";
      case ValveState.closed:
        return "Closed";
      default:
        return "N/A";
    }
  }
}

class KeyValueRow extends StatelessWidget {
  const KeyValueRow({
    Key key,
    @required this.title,
    @required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(title),
            ),
            Text(value)
          ],
        ));
  }
}
