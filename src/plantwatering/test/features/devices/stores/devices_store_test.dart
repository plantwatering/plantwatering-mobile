import 'package:flutter_test/flutter_test.dart';
import 'package:plantwatering/features/devices/stores/devices_store.dart';

void main() {
  group('Devices Store', () {
    test("should instanciate", () {
      expect(DevicesStore(), isNotNull);
    });
    
  });
}
