import 'package:aishop/components/google_round_button.dart';
import 'package:aishop/components/or_divider.dart';
import 'package:aishop/components/round_button.dart';
import 'package:aishop/components/round_passwordfield.dart';
import 'package:aishop/components/round_textfield.dart';
import 'package:aishop/components/textlink.dart';
import 'package:aishop/components/title.dart';
import 'package:aishop/screens/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  Widget testWidget = new MediaQuery(
      data: new MediaQueryData(),
      child: new MaterialApp(home: new LoginScreen())
  );
testWidgets('Renders', (WidgetTester tester) async {
  await tester.pumpWidget(testWidget);

  final emailField = find.byType(RoundTextField);
  final passwordField = find.byType(RoundPasswordField);

  expect(find.byType(PageTitle), findsOneWidget);
  expect(emailField, findsOneWidget);
  expect(passwordField, findsOneWidget);
  expect(find.byType(RoundButton), findsOneWidget);
  expect(find.byType(GoogleRoundButton), findsOneWidget);
  expect(find.byType(TextLink), findsNWidgets(2));
  expect(find.byType(OrDivider), findsOneWidget);

  await tester.enterText(emailField, 'test email');
  expect(find.text('test email'), findsOneWidget);
  print('test email');

  await tester.enterText(passwordField, 'test password');
  expect(find.text('test password'), findsOneWidget);
  print('test password');

});
}
