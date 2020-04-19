import 'package:flutter_blue/flutter_blue.dart';
import 'package:plantwatering/core/ble/plantwatering_services.dart';

class PlantBleService {
  final Guid serviceAutomationIo = Guid(PlantWateringServices.automationIo);
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
        withServices: [serviceAutomationIo],
        );
  }
}
