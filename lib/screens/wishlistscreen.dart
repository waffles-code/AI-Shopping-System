import 'dart:ui';
import 'package:aishop/Services/historytracker.dart';
import 'package:aishop/components/order_review.dart';
import 'package:aishop/icons/icons.dart';
import 'package:aishop/theme.dart';
import 'package:aishop/utils/cart.dart';
import 'package:aishop/widgets/appbar.dart';
import 'package:aishop/widgets/modal_model.dart';
import 'package:aishop/widgets/wishlist_product_card.dart';
import 'package:flutter/material.dart';
import 'package:aishop/utils/wishlist.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../theme.dart';

class WishlistPage extends StatefulWidget {
  @override
  _Wishlist createState() => _Wishlist();
}

class _Wishlist extends State<WishlistPage> {
  final CollectionReference usersRef = FirebaseFirestore.instance
      .collection('Users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("Wishlist");

  etdata() async {
    return usersRef;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: MyAppBar(
        title: Text(
          'My Wish List',
        ),
        context: context,
      ),
      body: new StreamBuilder<QuerySnapshot>(
        stream: usersRef.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return SizedBox(
              child: CircularProgressIndicator(
                backgroundColor: Colors.blueGrey,
              ),
            );
          } else {
            return new ListView.builder(
              itemBuilder: (context, index) {
                return wishlistModel(
                  cartid: snapshot.data!.docs[index].id,
                  prodname: snapshot.data!.docs[index].get('name'),
                  prodpicture: snapshot.data!.docs[index].get('url'),
                  proddescription:
                      snapshot.data!.docs[index].get('description'),
                  prodprice: snapshot.data!.docs[index].get('price'),
                );
              },
              itemCount: snapshot.data!.docs.length,
            );
          }
        },
      ),
    );
  }
}

// ignore: camel_case_types
