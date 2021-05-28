
import 'package:aishop/components/checkoutdelivary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget makeTestableWidget({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('check out ...', (tester) async {
    CheckOutDelivery cat = CheckOutDelivery();
    await tester.pumpWidget(makeTestableWidget(child: cat));
  });
}