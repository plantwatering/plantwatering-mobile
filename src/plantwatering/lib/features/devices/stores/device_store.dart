import 'package:flutter_blue/flutter_blue.dart';
import 'package:mobx/mobx.dart';
import 'package:plantwatering/features/devices/models/device_state.dart';
part 'device_store.g.dart';

class DeviceStore = _DeviceStoreBase with _$DeviceStore;

abstract class _DeviceStoreBase with Store {
  final BluetoothDevice _device;

  final Guid valveCharacteristicGuid =
      Guid("00002A56-0000-1000-8000-00805F9B34FB");

  _DeviceStoreBase(this._device) {
    _device.state.listen((state) {
      _onBluetoothDeviceStateChanged(state);
    });
  }

  String get id => _device.id.id;

  String get name => _device.name;

  @observable
  DeviceState state = DeviceState.disconnected;

  @observable
  ObservableFuture<List<BluetoothService>> services;

  @observable
  ObservableList<int> valveValues = ObservableList<int>();

  @computed
  bool get isConnected => state == DeviceState.connected;

  @computed
  bool get servicesAvailable => services.status == FutureStatus.fulfilled;

  @observable
  BluetoothCharacteristic valve;

  @action
  Future connectOrDisconnect() async {
    if (state == DeviceState.connected || state == DeviceState.connecting)
      await _device.disconnect();
    else
      await connect();
  }

  @action
  Future fetchServices() =>
      services = ObservableFuture(_device.discoverServices()).then((services) async {
        var servicesWithValve = services
            .where((s) => s.characteristics
                .where((c) => _isValveCharacteristic(c))
                .isNotEmpty)
            .toList();

        valve = servicesWithValve.first.characteristics
            .firstWhere((c) => _isValveCharacteristic(c));
        
        await valve.setNotifyValue(true);
        valve.value.listen((val) {
          valveValues = ObservableList.of(val);
        });
        return servicesWithValve;
      });

  bool _isValveCharacteristic(dynamic c) {
    return c.uuid == valveCharacteristicGuid;
  }

  @action
  Future writeToValve() async {
    await valve.write([128]);
  }

  Future readValve()async {
    var values =  await valve.read();
    valveValues = ObservableList.of(values);
  }

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

  Future connect() async {
    await _device.connect(timeout: Duration(seconds: 5));
  }
}
