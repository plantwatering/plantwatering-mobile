import 'package:flutter_blue/flutter_blue.dart';
import 'package:plantwatering/core/ble/ble_valve.dart';
import 'package:plantwatering/core/ble/models/sprinkler_state.dart';
import 'package:plantwatering/core/ble/plantwatering_characteristics.dart';

class BleSprinkler {
  BleSprinkler(this._device);

  final BluetoothDevice _device;
  BleValve _valve;
  List<BluetoothService> _bleServices = List();

  Stream<SprinklerState> get state => _device.state.map((st) => _fromState(st));
  
  Future<BleValve> get valve async => _valve ?? await _tryFindValve();

  Future connect() async {
    await _device.connect(timeout: Duration(seconds: 10));
  }

  Future disconnect() async {
    await _device.disconnect();
  }

  Future _discoverServices() async {
    _bleServices = await _device.discoverServices();
  }

  Future<BleValve> _tryFindValve() async {
    if (_bleServices == null) await _discoverServices();
    var valveCharacteristic = _findValveCharacteristic(_findServiceWithValve(_bleServices));
    return BleValve(valveCharacteristic);
  }

  BluetoothService _findServiceWithValve(List<BluetoothService> services) {
    return _bleServices.firstWhere(
        (service) => service.characteristics.any((c) => c.uuid == Guid(PlantWateringCharacteristics.valve)));
  }

  BluetoothCharacteristic _findValveCharacteristic(BluetoothService service) {
    return service.characteristics.firstWhere((c) => c.uuid == Guid(PlantWateringCharacteristics.valve));
  }

  SprinklerState _fromState(BluetoothDeviceState bleState) {
    switch (bleState) {
      case BluetoothDeviceState.connecting:
        return SprinklerState.connecting;
      case BluetoothDeviceState.connected:
        return SprinklerState.connected;
      case BluetoothDeviceState.disconnecting:
        return SprinklerState.disconnecting;
      default:
        return SprinklerState.disconnected;
    }
  }
}
