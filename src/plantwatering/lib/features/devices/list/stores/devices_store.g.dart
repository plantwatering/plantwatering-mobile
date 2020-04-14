// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'devices_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DevicesStore on _DevicesStoreBase, Store {
  Computed<ObservableList<DeviceStore>> _$_scannedDevicesComputed;

  @override
  ObservableList<DeviceStore> get _scannedDevices =>
      (_$_scannedDevicesComputed ??= Computed<ObservableList<DeviceStore>>(
              () => super._scannedDevices))
          .value;
  Computed<List<DeviceStore>> _$devicesComputed;

  @override
  List<DeviceStore> get devices =>
      (_$devicesComputed ??= Computed<List<DeviceStore>>(() => super.devices))
          .value;

  final _$_scansAtom = Atom(name: '_DevicesStoreBase._scans');

  @override
  ObservableSet<ScanResult> get _scans {
    _$_scansAtom.context.enforceReadPolicy(_$_scansAtom);
    _$_scansAtom.reportObserved();
    return super._scans;
  }

  @override
  set _scans(ObservableSet<ScanResult> value) {
    _$_scansAtom.context.conditionallyRunInAction(() {
      super._scans = value;
      _$_scansAtom.reportChanged();
    }, _$_scansAtom, name: '${_$_scansAtom.name}_set');
  }

  final _$connectedDevicesAtom =
      Atom(name: '_DevicesStoreBase.connectedDevices');

  @override
  ObservableList<DeviceStore> get connectedDevices {
    _$connectedDevicesAtom.context.enforceReadPolicy(_$connectedDevicesAtom);
    _$connectedDevicesAtom.reportObserved();
    return super.connectedDevices;
  }

  @override
  set connectedDevices(ObservableList<DeviceStore> value) {
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

  @override
  String toString() {
    final string =
        'connectedDevices: ${connectedDevices.toString()},devices: ${devices.toString()}';
    return '{$string}';
  }
}
