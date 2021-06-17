import 'package:aishop/icons/icons.dart';
import 'package:aishop/screens/Categories/books.dart';
import 'package:aishop/screens/homepage.dart';
import 'package:aishop/widgets/category.dart';
import 'package:aishop/widgets/category_card.dart';
import 'package:aishop/widgets/kitchen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget testWidget = new MediaQuery(
      data: new MediaQueryData(), child: new MaterialApp(home: new HomePage()));

  Widget makeTestableWidget({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('category cards visible ...', (tester) async {
    Category cat = Category();
    await tester.pumpWidget(makeTestableWidget(child: cat));

    expect(find.byType(InkWell), findsWidgets);
    expect(find.byType(CategoryCard), findsWidgets);
    final books = find.widgetWithText(CategoryCard, "Books");
    final shoes = find.widgetWithText(CategoryCard, "Shoes");
    final tech = find.widgetWithText(CategoryCard, "Tech");
    final kitchen = find.widgetWithText(CategoryCard, "Kitchen");
    final clothes = find.widgetWithText(CategoryCard, "Clothes");

    await tester.tap(books);
    await tester.tap(shoes);
  });
}
