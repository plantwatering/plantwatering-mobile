import 'package:flutter_blue/flutter_blue.dart';
import 'package:plantwatering/core/ble/ble_valve.dart';
import 'package:plantwatering/core/ble/models/ble_dripping_device_state.dart';
import 'package:plantwatering/core/ble/plantwatering_characteristics.dart';

class BleDrippingDevice {
  BleDrippingDevice(this._device);

  final BluetoothDevice _device;
  BleValve _valve;
  List<BluetoothService> _bleServices = List();

  Stream<BleDrippingDeviceState> get state => _device.state.map((st) => _fromState(st));

  Future<BleValve> get valve async => _valve ?? await _tryFindValve();

  String get name => _device.name;
  String get id => _device.id.id;

  Future connect() async {
    await _device.connect(timeout: Duration(seconds: 10));
  }

  Future disconnect() async {
    await _device.disconnect();
  }

  Future discoverServices() async {
    _bleServices = await _device.discoverServices();
  }

  Future<BleValve> _tryFindValve() async {
    if (_bleServices == null) await discoverServices();
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

  BleDrippingDeviceState _fromState(BluetoothDeviceState bleState) {
    switch (bleState) {
      case BluetoothDeviceState.connecting:
        return BleDrippingDeviceState.connecting;
      case BluetoothDeviceState.connected:
        return BleDrippingDeviceState.connected;
      case BluetoothDeviceState.disconnecting:
        return BleDrippingDeviceState.disconnecting;
      default:
        return BleDrippingDeviceState.disconnected;
    }
  }
}
