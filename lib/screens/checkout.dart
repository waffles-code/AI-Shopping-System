// ignore: avoid_web_libraries_in_flutter

import 'package:aishop/components/ORDERREVIEW.dart';

import 'package:flutter/material.dart';
import 'package:aishop/components/checkoutaddress.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../theme.dart';

User _user = FirebaseAuth.instance.currentUser!;

final CollectionReference usersRef = FirebaseFirestore.instance
    .collection('Users')
    .doc(_user.uid)
    .collection("Cart");
var productsoncart = [];

class CheckOutPage extends StatefulWidget {
  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  getdata() async {
    return usersRef;
  }

  @override
  void initState() {
    // TODO: implement initState
    getUsers();

    super.initState();
  }

  getUsers() {
    usersRef.get().then((QuerySnapshot snapshot) {
      for (int i = 0; i < snapshot.docs.length; ++i) {
        print('name: $snapshot');
        productsoncart.add(snapshot.docs[i].data());
        print(snapshot.docs[i].data());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Scaffold(
              appBar: AppBar(

                title: Text(
                  "Checkout Page",
                  textWidthBasis: TextWidthBasis.parent,
                  style: TextStyle(color: white),
                ),
                backgroundColor: lightblack,
                bottom: PreferredSize(
                  preferredSize: Size(MediaQuery.of(context).size.width, 50),
                  child: Text(
                    "Address",
                    style: TextStyle(color: white),
                    textWidthBasis: TextWidthBasis.parent,
                  ),
                ),
                // bottom: TabBar(indicatorColor: white, labelColor: white, tabs: [
                //   Tab(
                //     text: "Address",
                //   ),
                //   Tab(
                //     text: "Delivery",
                //   ),
                //   Tab(
                //     text: "Payment",
                //   )
                // ]),
              ),
              body:
                  // TabBarView(
                  //   children: <Widget>[
                  CheckOutAddress(),
              // CheckOutDelivery(),
              // CheckOutPayment(),
              // ],
              // ),
            ),
          ),
          Expanded(
              child: Scaffold(
            body: OrderReview(),
          )),
        ],
      ),
    );
  }
}
