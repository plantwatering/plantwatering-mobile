import 'package:flutter_test/flutter_test.dart';
import 'package:plantwatering/features/devices/list/stores/devices_store.dart';

import '../../../mocks/mocks.dart';


void main() {
  group('Devices Store', () {
    test("should instanciate", () {
      var bluetooth = BluetoothServiceMock();
      expect(DevicesStore(bluetooth), isNotNull);
    });
  });
}
