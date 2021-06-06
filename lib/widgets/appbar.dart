import 'package:aishop/Services/prod_num_badges.dart';
import 'package:aishop/components/pastpurchase.dart';
import 'package:aishop/edit_profile.dart';
import 'package:aishop/icons/icons.dart';
import 'package:aishop/screens/checkout.dart';
import 'package:aishop/screens/loginscreen.dart';
import 'package:aishop/screens/wishlistscreen.dart';
import 'package:aishop/settings.dart';
import 'package:aishop/utils/authentication.dart';
import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:aishop/addons/popup_menu_consts.dart';
import '../theme.dart';

void choiceAction(String choice) {
  if (choice == constants.profile) {
    Navigator.push(
        contxt, new MaterialPageRoute(builder: (context) => EditProfilePage()));
  } else if (choice == constants.settings) {
    Navigator.push(
        contxt, new MaterialPageRoute(builder: (context) => SettingsPage()));
  } else if (choice == constants.orders) {
    Navigator.push(
        contxt, new MaterialPageRoute(builder: (context) => PastPurchase()));
  } else if (choice == constants.signout) {
    signOut().then((response) => {
          if (response == "User signed out")
            {
              showDialog(
                context: contxt,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: new Text("Success!"),
                    content: new Text(response),
                    actions: <Widget>[
                      ElevatedButton(
                        child: new Text("OK"),
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  LoginScreen()));
                        },
                      ),
                    ],
                  );
                },
              ),
            }
          else
            showDialog(
              context: contxt,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: new Text("Error!!"),
                  content: new Text(response),
                  actions: <Widget>[
                    ElevatedButton(
                      child: new Text("OK"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            )
        });
  }
}

BuildContext contxt = "" as BuildContext;

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
                    contxt = context;
                    return constants.choices.map((String choice) {
                      return PopupMenuItem<String>(
                        child: Text(choice),
                        value: choice,
                      );
                    }).toList();
                  },
                  onSelected: choiceAction,
                ),
              ),
            ]);
}
