import 'package:flutter_blue/flutter_blue.dart';
import 'package:mobx/mobx.dart';
import 'package:plantwatering/core/ble/ble_sprinkler.dart';
import 'package:plantwatering/core/ble/ble_valve.dart';
import 'package:plantwatering/core/ble/models/sprinkler_state.dart';
import 'package:plantwatering/core/ble/models/valve_state.dart';
import 'package:plantwatering/features/devices/models/device_state.dart';
part 'device_store.g.dart';

class DeviceStore = _DeviceStoreBase with _$DeviceStore;

abstract class _DeviceStoreBase with Store {
  final BleSprinkler _device;
  BleValve valve;

  final Guid valveCharacteristicGuid = Guid("00002A56-0000-1000-8000-00805F9B34FB");

  _DeviceStoreBase(this._device) {
    _device.state.listen((state) {
      this.state = state;
    });
  }

  String get id => _device.id;

  String get name => _device.name;

  @observable
  SprinklerState state = SprinklerState.disconnected;

  @observable
  ObservableFuture<List<BluetoothService>> services;

  @observable
  ValveState valveState = ValveState.unknown;

  @computed
  bool get isConnected => state == SprinklerState.connected;

  @computed
  bool get servicesAvailable => services != null && services.status == FutureStatus.fulfilled;

  @action
  Future toggleConnection() async {
    if (state == SprinklerState.connected || state == SprinklerState.connecting)
      await _device.disconnect();
    else
      await connect();
  }

  @action
  Future initialize() async {
    _reset();
    if (state != SprinklerState.connected) {
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
  Future fetchServices() async {
    var discoverServiceFuture = _device.discoverServices();
    services = ObservableFuture(discoverServiceFuture);
    await discoverServiceFuture;
  }

  @action
  Future initValve() async {
    valve = await _device.valve;
    valve.state.listen((vState) => valveState = vState);
  }

  @action
  Future writeToValve() async {
    await valve.openValve();
  }

  Future readValve() async {
    valveState = await valve.read();
  }

  String get stateMessage {
    switch (state) {
      case SprinklerState.disconnected:
        return "Disconnected";
      case SprinklerState.connecting:
        return "Connecting";
      case SprinklerState.connected:
        return "Connected";
      case SprinklerState.disconnecting:
        return "Disconnecting";
      default:
        return "";
    }
  }

  Future connect() async {
    await _device.connect();
  }
}
