import 'package:mockito/mockito.dart';
import 'package:plantwatering/core/ble/plant_ble_service.dart';
import 'package:plantwatering/features/devices/list/stores/device_list_store.dart';

class BluetoothServiceMock extends Mock implements PlantBleService {}
class DeviceListStoreMock extends Mock implements DeviceListStore{}
