import 'package:plantwatering/features/devices/models/valve_command.dart';

enum ValveState { open, closed, unknown }

extension ValveStateExtension on ValveState {
static  ValveState of(int value) {
    switch (value) {
      case ValveCommand.open:
        return ValveState.open;
      case ValveCommand.closed:
        return ValveState.closed;
      default:
        return ValveState.unknown;
    }
  }
}