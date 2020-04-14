import 'package:flutter_blue/flutter_blue.dart';
import 'package:mobx/mobx.dart';
import 'package:plantwatering/core/ble/bluetooth_service.dart' as _;
import 'package:plantwatering/features/devices/stores/device_store.dart';
part 'devices_store.g.dart';

class DevicesStore = _DevicesStoreBase with _$DevicesStore;

abstract class _DevicesStoreBase with Store {
  _DevicesStoreBase(this._bluetoothService);

  final _.BluetoothService _bluetoothService;

  @observable
  var _scans = ObservableSet<ScanResult>();

  @observable
  var connectedDevices = ObservableList<DeviceStore>();

  @computed
  ObservableList<DeviceStore> get _scannedDevices =>
      _scans.map((s) => DeviceStore(s.device)).toList();

  @computed
  List<DeviceStore> get devices => ObservableList.of(
      [...connectedDevices, ..._scans.map((s) => DeviceStore(s.device))]);

  @action
  Future discoverDevices() async {
    _scans.clear();
    connectedDevices.clear();

    _bluetoothService.scanForDevicesWithServiceAutomation().listen((scan) {
      _scans.add(scan);
    });
    connectedDevices.addAll((await _bluetoothService.connectedDevices())
        .map((s)  {
          return DeviceStore(s);
          }));
  }
}
