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

  final _$connectOrDisconnectAsyncAction = AsyncAction('connectOrDisconnect');

  @override
  Future<dynamic> connectOrDisconnect() {
    return _$connectOrDisconnectAsyncAction
        .run(() => super.connectOrDisconnect());
  }

  @override
  String toString() {
    final string =
        'state: ${state.toString()},isConnected: ${isConnected.toString()}';
    return '{$string}';
  }
}
