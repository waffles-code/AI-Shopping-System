import 'package:aishop/components/google_round_button.dart';
import 'package:aishop/components/or_divider.dart';
import 'package:aishop/components/round_button.dart';
import 'package:aishop/components/round_passwordfield.dart';
import 'package:aishop/components/round_textfield.dart';
import 'package:aishop/components/textlink.dart';
import 'package:aishop/components/title.dart';
import 'package:aishop/screens/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  Widget testWidget = new MediaQuery(
      data: new MediaQueryData(),
      child: new MaterialApp(home: new LoginScreen())
  );

  final emailField = find.byType(RoundTextField);
  final passwordField = find.byType(RoundPasswordField);
  final signinbutton = find.byType(RoundButton);
  final googlebutton = find.byType(GoogleRoundButton);

  testWidgets('Invalid email and password', (WidgetTester tester) async {
  await tester.pumpWidget(testWidget);

  expect(find.byType(PageTitle), findsOneWidget);
  expect(emailField, findsOneWidget);
  expect(passwordField, findsOneWidget);
  expect(signinbutton, findsOneWidget);
  expect(googlebutton, findsOneWidget);
  expect(find.byType(TextLink), findsNWidgets(2));
  expect(find.byType(OrDivider), findsOneWidget);

  await tester.enterText(emailField, 'test email');
  expect(find.text('test email'), findsOneWidget);
  print('invalid email');

  await tester.enterText(passwordField, 'test password');
  expect(find.text('test password'), findsOneWidget);
  print('invalid password');

  final dialog = find.byType(AlertDialog);

  await tester.tap(signinbutton);
  await tester.pump();
  expect(dialog, findsNothing);

  print('======================');
  print('Nothing');
  print('======================');
  print('');
});

  testWidgets('Valid email and invalid password', (WidgetTester tester) async {
    await tester.pumpWidget(testWidget);

    expect(find.byType(PageTitle), findsOneWidget);
    expect(emailField, findsOneWidget);
    expect(passwordField, findsOneWidget);
    expect(signinbutton, findsOneWidget);
    expect(googlebutton, findsOneWidget);
    expect(find.byType(TextLink), findsNWidgets(2));
    expect(find.byType(OrDivider), findsOneWidget);

    await tester.enterText(emailField, 'hlagalalerato@gmail.com');
    expect(find.text('hlagalalerato@gmail.com'), findsOneWidget);
    print('valid email');

    await tester.enterText(passwordField, 'test password');
    expect(find.text('test password'), findsOneWidget);
    print('invalid password');

    final dialog = find.byType(AlertDialog);

    await tester.tap(signinbutton);
    await tester.pump();
    expect(dialog, findsNothing);

    print('======================');
    print('Nothing');
    print('======================');
    print('');
  });

  testWidgets('invalid email and valid password', (WidgetTester tester) async {
    await tester.pumpWidget(testWidget);

    expect(find.byType(PageTitle), findsOneWidget);
    expect(emailField, findsOneWidget);
    expect(passwordField, findsOneWidget);
    expect(signinbutton, findsOneWidget);
    expect(googlebutton, findsOneWidget);
    expect(find.byType(TextLink), findsNWidgets(2));
    expect(find.byType(OrDivider), findsOneWidget);

    await tester.enterText(emailField, 'test email');
    expect(find.text('test email'), findsOneWidget);
    print('invalid email');

    await tester.enterText(passwordField, '1234@Google');
    expect(find.text('1234@Google'), findsOneWidget);
    print('valid password');

    final dialog = find.byType(AlertDialog);

    await tester.tap(signinbutton);
    await tester.pump();
    expect(dialog, findsNothing);

    print('======================');
    print('Nothing');
    print('======================');
    print('');
  });

  testWidgets('valid email and valid password', (WidgetTester tester) async {
    await tester.pumpWidget(testWidget);

    expect(find.byType(PageTitle), findsOneWidget);
    expect(emailField, findsOneWidget);
    expect(passwordField, findsOneWidget);
    expect(signinbutton, findsOneWidget);
    expect(googlebutton, findsOneWidget);
    expect(find.byType(TextLink), findsNWidgets(2));
    expect(find.byType(OrDivider), findsOneWidget);

    await tester.enterText(emailField, 'hlagalalerato@gmail.com');
    expect(find.text('hlagalalerato@gmail.com'), findsOneWidget);
    print('valid email');

    await tester.enterText(passwordField, '1234@Google');
    expect(find.text('1234@Google'), findsOneWidget);
    print('valid password');

    final dialog = find.widgetWithText(AlertDialog, 'error occurs');
    // final dialog = find.byType(AlertDialog);


    await tester.tap(signinbutton);
    await tester.pumpAndSettle();
    //expect(dialog, findsOneWidget);

    //final d = find.text('OK');
    print(dialog);

    print('======================');
    print('incorrect email/password');
    print('======================');
    print('');
  });
}
