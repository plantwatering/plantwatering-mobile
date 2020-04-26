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
  SprinklerState get state {
    _$stateAtom.context.enforceReadPolicy(_$stateAtom);
    _$stateAtom.reportObserved();
    return super.state;
  }

  @override
  set state(SprinklerState value) {
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

  final _$valveStateAtom = Atom(name: '_DeviceStoreBase.valveState');

  @override
  ValveState get valveState {
    _$valveStateAtom.context.enforceReadPolicy(_$valveStateAtom);
    _$valveStateAtom.reportObserved();
    return super.valveState;
  }

  @override
  set valveState(ValveState value) {
    _$valveStateAtom.context.conditionallyRunInAction(() {
      super.valveState = value;
      _$valveStateAtom.reportChanged();
    }, _$valveStateAtom, name: '${_$valveStateAtom.name}_set');
  }

  final _$toggleConnectionAsyncAction = AsyncAction('toggleConnection');

  @override
  Future<dynamic> toggleConnection() {
    return _$toggleConnectionAsyncAction.run(() => super.toggleConnection());
  }

  final _$initializeAsyncAction = AsyncAction('initialize');

  @override
  Future<dynamic> initialize() {
    return _$initializeAsyncAction.run(() => super.initialize());
  }

  final _$fetchServicesAsyncAction = AsyncAction('fetchServices');

  @override
  Future<dynamic> fetchServices() {
    return _$fetchServicesAsyncAction.run(() => super.fetchServices());
  }

  final _$initValveAsyncAction = AsyncAction('initValve');

  @override
  Future<dynamic> initValve() {
    return _$initValveAsyncAction.run(() => super.initValve());
  }

  final _$writeToValveAsyncAction = AsyncAction('writeToValve');

  @override
  Future<dynamic> writeToValve() {
    return _$writeToValveAsyncAction.run(() => super.writeToValve());
  }

  @override
  String toString() {
    final string =
        'state: ${state.toString()},services: ${services.toString()},valveState: ${valveState.toString()},isConnected: ${isConnected.toString()},servicesAvailable: ${servicesAvailable.toString()}';
    return '{$string}';
  }
}
