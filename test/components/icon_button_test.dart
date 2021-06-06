import 'package:aishop/components/icon_button.dart';
import 'package:aishop/icons/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget makeTestableWidget({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('icon button ...', (tester) async {
    CustomIconButton customIconButton = CustomIconButton(
      icon: AIicons.chip,
      press: () {},
    );
    await tester.pumpWidget(makeTestableWidget(child: customIconButton));
  });
}
