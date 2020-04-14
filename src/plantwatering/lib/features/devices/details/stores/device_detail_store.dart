import 'package:mobx/mobx.dart';
import 'package:plantwatering/core/ble/bluetooth_service.dart' as _;
import 'package:plantwatering/features/devices/stores/device_store.dart';

part 'device_detail_store.g.dart';

class DeviceDetailStore = _DeviceDetailStoreBase with _$DeviceDetailStore;

abstract class _DeviceDetailStoreBase with Store {
  _DeviceDetailStoreBase(this._device, this._bluetoothService);

  DeviceStore _device;

  DeviceStore get device => _device;
  final _.BluetoothService _bluetoothService;
  
}
