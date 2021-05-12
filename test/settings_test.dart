import 'package:aishop/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget makeTestableWidget({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('settings ...', (tester) async {
    SettingsPage settingsPage = SettingsPage();
    await tester.pumpWidget(makeTestableWidget(child: settingsPage));
  });
}
