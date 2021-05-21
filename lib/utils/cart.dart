
import 'package:cloud_firestore/cloud_firestore.dart';

import 'authentication.dart';

class Cart  {
  final id, imgUrl, description, name, price;

  Cart.addToCart(this.id, this.imgUrl, this.description, this.name, this.price) {
    FirebaseFirestore.instance.collection('Users').doc(uid).collection("Cart").doc(id).set(
        {
          'url': imgUrl,
          'name':name,
          'description':description,
          'price':price,
          'quantity': "1"
        }
    );
  }

Cart.removeFromCart(this.id, this.imgUrl, this.description, this.name, this.price){
    FirebaseFirestore.instance.collection('Users').doc(uid).collection("Cart").doc(id).delete();
  }

  Cart.UpdateQuantity(this.id, this.imgUrl, this.description, this.name, this.price,String quantity){
    FirebaseFirestore.instance.collection('Users').doc(uid).collection("Cart").doc(id).set(
        {
          'url': imgUrl,
          'name':name,
          'description':description,
          'price':price,
          'quantity': quantity
        }
    );

  }
}

