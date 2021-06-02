import 'package:aishop/icons/icons.dart';
import 'package:aishop/utils/authentication.dart';
import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
  MyAppBar({Key? key, Widget? title})
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
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (BuildContext context) => W()));
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

  // ignore: non_constant_identifier_names
 static Widget Num_Of_Prod_in_Cart(){
    // ignore: non_constant_identifier_names
    var NumOfProd = 0;
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("Users")
            .doc(uid)
            .collection("Cart")
            .snapshots(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            NumOfProd = snapshot.data!.docs.length;
            return Text(NumOfProd.toString());
          }
          else{
            return Text(NumOfProd.toString());
          }
        }
    );

  }

  // ignore: non_constant_identifier_names
 static Widget Num_Of_Prod_in_Wishlist(){
    // ignore: non_constant_identifier_names
    var NumOfProd = 0;
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("Users")
            .doc(uid)
            .collection("Wishlist")
            .snapshots(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            NumOfProd = snapshot.data!.docs.length;
            return Text(NumOfProd.toString());
          }
          else{
            return Text(NumOfProd.toString());
          }
        }
    );

  }

}
