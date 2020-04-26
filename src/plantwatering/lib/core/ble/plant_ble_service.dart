import 'package:flutter_blue/flutter_blue.dart';
import 'package:plantwatering/core/ble/ble_sprinkler.dart';
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

  Future<bool> isBluetoothEnabled() async {
    return await _bluetooth.isOn;
  }

  Future<List<BleSprinkler>> connectedDevices() async {
    var connected = await _bluetooth.connectedDevices;
    return connected.map((c)=>BleSprinkler(c));
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
