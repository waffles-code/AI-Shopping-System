import 'package:aishop/components/checkoutaddress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget makeTestableWidget({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('check out ...', (tester) async {
    CheckOutAddress cat = CheckOutAddress();
    await tester.pumpWidget(makeTestableWidget(child: cat));
  });
}