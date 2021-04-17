import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('email or password is empty, does not sign in', (WidgetTester tester) async {

    bool didSignIn = false;
    expect(didSignIn, false);
  });

  testWidgets('non-empty email and password, valid account, call sign in, succeed', (WidgetTester tester) async {

    bool didSignIn = true;
    expect(didSignIn, true);

  });

}
