import 'package:flutter_test/flutter_test.dart';
import 'package:plantwatering/features/devices/list/stores/device_list_store.dart';

import '../../../mocks/mocks.dart';


void main() {
  group('Devices Store', () {
    test("should instanciate", () {
      var bluetooth = BluetoothServiceMock();
      expect(DeviceListStore(bluetooth), isNotNull);
    });
  });
}
