import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aishop/icons/icons.dart';
import 'package:aishop/components/databasemanager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


//model for modal pop up
//displays image , price, name, description
Modal(context, imgUrl, name, description, price) {

  final SnackBar _snackbar = SnackBar(content: Text("Product added to the cart")
    ,);


  return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black54),
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
                    height: 8,
                  ),
                  Text(
                    "Name: " + name,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text("Price: R " + price,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70)),
                  SizedBox(
                    height: 8,
                  ),
                  Text("Description: " + description,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70)),
                  SizedBox(
                    height: 25,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      DataService().addtocart(name,imgUrl,description,price);
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                          content: const Text('Product Added to the Cart'),),);
                          },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                    ),
                    icon: Icon(
                      Icons.add_shopping_cart_rounded,
                      size: 20,
                      color: Colors.black,
                    ),
                    label: Text(
                      "ADD TO CART",
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),

                    ),
                  )
                ],
              ),
            ),
          ),
        );
      });
}
