import 'package:flutter_blue/flutter_blue.dart';
import 'package:mobx/mobx.dart';
import 'package:plantwatering/core/ble/bluetooth_service.dart' as _;
part 'devices_store.g.dart';

class DevicesStore = _DevicesStoreBase with _$DevicesStore;

abstract class _DevicesStoreBase with Store {
  _DevicesStoreBase(this._bluetoothService);

  final _.BluetoothService _bluetoothService;

  @observable
  var devices = ObservableMap<String, ScanResult>();

  @action
  Future discoverDevices() async {
    devices.clear();
    _bluetoothService.scanForDevicesWithServiceAutomation().listen((scan) {
      devices[scan.device.id.id] = scan;
    });
  }

  @action
  Future connect(ScanResult scan) async {
    await scan.device.connect(timeout: Duration(seconds: 5));
  }
}
