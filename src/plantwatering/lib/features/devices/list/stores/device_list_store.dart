import 'package:flutter_blue/flutter_blue.dart';
import 'package:mobx/mobx.dart';
import 'package:plantwatering/core/ble/ble_sprinkler.dart';
import 'package:plantwatering/core/ble/plant_ble_service.dart';
import 'package:plantwatering/features/devices/stores/device_store.dart';
part 'device_list_store.g.dart';

class DeviceListStore = _DevicesStoreBase with _$DeviceListStore;

abstract class _DevicesStoreBase with Store {
  _DevicesStoreBase(this._bluetoothService);

  final PlantBleService _bluetoothService;

  @observable
  var _scans = ObservableSet<ScanResult>();

  @observable
  var connectedDevices = ObservableList<DeviceStore>();

  @computed
  ObservableList<DeviceStore> get _scannedDevices => _scans.map((s) => DeviceStore(BleSprinkler(s.device))).toList();


  @computed
  List<DeviceStore> get devices =>
      ObservableList.of([...connectedDevices, ..._scans.map((s) => DeviceStore(BleSprinkler(s.device)))]);

  @action
  Future discoverDevices() async {
    _scans.clear();
    connectedDevices.clear();

    _bluetoothService.scanForDevicesWithServiceAutomation().listen((scan) {
      _scans.add(scan);
    });
    connectedDevices.addAll((await _bluetoothService.connectedDevices()).map((s) {
      return DeviceStore(s);
    }));
  }
}
