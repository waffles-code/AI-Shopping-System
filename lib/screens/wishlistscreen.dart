import 'dart:ui';
import 'package:aishop/Services/historytracker.dart';
import 'package:aishop/components/order_review.dart';
import 'package:aishop/icons/icons.dart';
import 'package:aishop/theme.dart';
import 'package:aishop/utils/cart.dart';
import 'package:aishop/widgets/modal_model.dart';
import 'package:flutter/material.dart';
import 'package:aishop/utils/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../theme.dart';
import 'checkout.dart';

class W extends StatefulWidget {
  @override
  _W createState() => _W();
}

class _W extends State<W> {
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
      appBar: AppBar(
        title: Text(
          'My Wish List',
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              icon: Icon(
                AIicons.cart,
                color: Colors.white,
                size: 25,
              ),
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => OrderReview()));
              })
        ],
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
                return wishlist(
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

class wishlist extends StatefulWidget {
  final prodname;
  final prodpicture;
  final prodprice;
  final proddescription;
  final cartid;

  wishlist(
      {this.prodname,
      this.prodpicture,
      this.prodprice,
      this.proddescription,
      this.cartid});

  @override
  _Wishlist createState() => _Wishlist();
}

class _Wishlist extends State<wishlist> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shadowColor: Colors.blueGrey,
      child: ListTile(
          onTap: () {
            Modal(context, widget.cartid, widget.prodpicture,
                widget.proddescription, widget.prodname, widget.prodprice);
          },
          leading: new Image.network(
            widget.prodpicture,
            // width: 100,
            // height: 200,
            fit: BoxFit.fill,
          ),
          title: new Text(widget.prodname,
              style: TextStyle(
                  color: black, fontWeight: FontWeight.bold, fontSize: 15)),
          subtitle: new Column(children: <Widget>[
            new Row(
              children: <Widget>[
                Expanded(
                  child: new Text(
                    widget.proddescription,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(Icons.delete_outline_rounded),
                onPressed: () {
                  Wishlist.removeFromCart(
                      widget.cartid,
                      widget.prodpicture,
                      widget.proddescription,
                      widget.prodname,
                      widget.prodprice);
                },
              ),
            ),
            Wrap(
              children: <Widget>[
                Container(
                  // padding: EdgeInsets.fromLTRB(0, 0, 250, 0),
                  child: new Text("R" + widget.prodprice,
                      style: TextStyle(color: Color(0xFFFDD835), fontSize: 23)),
                ),
                // SizedBox(
                //   width: 500,
                // ),
                Container(
                    // padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {
                        Cart.addToCart(
                            widget.cartid,
                            widget.prodpicture,
                            widget.proddescription,
                            widget.prodname,
                            widget.prodprice);
                        HistoryTracker.addToHistory(
                            widget.cartid,
                            widget.prodpicture,
                            widget.proddescription,
                            widget.prodname,
                            widget.prodprice);
                        // setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black54,
                      ),
                      child: Text(
                        "Add To Cart",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    )),
              ],
            )
          ])),
    );
  }
}
