// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'devices_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DevicesStore on _DevicesStoreBase, Store {
  Computed<List<Device>> _$_scannedDevicesComputed;

  @override
  List<Device> get _scannedDevices => (_$_scannedDevicesComputed ??=
          Computed<List<Device>>(() => super._scannedDevices))
      .value;
  Computed<List<Device>> _$devicesComputed;

  @override
  List<Device> get devices =>
      (_$devicesComputed ??= Computed<List<Device>>(() => super.devices)).value;

  final _$_scansAtom = Atom(name: '_DevicesStoreBase._scans');

  @override
  ObservableMap<String, ScanResult> get _scans {
    _$_scansAtom.context.enforceReadPolicy(_$_scansAtom);
    _$_scansAtom.reportObserved();
    return super._scans;
  }

  @override
  set _scans(ObservableMap<String, ScanResult> value) {
    _$_scansAtom.context.conditionallyRunInAction(() {
      super._scans = value;
      _$_scansAtom.reportChanged();
    }, _$_scansAtom, name: '${_$_scansAtom.name}_set');
  }

  final _$connectedDevicesAtom =
      Atom(name: '_DevicesStoreBase.connectedDevices');

  @override
  ObservableList<Device> get connectedDevices {
    _$connectedDevicesAtom.context.enforceReadPolicy(_$connectedDevicesAtom);
    _$connectedDevicesAtom.reportObserved();
    return super.connectedDevices;
  }

  @override
  set connectedDevices(ObservableList<Device> value) {
    _$connectedDevicesAtom.context.conditionallyRunInAction(() {
      super.connectedDevices = value;
      _$connectedDevicesAtom.reportChanged();
    }, _$connectedDevicesAtom, name: '${_$connectedDevicesAtom.name}_set');
  }

  final _$discoverDevicesAsyncAction = AsyncAction('discoverDevices');

  @override
  Future<dynamic> discoverDevices() {
    return _$discoverDevicesAsyncAction.run(() => super.discoverDevices());
  }

  final _$connectAsyncAction = AsyncAction('connect');

  @override
  Future<dynamic> connect(Device device) {
    return _$connectAsyncAction.run(() => super.connect(device));
  }

  @override
  String toString() {
    final string =
        'connectedDevices: ${connectedDevices.toString()},devices: ${devices.toString()}';
    return '{$string}';
  }
}
