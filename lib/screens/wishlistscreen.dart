import 'dart:ui';

import 'package:aishop/icons/icons.dart';
import 'package:aishop/screens/checkout.dart';
import 'package:aishop/screens/homepage.dart';
import 'package:aishop/theme.dart';
import 'package:flutter/material.dart';

class wishlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WISHLIST"),
        backgroundColor: black,
        actions: [
          IconButton(
              icon: Icon(AIicons.cart),
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => CheckOutPage()));
              })
        ],
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          Center(
            child: Text(
              "My Wishlist",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
          ),
          Icon(
            Icons.favorite_border_outlined,
            size: 30,
          ),
          SizedBox(
            height: 15,
          ),
          Padding(padding: EdgeInsets.all(20)),
          Wrap(
            children: <Widget>[
              Padding(padding: EdgeInsets.fromLTRB(25, 0, 35, 0)),
              Text(
                "Product name",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Padding(padding: EdgeInsets.fromLTRB(35, 0, 35, 0)),
              Text(
                "Unit price",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Padding(padding: EdgeInsets.fromLTRB(35, 0, 15, 0)),
              Text(
                "Stock status",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Divider(color: black, thickness: 1)
        ],
      ),
    );
  }
}
