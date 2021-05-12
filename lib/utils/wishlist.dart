
import 'package:cloud_firestore/cloud_firestore.dart';

import 'authentication.dart';

class Wishlist  {
  final id, imgUrl, description, name, price;

  Wishlist.addToCart(this.id, this.imgUrl, this.description, this.name, this.price) {
    FirebaseFirestore.instance.collection('Users').doc(uid).collection("Wishlist").doc(id).set(
        {
          'url': imgUrl,
          'name':name,
          'description':description,
          'price':price,
        }
    );
  }

  Wishlist.removeFromCart(this.id, this.imgUrl, this.description, this.name, this.price){
          FirebaseFirestore.instance.collection('Users').doc(uid).collection("Wishlist").doc(id).delete();
      }
}

