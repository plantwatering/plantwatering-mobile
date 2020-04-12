// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'devices_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DevicesStore on _DevicesStoreBase, Store {
  final _$devicesAtom = Atom(name: '_DevicesStoreBase.devices');

  @override
  ObservableMap<String, ScanResult> get devices {
    _$devicesAtom.context.enforceReadPolicy(_$devicesAtom);
    _$devicesAtom.reportObserved();
    return super.devices;
  }

  @override
  set devices(ObservableMap<String, ScanResult> value) {
    _$devicesAtom.context.conditionallyRunInAction(() {
      super.devices = value;
      _$devicesAtom.reportChanged();
    }, _$devicesAtom, name: '${_$devicesAtom.name}_set');
  }

  final _$discoverDevicesAsyncAction = AsyncAction('discoverDevices');

  @override
  Future<dynamic> discoverDevices() {
    return _$discoverDevicesAsyncAction.run(() => super.discoverDevices());
  }

  final _$connectAsyncAction = AsyncAction('connect');

  @override
  Future<dynamic> connect(ScanResult scan) {
    return _$connectAsyncAction.run(() => super.connect(scan));
  }

  @override
  String toString() {
    final string = 'devices: ${devices.toString()}';
    return '{$string}';
  }
}
