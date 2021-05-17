import 'package:aishop/icons/icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

double g = 0.00;
int sizethis = 0;
int count = 0;

// ignore: must_be_immutable
class OrderReview extends StatelessWidget {
  //User _user = FirebaseAuth.instance.currentUser!;
  final CollectionReference usersRef = FirebaseFirestore.instance
      .collection('Users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("Cart");

  etdata() async {
    return usersRef;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: lightblack,
        appBar: AppBar(
          title: Text(
            'Order Review',
            style: TextStyle(
                fontSize: 25, color: lightblack, fontWeight: FontWeight.bold),
          ),
          toolbarHeight: 100,
          backgroundColor: Colors.white60,
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
                  sizethis = sizethis + 2;
                  if (sizethis <= snapshot.data!.docs.length) {
                    g = g + int.parse(snapshot.data!.docs[index].get('price'));

                    // DataService().getTotalCost(g.toString());
                  }

                  return SingleCartProduct(
                    prodname: snapshot.data!.docs[index].get('name'),
                    prodpicture: snapshot.data!.docs[index].get('url'),
                    // prodquantity: snapshot.data!.docs[index].get('quantity'),
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
        bottomNavigationBar: new Container(
          color: Color(0xD2242424),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: ListTile(
                title: new Text(
                  "ORDER SUBTOTAL                      \n                             ",
                  style: TextStyle(color: white),
                ),
                subtitle: new Text(
                  " \n TOTAL                                R " +
                      (g.toString()),
                  style: TextStyle(color: white, fontSize: 19.0),
                ),
              ))
            ],
          ),
        ));
  }
}

class SingleCartProduct extends StatelessWidget {
  final prodname;
  final prodpicture;
  final prodprice;
  // final prodquantity;
  final proddescription;

  SingleCartProduct(
      {this.prodname,
      this.prodpicture,
      this.prodprice,
      // this.prodquantity,
      this.proddescription});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xB7242424),
      child: ListTile(
        leading: new Image.network(
          prodpicture,
          width: 70.0,
          height: 70.0,
        ),
        title: new Text(prodname, style: TextStyle(color: white)),
        subtitle: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                Expanded(
                  child: new Text(
                    proddescription,
                    style: TextStyle(color: lightgrey),
                    maxLines: 1,
                  ),
                )
              ],
            ),

            // new Container(
            //   alignment: Alignment.bottomLeft,
            //   child: new Text(prodquantity,
            //       style: TextStyle(color: Color(0xFFFDD835))),
            // ),
            SizedBox(
              height: 10,
            ),

            new Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.yellow)),
                  child: Center(
                      child: Icon(
                    Icons.exposure_minus_1,
                    size: 10,
                    color: Colors.yellowAccent,
                  )),
                ),
                SizedBox(
                  height: 5,
                  width: 10,
                ),
                Text(
                  "1",
                  style: TextStyle(fontSize: 10, color: Colors.yellowAccent),
                ),
                SizedBox(
                  height: 5,
                  width: 10,
                ),
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.yellow)),
                  child: Center(
                      child: Icon(
                    Icons.exposure_plus_1,
                    size: 10,
                    color: Colors.yellowAccent,
                  )),
                ),
              ],
            ),

            SizedBox(
              height: 5,
            ),
            new Container(
              alignment: Alignment.bottomRight,
              child: new Text("R" + prodprice,
                  style: TextStyle(color: Color(0xFFFDD835))),
            ),

            SizedBox(
              height: 10,
            ),

            new Row(
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        height: 0,
                        width: 0,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey,
                        ),
                        icon: Icon(
                          Icons.delete_outline_rounded,
                          size: 15,
                          color: Colors.black,
                        ),
                        label: Text(
                          "Remove",
                          style: TextStyle(
                              fontSize: 10.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.yellowAccent),
                        ),
                      ),
                    ],
                  ),
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
