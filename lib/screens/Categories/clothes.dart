import 'dart:ui';

import 'package:aishop/components/order_review.dart';
import 'package:aishop/screens/search.dart';
import 'package:aishop/edit_profile.dart';
import 'package:aishop/icons/icons.dart';
import 'package:aishop/settings.dart';
import 'package:aishop/widgets/beauty.dart';
import 'package:aishop/widgets/books.dart';
import 'package:aishop/widgets/category.dart';
import 'package:aishop/widgets/clothes.dart';
import 'package:aishop/widgets/kitchen.dart';
import 'package:aishop/widgets/product_model.dart';
import 'package:aishop/widgets/recommendations.dart';
import 'package:aishop/widgets/tech.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:aishop/screens/checkout.dart';

import '../../theme.dart';

class ClothesScreen extends StatefulWidget {
  @override
  _ClothesScreen createState() => _ClothesScreen();
}

class _ClothesScreen extends State<ClothesScreen> {

  @override
  Widget build(BuildContext context) {
    updateCartTotal();
    return Scaffold(
      backgroundColor: lightestgrey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
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
                onPressed: () {},
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
            //category
            Center(
              child: Text(
                "Clothes",
                style: TextStyle(fontSize: 40),
              ),
            ),
            Container(
              height: 800,
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("Products")
                    .where("category", isEqualTo: "Clothing")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return SizedBox(
                      child: CircularProgressIndicator(
                        backgroundColor: lightgrey,
                      ),
                    );
                  } else {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          childAspectRatio: 2 / 3,
                          mainAxisSpacing: 0),
                      itemBuilder: (context, index) {
                        return ProductCard(
                          snapshot.data!.docs[index].id,
                          snapshot.data!.docs[index].get('url'),
                          snapshot.data!.docs[index].get('name'),
                          snapshot.data!.docs[index].get('description'),
                          snapshot.data!.docs[index].get('price').toString(),
                        );
                      },
                      itemCount: snapshot.data!.docs.length,
                    );
                  }
                },
              ),
            ),
          ]
      ),
    );
  }
}