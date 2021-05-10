import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:aishop/widgets/product_model.dart';
import 'package:aishop/components/databasemanager.dart';

double g = 0.00;
int sizethis = 0;


class OrderReview extends StatelessWidget {


  User _user = FirebaseAuth.instance.currentUser!;
  final CollectionReference usersRef = FirebaseFirestore.instance.collection('Users')
      .doc(FirebaseAuth.instance.currentUser!.uid).collection("Cart");


  etdata() async{
    return await usersRef;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Order Review',
          style: TextStyle(
              fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        toolbarHeight: 100,
        backgroundColor: Colors.white60,
      ),
      body: new StreamBuilder<QuerySnapshot>(
        stream: usersRef
            .snapshots(),
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

                sizethis = sizethis+1;
                if(sizethis<=snapshot.data!.docs.length){
                  g = g + int.parse(snapshot.data!.docs[index].get('price'));
                  DataService().getTotalCost(g.toString());
                }
                return Single_cart_product(
                  prod_name:snapshot.data!.docs[index].get('name'),
                  prod_picture:snapshot.data!.docs[index].get('url'),
                  prod_quantity:snapshot.data!.docs[index].get('quantity'),
                  prod_description:snapshot.data!.docs[index].get('description'),
                  prod_price:snapshot.data!.docs[index].get('price'),
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
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: new Text(
                      " \n TOTAL                                R " + g.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 19.0),
                    ),
                  ))
            ],
          ),
        )

    );
  }
}

class Single_cart_product extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_price;
  final prod_quantity;
  final prod_description;

  Single_cart_product({this.prod_name,
    this.prod_picture,
    this.prod_price,
    this.prod_quantity,
    this.prod_description});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xB7242424),
      child: ListTile(
        leading: new Image.network(
          prod_picture,
          width: 70.0,
          height: 70.0,
        ),
        title: new Text(prod_name, style: TextStyle(color: Colors.white)),
        subtitle: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                Expanded(

                    child: new Text(prod_description,
                        style: TextStyle(color: Colors.grey),maxLines: 1,),)
              ],
            ),
            new Container(
              alignment: Alignment.bottomLeft,
              child: new Text(prod_quantity,
                  style: TextStyle(color: Color(0xFFFDD835))),
            ),
            new Container(
              alignment: Alignment.bottomRight,
              child: new Text("R"+prod_price,
                  style: TextStyle(color: Color(0xFFFDD835))),
            )
          ],
        ),
      ),
    );
  }
}
