import 'package:aishop/widgets/appbar.dart';
import 'package:aishop/widgets/beauty.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Widget testWidget;
  Firebase.initializeApp().whenComplete(() => {
    testWidget = new MediaQuery(
        data: new MediaQueryData(),
        child: new MaterialApp(home: new Beauty())
    ),
    testWidgets('Enabled widgets', (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);

      final appbar = find.widgetWithText(MyAppBar,"Beauty");

      expect(appbar, findsOneWidget);

      //await tester.tap();
      //await tester.pumpAndSettle();

      print('======================');
      print('');
    })
  });

}
