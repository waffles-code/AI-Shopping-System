import 'package:aishop/icons/icons.dart';
import 'package:aishop/screens/checkout.dart';
import 'package:aishop/screens/wishlistscreen.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class constants {
  static const String profile = 'Profile';
  static const String settings = 'Settings';
  static const String signout = 'Signout';

  static const List<String> choices = <String>[profile, settings, signout];
}

class MyAppBar extends AppBar {
  MyAppBar({Key? key, Widget? title})
      : super(
            key: key,
            title: title,
            backgroundColor: lightblack,
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  AIicons.wishlist,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  // Get.to(W());
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (BuildContext context) => W()));
                },
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: IconButton(
                    icon: Icon(
                      AIicons.cart,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      // Get.to(CheckOutPage());
                      // Navigator.push(
                      //     context,
                      //     new MaterialPageRoute(
                      //         builder: (context) => CheckOutPage()));
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
