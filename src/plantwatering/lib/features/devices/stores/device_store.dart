import 'package:flutter_blue/flutter_blue.dart';
import 'package:mobx/mobx.dart';
import 'package:plantwatering/features/devices/models/device_state.dart';
part 'device_store.g.dart';

class DeviceStore = _DeviceStoreBase with _$DeviceStore;

abstract class _DeviceStoreBase with Store {
  final BluetoothDevice _device;

  _DeviceStoreBase(this._device) {
    _device.state.listen((state) {
      _onBluetoothDeviceStateChanged(state);
    });
  }

  String get id => _device.id.id;

  String get name => _device.name;

  @observable
  DeviceState state = DeviceState.disconnected;

  @computed
  bool get isConnected => state == DeviceState.connected;

  String get stateMessage {
    switch (state) {
      case DeviceState.disconnected:
        return "Disconnected";
      case DeviceState.connecting:
        return "Connecting";
      case DeviceState.connected:
        return "Connected";
      case DeviceState.disconnecting:
        return "Disconnecting";
      default:
        return "";
    }
  }

  void _onBluetoothDeviceStateChanged(BluetoothDeviceState bleState) {
    var newState = _from(bleState);
    if (newState == state) return;
    state = newState;
  }

  DeviceState _from(BluetoothDeviceState bleState) {
    switch (bleState) {
      case BluetoothDeviceState.connecting:
        return DeviceState.connecting;
      case BluetoothDeviceState.connected:
        return DeviceState.connected;
      case BluetoothDeviceState.disconnecting:
        return DeviceState.disconnecting;
      default:
        return DeviceState.disconnected;
    }
  }

  @action
  Future connectOrDisconnect() async {
    if (state == DeviceState.connected || state == DeviceState.connecting)
      await _device.disconnect();
    else
      await connect();
  }

  Future connect() async {
    await _device.connect(timeout: Duration(seconds: 5));
  }
}
