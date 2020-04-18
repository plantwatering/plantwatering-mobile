import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:plantwatering/features/devices/list/devices_screen.dart';

import 'mocks/mocks.dart';

void main() {
  DeviceListStoreMock devicesStoreMock;

  setUp(() {
    devicesStoreMock = DeviceListStoreMock();
  });

  testWidgets('Device Screen shows a title', (WidgetTester tester) async {
    when(devicesStoreMock.devices).thenReturn([]);
    await tester.pumpMaterialWidget(DevicesScreenContent(devicesStoreMock));
    expect(find.byKey(Key('title')), findsOneWidget);
  });
}

extension MaterialWidgetTester on WidgetTester {
  Future<void> pumpMaterialWidget(
    Widget widget,
  ) {
    return this.pumpWidget(MaterialApp(
      home: widget,
    ));
  }
}
