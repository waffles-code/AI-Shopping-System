import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aishop/screens/loginscreen.dart';

void main() {
  Widget makeTestableWidget({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }


  

  testWidgets("", (WidgetTester tester) async {
    LoginScreen screen = LoginScreen();

    await tester.pumpWidget(makeTestableWidget(child: screen));
  });
}