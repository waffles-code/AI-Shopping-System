import 'package:aishop/widgets/tech.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DataService {

  User _user = FirebaseAuth.instance.currentUser!;


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

  decrementincrement(String itemname) async {
    FirebaseFirestore.instance.collection('Products')
        .where('name', isEqualTo: itemname)
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((documentSnapshot) {
        documentSnapshot.reference.update(
            {"stockamt": FieldValue.increment(-1)});
      });
    });
  }


  Future addtocart(String name, String url, String description,price){
    return FirebaseFirestore.instance.collection("Users")
        .doc(_user.uid)
        .collection("Cart")
        .doc(name)
        .set({'url': url,'name': name,'description': description,'price': price, 'quantity': "1"});

  }
 Future getTotalCost(String subtotal){
    return FirebaseFirestore.instance.collection("Users")
        .doc(_user.uid)
        .collection("Total Cost")
         .doc("your total cost")
        .set({"subtotal": subtotal });
}

}