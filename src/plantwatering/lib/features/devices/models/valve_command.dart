import 'package:plantwatering/features/devices/models/valve_state.dart';

class ValveCommand {
  static const int open = 1;
  static const int closed = 0;

  static ValveState toState(int command) {
    switch (command) {
      case open:
        return ValveState.open;
      case closed:
        return ValveState.closed;
      default:
        return ValveState.unknown;
    }
  }
}
