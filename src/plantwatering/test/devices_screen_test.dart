import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plantwatering/features/devices/list/devices_screen.dart';

void main() {
  testWidgets('Device Screen shows a label', (WidgetTester tester) async {
    await tester.pumpMaterialWidget(DevicesScreen());
    expect(find.byKey(Key('title')), findsOneWidget);
  });
}


extension MaterialWidgetTester on WidgetTester {
  Future<void> pumpMaterialWidget(Widget widget) {
    return this.pumpWidget(MaterialApp(
      home: widget,
    ));
  }
}