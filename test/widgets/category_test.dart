import 'package:aishop/widgets/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget makeTestableWidget({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('category ...', (tester) async {
    Category cat = Category();
    await tester.pumpWidget(makeTestableWidget(child: cat));
  });
}