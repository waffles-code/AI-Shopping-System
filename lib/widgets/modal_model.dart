import 'package:aishop/utils/cart.dart';
import 'package:aishop/utils/wishlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aishop/icons/icons.dart';

//model for modal pop up
//displays image , price, name, description

// ignore: non_constant_identifier_names
Modal(context, id, imgUrl, name, description, price,stockamt) {
  int amount = stockamt;
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
                        maxLines: 8,
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
                              id, imgUrl, description, name, price,stockamt);
                        },
                      ),
                      SizedBox(
                        width: 15,
                      ),
                          (amount>0) ? ElevatedButton.icon(
                        onPressed: () {
                          double quantity=1;
                          Cart.addToCart(id, imgUrl, name, description, price,quantity);
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
                      ):new Text('OUT OF STOCK',
                              style : TextStyle(fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Nunito Sans",
                                color: Colors.red,
                              )),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 0, 50, 0),
                      ),
                    ])
                    ),
                    Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                                child: (amount<50 && amount!=0) ?
                                new Text('LOW IN STOCK',
                                    style : TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Nunito Sans",
                                      color: Colors.orange,
                                    )):new Text(''),
                              )
                            ])),
                  ]),
            ),
          ),
        );
      });
}
