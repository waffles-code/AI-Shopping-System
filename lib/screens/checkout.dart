import 'dart:html';

import 'package:aishop/components/ORDERREVIEW.dart';
import 'package:aishop/components/checkoutdelivary.dart';
import 'package:aishop/components/checkoutpayment.dart';
import 'package:flutter/material.dart';
import 'package:aishop/components/checkoutaddress.dart';
//import 'package:aishop/components/ORDERREVIEW.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../components/google_round_button.dart';
import '../components/round_button.dart';
import '../components/round_button.dart';

User _user = FirebaseAuth.instance.currentUser!;

final CollectionReference usersRef = FirebaseFirestore.instance
    .collection('Users')
    .doc(_user.uid)
    .collection("Cart");
var products_on_cart = [];

class CheckOutPage extends StatefulWidget {
  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  Getdata() async {
    return await usersRef;
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
        products_on_cart.add(snapshot.docs[i].data());
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
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.black,
                bottom: TabBar(
                    indicatorColor: Colors.white,
                    labelColor: Colors.white,
                    tabs: [
                      Tab(
                        text: "Address",
                      ),
                      Tab(
                        text: "Delivery",
                      ),
                      Tab(
                        text: "Payment",
                      )
                    ]),
              ),
              body: TabBarView(
                children: <Widget>[
                  CheckOutAddress(),
                  CheckOutDelivary(),
                  CheckOutPayment(),
                ],
              ),
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
