import 'package:flutter_blue/flutter_blue.dart';
import 'package:mobx/mobx.dart';
import 'package:plantwatering/features/devices/models/device_state.dart';
import 'package:plantwatering/features/devices/models/valve_state.dart';
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
  ValveState valveState = ValveState.unknown;

  @computed
  bool get isConnected => state == DeviceState.connected;

  @computed
  bool get servicesAvailable =>
      services != null && services.status == FutureStatus.fulfilled;

  @observable
  BluetoothCharacteristic valve;

  @action
  Future toggleConnection() async {
    if (state == DeviceState.connected || state == DeviceState.connecting)
      await _device.disconnect();
    else
      await connect();
  }

  @action
  Future initialize() async {
    _reset();
    if (state != DeviceState.connected) {
      await connect();
    }
    await fetchServices();
    await initValve();
    await readValve();
  }

  void _reset() {
    services = null;
    valveState = ValveState.unknown;
  }

  @action
  Future fetchServices() => services =
          ObservableFuture(_device.discoverServices()).then((services) async {
        return services
            .where((s) => s.characteristics
                .where((c) => _isValveCharacteristic(c))
                .isNotEmpty)
            .toList();
      });

  bool _isValveCharacteristic(dynamic c) {
    return c.uuid == valveCharacteristicGuid;
  }

  @action
  Future initValve() async {
    var servicesWithValve = services.value;
    if (servicesWithValve == null) return;
    valve = servicesWithValve.first.characteristics
        .firstWhere((c) => _isValveCharacteristic(c));
    await valve.setNotifyValue(true);
    valve.value
        .listen((values) => valveState = ValveStateExtension.of(values.first));
  }

  @action
  Future writeToValve() async {
    await valve.write([128]);
  }

  Future readValve() async {
    var values = await valve.read();
    valveState = ValveStateExtension.of(values.first);
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
