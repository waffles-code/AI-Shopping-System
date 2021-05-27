import 'package:aishop/utils/cart.dart';
import 'package:aishop/utils/wishlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aishop/icons/icons.dart';

import '../theme.dart';

//model for modal pop up
//displays image , price, name, description

Modal(context, id, imgUrl, name, description, price) {
  return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
            // type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.black),
              padding: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width * 0.7,
              height: 600,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        imgUrl,
                        width: 250,
                        height: 250,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "Name: " + name,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Price: R " + price,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Description: " + description,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white70)),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                        child: Wrap(children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(50.0, 0, 0, 50.0),
                      ),
                      IconButton(
                        padding: const EdgeInsets.fromLTRB(0, 0, 25, 0),
                        icon: Icon(
                          AIicons.wishlist,
                          color: Colors.white,
                          size: 35,
                        ),
                        onPressed: () {
                          Wishlist.addToCart(
                              id, imgUrl, description, name, price);
                        },
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          Cart.addToCart(id, imgUrl, name, description, price);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey,
                        ),
                        icon: Icon(
                          Icons.add_shopping_cart_rounded,
                          size: 20,
                          color: Colors.white,
                        ),
                        label: Text(
                          "ADD TO CART",
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 0, 50, 0),
                      ),
                    ]))
                  ]),
            ),
          ),
        );
      });
}
