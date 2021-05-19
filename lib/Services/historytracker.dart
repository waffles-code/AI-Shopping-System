import 'package:aishop/utils/authentication.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryTracker  {
  final id, imgUrl, description, name, price;

  HistoryTracker.addToHistory(this.id, this.imgUrl, this.description, this.name, this.price) {
    FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection('History')
        .doc(id)
        .get()
        .then((snapshot) => {
      if (snapshot.data() == null || !snapshot.exists) {
        FirebaseFirestore.instance.collection('Users').doc(uid).collection("History").doc(id).set(
            {
              'url': imgUrl,
              'name':name,
              'description':description,
              'price':price,
              'click count': 1
            }
        )
      }
      else if(snapshot.get('click count') < 5){
        FirebaseFirestore.instance.collection('Users').doc(uid).collection("History").doc(id)
            .update({'click count': FieldValue.increment(1)})
      }
    });
  }
}

void addToPurchases(){
  DateTime now = new DateTime.now();
  DateTime date = new DateTime(now.year, now.month, now.day);
  FirebaseFirestore.instance
      .collection('Users')
      .doc(uid)
      .collection('Cart')
      .get().then((snapshots) => {
    snapshots.docs.forEach((productid) {
      FirebaseFirestore.instance
          .collection('Users')
          .doc(uid)
          .collection('Purchases')
          .doc(productid.id)
          .get ()
          .then((snapshot) => {
        if (snapshot.data() == null || !snapshot.exists) {
          FirebaseFirestore.instance.collection('Users').doc(uid).collection("Purchases").doc(productid.id). set (
              {
                'url': productid.get("url"),
                'name':productid.get("name"),
                'description':productid.get("description"),
                'price':productid.get("price"),
                'date': date
              }
          )
        },
        productid.reference.delete()
      });
    })
  }
  );
}