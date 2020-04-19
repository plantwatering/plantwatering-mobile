import 'package:flutter_blue/flutter_blue.dart';
import 'package:plantwatering/core/ble/commands/valve_command.dart';
import 'package:plantwatering/core/ble/models/valve_state.dart';
import 'package:plantwatering/core/ble/plantwatering_characteristics.dart';

class BleValve {
  final BluetoothCharacteristic _characteristic;

  BleValve(this._characteristic) : assert(_characteristic.uuid == Guid(PlantWateringCharacteristics.valve));

  Stream<ValveState> get state => _characteristic.value.map((values) => _toState(values));

  Future<ValveState> read() async {
    return _toState(await _characteristic.read());
  }

  Future openValve() async {
    await _characteristic.write([ValveCommand.open]);
  }

  Future closeValve() async {
    await _characteristic.write([ValveCommand.closed]);
  }

  ValveState _toState(List<int> values) {
    return ValveStateExtension.of(values.first);
  }
}
