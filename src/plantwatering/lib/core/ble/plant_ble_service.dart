import 'package:flutter_blue/flutter_blue.dart';

class PlantBleService {
  final Guid serviceAutomationIo = Guid("00001815-0000-1000-8000-00805F9B34FB");
  FlutterBlue _bluetooth;

  PlantBleService() {
    _bluetooth = FlutterBlue.instance;
  }

  Future<bool> hasBluetoothSupport() async {
    return await _bluetooth.isAvailable;
  }

  Future<bool> isBluettothEnabled() async {
    return await _bluetooth.isOn;
  }

  Future<List<BluetoothDevice>> connectedDevices() async {
    return await _bluetooth.connectedDevices;
  }

  Stream<ScanResult> scanForDevicesWithServiceAutomation() async* {
    if (await _bluetooth.isScanning.first) {
      return;
    }
    yield* _bluetooth.scan(
        scanMode: ScanMode.lowLatency,
        timeout: Duration(seconds: 60),
        withServices: [serviceAutomationIo]
        );
  }
}
