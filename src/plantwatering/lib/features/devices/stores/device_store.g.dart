// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DeviceStore on _DeviceStoreBase, Store {
  Computed<bool> _$isConnectedComputed;

  @override
  bool get isConnected =>
      (_$isConnectedComputed ??= Computed<bool>(() => super.isConnected)).value;
  Computed<bool> _$servicesAvailableComputed;

  @override
  bool get servicesAvailable => (_$servicesAvailableComputed ??=
          Computed<bool>(() => super.servicesAvailable))
      .value;

  final _$stateAtom = Atom(name: '_DeviceStoreBase.state');

  @override
  DeviceState get state {
    _$stateAtom.context.enforceReadPolicy(_$stateAtom);
    _$stateAtom.reportObserved();
    return super.state;
  }

  @override
  set state(DeviceState value) {
    _$stateAtom.context.conditionallyRunInAction(() {
      super.state = value;
      _$stateAtom.reportChanged();
    }, _$stateAtom, name: '${_$stateAtom.name}_set');
  }

  final _$servicesAtom = Atom(name: '_DeviceStoreBase.services');

  @override
  ObservableFuture<List<BluetoothService>> get services {
    _$servicesAtom.context.enforceReadPolicy(_$servicesAtom);
    _$servicesAtom.reportObserved();
    return super.services;
  }

  @override
  set services(ObservableFuture<List<BluetoothService>> value) {
    _$servicesAtom.context.conditionallyRunInAction(() {
      super.services = value;
      _$servicesAtom.reportChanged();
    }, _$servicesAtom, name: '${_$servicesAtom.name}_set');
  }

  final _$valveValuesAtom = Atom(name: '_DeviceStoreBase.valveValues');

  @override
  ObservableList<int> get valveValues {
    _$valveValuesAtom.context.enforceReadPolicy(_$valveValuesAtom);
    _$valveValuesAtom.reportObserved();
    return super.valveValues;
  }

  @override
  set valveValues(ObservableList<int> value) {
    _$valveValuesAtom.context.conditionallyRunInAction(() {
      super.valveValues = value;
      _$valveValuesAtom.reportChanged();
    }, _$valveValuesAtom, name: '${_$valveValuesAtom.name}_set');
  }

  final _$valveAtom = Atom(name: '_DeviceStoreBase.valve');

  @override
  BluetoothCharacteristic get valve {
    _$valveAtom.context.enforceReadPolicy(_$valveAtom);
    _$valveAtom.reportObserved();
    return super.valve;
  }

  @override
  set valve(BluetoothCharacteristic value) {
    _$valveAtom.context.conditionallyRunInAction(() {
      super.valve = value;
      _$valveAtom.reportChanged();
    }, _$valveAtom, name: '${_$valveAtom.name}_set');
  }

  final _$connectOrDisconnectAsyncAction = AsyncAction('connectOrDisconnect');

  @override
  Future<dynamic> connectOrDisconnect() {
    return _$connectOrDisconnectAsyncAction
        .run(() => super.connectOrDisconnect());
  }

  final _$writeToValveAsyncAction = AsyncAction('writeToValve');

  @override
  Future<dynamic> writeToValve() {
    return _$writeToValveAsyncAction.run(() => super.writeToValve());
  }

  final _$_DeviceStoreBaseActionController =
      ActionController(name: '_DeviceStoreBase');

  @override
  Future<dynamic> fetchServices() {
    final _$actionInfo = _$_DeviceStoreBaseActionController.startAction();
    try {
      return super.fetchServices();
    } finally {
      _$_DeviceStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'state: ${state.toString()},services: ${services.toString()},valveValues: ${valveValues.toString()},valve: ${valve.toString()},isConnected: ${isConnected.toString()},servicesAvailable: ${servicesAvailable.toString()}';
    return '{$string}';
  }
}
