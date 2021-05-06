import 'package:flutter/material.dart';
import 'package:aishop/icons/icons.dart';
import 'package:aishop/widgets/books.dart';

import 'category_card.dart';

class Cat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
                splashColor: Colors.white30,
                customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: CategoryCard(
                    Icon(
                      AIicons.books,
                      size: 70,
                    ),
                    "Books"),
              ),
            ),
            Material(
              child: InkWell(
                onTap: () {},
                splashColor: Colors.white30,
                customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: CategoryCard(
                    Icon(
                      AIicons.clothes,
                      size: 70,
                    ),
                    "Clothes"),
              ),
            ),
            Material(
              child: InkWell(
                onTap: () {},
                splashColor: Colors.white30,
                customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: CategoryCard(
                    Icon(
                      AIicons.shoe,
                      size: 70,
                    ),
                    "Shoes"),
              ),
            ),
            Material(
              child: InkWell(
                onTap: () {},
                splashColor: Colors.white30,
                customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: CategoryCard(
                    Icon(
                      AIicons.kettle_black,
                      size: 70,
                    ),
                    "Kitchen"),
              ),
            ),
            Material(
              child: InkWell(
                  onTap: () {},
                  splashColor: Colors.white30,
                  customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: CategoryCard(
                      Icon(
                        AIicons.tech,
                        size: 70,
                      ),
                      "Tech")),
            ),
          ],
        ));
  }
}
