import 'package:aishop/Services/prod_num_badges.dart';
import 'package:aishop/icons/icons.dart';
import 'package:aishop/screens/checkout.dart';
import 'package:aishop/screens/wishlistscreen.dart';
import 'package:aishop/utils/authentication.dart';
import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:/flutter/widgets.dart';

import '../theme.dart';

class constants {
  static const String profile = 'Profile';
  static const String orders = 'Orders';
  static const String settings = 'Settings';
  static const String signout = 'Signout';

  static const List<String> choices = <String>[
    profile,
    orders,
    settings,
    signout
  ];
}

class MyAppBar extends AppBar {
  MyAppBar({Key? key, Widget? title, required BuildContext context})
      : super(
            key: key,
            title: title,
            backgroundColor: lightblack,
            actions: <Widget>[
              IconButton(
                icon: Badge(
                  badgeContent: Num_Of_Prod_in_Wishlist(),
                  toAnimate: true,
                  animationType: BadgeAnimationType.scale,
                  child: Icon(
                    AIicons.wishlist,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                onPressed: () {
                  // Get.to(W());
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => WishlistPage()));
                },
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: IconButton(
                    icon: Badge(
                      toAnimate: true,
                      animationType: BadgeAnimationType.scale,
                      badgeContent: Num_Of_Prod_in_Cart(),
                      child: Icon(
                        AIicons.cart,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => CheckOutPage()));
                    },
                  )),
              Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 20, 0),
                child: PopupMenuButton<String>(
                  child: Center(
                      child: Icon(
                    AIicons.profile,
                    size: 30,
                  )),
                  itemBuilder: (context) {
                    return constants.choices.map((String choice) {
                      return PopupMenuItem<String>(
                        child: Text(choice),
                        value: choice,
                      );
                    }).toList();
                  },
                  // onSelected: choiceAction,
                ),
              ),
            ]);
}

// class app {
//   final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
//   Future<dynamic> navigateTo(String routeName) {
//     return navigatorKey.currentState!.pushNamed(routeName);
//   }

//   bool goBack() {
//     return navigatorKey.currentState.pop();
//   }
// }
