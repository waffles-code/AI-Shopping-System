import 'package:aishop/screens/checkout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  Widget makeTestableWidget({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  
  testWidgets("", (WidgetTester tester) async {
    CheckOutPage screen = CheckOutPage();

    await tester.pumpWidget(makeTestableWidget(child: screen));
  });
}