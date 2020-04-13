import 'package:flutter_blue/flutter_blue.dart';
import 'package:mobx/mobx.dart';
import 'package:plantwatering/core/ble/bluetooth_service.dart' as _;
import 'package:plantwatering/features/devices/models/devices.dart';
part 'devices_store.g.dart';

class DevicesStore = _DevicesStoreBase with _$DevicesStore;

abstract class _DevicesStoreBase with Store {
  _DevicesStoreBase(this._bluetoothService);

  final _.BluetoothService _bluetoothService;

  @observable
  var _scans = ObservableMap<String, ScanResult>();

  @computed
  List<Device> get _scannedDevices => _scans.values
      .map((s) => Device(id: s.device.id.id, name: s.device.name))
      .toList();

  @observable
  var connectedDevices = ObservableList<Device>();

  @computed
  List<Device> get devices => List.from([
        ...connectedDevices,
        ..._scans.values
            .map((s) => Device(id: s.device.id.id, name: s.device.name))
      ]);

  @action
  Future discoverDevices() async {
    _scans.clear();
    connectedDevices.clear();

    _bluetoothService.scanForDevicesWithServiceAutomation().listen((scan) {
      _scans[scan.device.id.id] = scan;
    });
    connectedDevices
        .addAll((await _bluetoothService.connectedDevices()).map((s) {
      return Device(id: s.id.id, name: s.name, isConnected: true);
    }));
  }

  @action
  Future connect(Device device) async {
    print("Connecting to ${device.name} [${device.id}]");
    var scan = _scans[device.id];
    await scan.device.connect(timeout: Duration(seconds: 5));
  }
}
