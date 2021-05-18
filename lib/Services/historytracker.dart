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

