import 'package:aishop/components/textlink.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget makeTestableWidget({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('textlink ...', (tester) async {
    TextLink textLink = TextLink(
      text: "Forgot Password?",
      align: Alignment.centerRight,
      press: () {},
    );
    await tester.pumpWidget(makeTestableWidget(child: textLink));
  });
}
