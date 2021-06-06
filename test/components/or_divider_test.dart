import 'package:aishop/components/or_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget makeTestableWidget({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('or divider ...', (tester) async {
    OrDivider orDivider = OrDivider();
    await tester.pumpWidget(makeTestableWidget(child: orDivider));
  });
}
