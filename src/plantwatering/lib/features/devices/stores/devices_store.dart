import 'package:mobx/mobx.dart';
part 'devices_store.g.dart';

class DevicesStore = _DevicesStoreBase with _$DevicesStore;

abstract class _DevicesStoreBase with Store {
  
  _DevicesStoreBase(){

  }
  
  @action
  void discoverDevices(){

  }
}