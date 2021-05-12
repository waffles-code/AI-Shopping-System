import 'package:aishop/components/databasemanager.dart';
import 'package:aishop/icons/icons.dart';
import 'package:aishop/utils/cart.dart';
import 'package:aishop/utils/wishlist.dart';
import 'package:flutter/material.dart';

import '../theme.dart';
import 'modal_model.dart';

//model for one item
//take product details as parameters and return and clickable countainer that displays the image & price of product

class ProductCard extends StatefulWidget{
  final String id;
  final String imgUrl;
  final String name;
  final String description;
  final String price;

  ProductCard(
      this.id,
      this.imgUrl,
      this.name,
      this.description,
      this.price,
      );

  @override
  State<StatefulWidget> createState() {
    return _ProductCard();
  }
}
/*
class _ProductCard extends State<ProductCard> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      child: Container(
          width: 310,
          height: 350,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.blueGrey,
                  blurRadius: 5,
                )
              ],
              borderRadius: BorderRadius.circular(20)),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                InkWell(
                    onTap: () {
                      //on tap modal pop up
                      Modal(context, widget.imgUrl, widget.name, widget.description, widget.price);
                      DataService().increment(widget.name);
                    },
                    splashColor: Colors.white30,
                    customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
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
                                widget.imgUrl,
                                width: 180,
                                height: 280,
                                fit: BoxFit.fitWidth,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              //text
                              Text(
                                "Name: " + widget.name,
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              //price
                              Text("Price: R " + widget.price,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        )))),
                Center(
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(30.0, 20.0, 20.0, 0.0),
                        child: IconButton(
                          icon: Icon(
                            AIicons.wishlist,
                            color: Colors.black,
                            size: 35,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Padding(
                          padding:
                              const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black54,
                            ),
                            icon: Icon(
                              Icons.add_shopping_cart_rounded,
                              size: 20,
                              color: Colors.white,
                            ),
                            label: Text(
                              "ADD TO CART",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          )),
                    ],
                  ),
                )
              ])),
    );
  }
}
*/
//model for one item
//take product details as parameters and return and clickable countainer that displays the image & price of product

class _ProductCard extends State<ProductCard> {
  bool toggle = false;
  bool add = false;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      child: Container(
          width: 200,
          height: 400,
          decoration: BoxDecoration(
              color: white,
              boxShadow: [
                BoxShadow(
                  color: Color(0xB3C8C8C8),
                  blurRadius: 0.2,
                )],
              borderRadius: BorderRadius.circular(10)),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                InkWell(
                    onTap: () {
                      //on tap modal pop up
                      Modal(context, widget.imgUrl, widget.name, widget.description, widget.price);
                      DataService().increment(widget.name);
                    },
                    splashColor: Colors.white30,
                    customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)),
                    child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  //image from db
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.network(
                                      widget.imgUrl,
                                      width: 180,
                                      height: 200,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  //text
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      widget.name,
                                      style: TextStyle(
                                          fontSize: 15, fontWeight: FontWeight.bold,
                                          fontFamily: "Nunito Sans"),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  //price
                                  Text("R "+widget.price, textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.orange,

                                      )
                                  ),
                                ],
                              ),
                            )))),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding:
                        const EdgeInsets.fromLTRB(10.0, 20.0, 20.0, 10.0),
                        child:  IconButton(
                          icon: toggle
                              ? Icon(Icons.favorite, color: Colors.red, size: 30)
                              : Icon(AIicons.wishlist, color: Colors.black, size: 30),
                          onPressed: () {
                            setState(() {
                              toggle = !toggle;
                            });
                            if(toggle)
                              Wishlist.addToCart(
                                  widget.id,
                                  widget.imgUrl,
                                  widget.description,
                                  widget.name,
                                  widget.price
                              );
                            else
                              Wishlist.removeFromCart(
                                  widget.id,
                                  widget.imgUrl,
                                  widget.description,
                                  widget.name,
                                  widget.price
                              );
                          },
                        ),
                      ),
                      Padding(
                          padding:
                          const EdgeInsets.fromLTRB(10.0, 20.0, 30.0, 10.0),
                          child: ElevatedButton.icon(
                              onPressed: () {
                                setState(() {
                                  add = !add;
                                });
                                if(add)
                                  Cart.addToCart(
                                      widget.id,
                                      widget.imgUrl,
                                      widget.description,
                                      widget.name,
                                      widget.price
                                  );
                                else
                                  Cart.removeFromCart(
                                      widget.id,
                                      widget.imgUrl,
                                      widget.description,
                                      widget.name,
                                      widget.price
                                  );
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  elevation: 0.1
                              ),
                              icon: add
                                  ? Icon(Icons.done_all_sharp , size: 20, color: Colors.green,)
                                  : Icon(Icons.add_shopping_cart_rounded, size: 20, color: lightblack),
                              label: add
                                  ? Text(
                                "ADDED",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: lightblack),
                              )
                                  : Text(
                                "ADD TO CART",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: lightblack),
                              )
                          )),
                    ],
                  ),
                )
              ])),
    );
  }
}

