import 'package:aishop/widgets/modal_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchService {
  searchByName(String searchField) {
    return FirebaseFirestore.instance
        .collection('Products')
        .where('name', isGreaterThan: searchField)
        .get();
  }

  increment(String itemname) async {
    FirebaseFirestore.instance
        .collection('Products')
        .where('name', isEqualTo: itemname)
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((documentSnapshot) {
        documentSnapshot.reference.update({"clicks": FieldValue.increment(1)});
      });
    });
  }
}
