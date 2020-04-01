import 'package:mobx/mobx.dart';
import 'package:plantwatering/core/ble/bluetooth_service.dart';
part 'devices_store.g.dart';

class DevicesStore = _DevicesStoreBase with _$DevicesStore;

abstract class _DevicesStoreBase with Store {
  
  _DevicesStoreBase(this._bluetoothService);

  
  final BluetoothService _bluetoothService;
  @action
  void discoverDevices(){

  }
}