
import 'package:aishop/widgets/modal_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchService{

  searchByName(String searchField) {
    return FirebaseFirestore.instance
        .collection('Products')
        .where('name', isGreaterThan: searchField)
        .get();
  }

  increment(String itemname) async {
    FirebaseFirestore.instance.collection('Products')
        .where('name', isEqualTo: itemname)
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((documentSnapshot) {
        documentSnapshot.reference.update({"clicks" : FieldValue.increment(1)});
      });
    });
  }

  Widget buildResultCard(BuildContext context,data) {
    return InkWell(
        onTap: () {
          increment(data['name']);
          Modal(context, data['id'], data['url'], data['name'], data['description'], data['price']);
        },
        splashColor: Colors.white30,
        customBorder:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey,
                        blurRadius: 5,
                      )
                    ],
                    borderRadius: BorderRadius.circular(20)),
                width: 100,
                child: Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      //image from db
                      Image.network(
                        data['url'],
                        width: 180,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //text
                      Text(
                        data['name'],
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      //price
                      Text("Price: R " + data['price'].toString(),
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ],
                  ),
                )
            )
        )
    );
  }
}