import 'package:aishop/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget makeTestableWidget({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('main ...', (tester) async {
    MyApp myApp = MyApp();
    await tester.pumpWidget(makeTestableWidget(child: myApp));
  });
}
