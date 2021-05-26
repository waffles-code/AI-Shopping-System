import 'dart:ui';

<<<<<<< HEAD
import 'package:aishop/components/databasemanager.dart';
=======
import 'package:aishop/components/order_review.dart';
import 'package:aishop/screens/search.dart';
>>>>>>> 69670672654eaca476b15289b7c9472151893548
import 'package:aishop/edit_profile.dart';
import 'package:aishop/icons/icons.dart';
import 'package:aishop/screens/wishlist.dart';
import 'package:aishop/settings.dart';
import 'package:aishop/widgets/beauty.dart';
import 'package:aishop/widgets/books.dart';
import 'package:aishop/widgets/category.dart';
import 'package:aishop/widgets/clothes.dart';
import 'package:aishop/widgets/kitchen.dart';
import 'package:aishop/widgets/recommendations.dart';
import 'package:aishop/widgets/tech.dart';
import 'package:flutter/material.dart';
import 'package:aishop/screens/checkout.dart';

import '../theme.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    updateCartTotal();
    return Scaffold(
        backgroundColor: lightestgrey,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
              leading: Icon(
                AIicons.chip,
                color: Colors.white,
                size: 30,
              ),
              backgroundColor: lightblack,
              title:
                  Text(
                      "AI Shopping",
                      style:
                          TextStyle(color: white, fontWeight: FontWeight.bold),
                    ),
              actions: [
                IconButton(
                        icon: Icon(
                          AIicons.search,
                          color: Colors.white,
                          size: 25,
                        ),
                        onPressed: () {
                          setState(() {
                            this.isSearching = true;
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => Search()));
                          });
                        },
                      ),
                IconButton(
                  icon: Icon(
                    AIicons.wishlist,
                    color: Colors.white,
                    size: 25,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => wishlist()));
                  },
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: Icon(
                          AIicons.cart,
                          color: Colors.white,
                          size: 25,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => CheckOutPage()));
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          AIicons.profile,
                          color: Colors.white,
                          size: 25,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => EditProfilePage()));
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          AIicons.settings,
                          color: Colors.white,
                          size: 25,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => SettingsPage()));
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          AIicons.signout,
                          color: Colors.white,
                          size: 25,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                )
              ],
              iconTheme: IconThemeData(color: white)),
        ),

        //Body of the home page
        body:
        ListView(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  //category
                  Center(
                    child: Text(
                      "Categories",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  Category(),
                  SizedBox(
                    height: 10,
                  ),
                  //Products
                  Center(
                    child: Text(
                      "Recommendations",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Recommendations(),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Text(
                    "Books",
                    style: TextStyle(fontSize: 40),
                  )),

                  SizedBox(
                    height: 10,
                  ),
                  Books(),

                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Text(
                    "Clothes",
                    style: TextStyle(fontSize: 40),
                  )),

                  SizedBox(
                    height: 10,
                  ),
                  Clothes(),

                  SizedBox(
                    height: 10,
                  ),

                  Center(
                      child: Text(
                    "Shoes",
                    style: TextStyle(fontSize: 40),
                  )),
                  Beauty(),
                  SizedBox(
                    height: 10,
                  ),

                  Center(
                      child: Text(
                    "Kitchen",
                    style: TextStyle(fontSize: 40),
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  Kitchen(),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Text(
                    "Tech",
                    style: TextStyle(fontSize: 40),
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  Tech(),

                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
    );
  }
}