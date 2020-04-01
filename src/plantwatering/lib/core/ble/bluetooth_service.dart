import 'package:flutter_blue/flutter_blue.dart';

class BluetoothService {
  FlutterBlue _bluetooth;

  BluetoothService() {
    _bluetooth = FlutterBlue.instance;
  }

  Future<bool> hasBluetoothSupport() async {
    return await _bluetooth.isAvailable;
  }

  Future<bool> isBluettothEnabled() async {
    return await _bluetooth.isOn;
  }
}
