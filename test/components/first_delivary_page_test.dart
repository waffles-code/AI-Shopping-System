import 'package:aishop/components/first_delivary_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget makeTestableWidget({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('first delivary page ...', (tester) async {
    FirstDelivaryPage checkOutDelivery = FirstDelivaryPage();
    await tester.pumpWidget(makeTestableWidget(child: checkOutDelivery));
  });
}
