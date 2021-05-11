import 'package:aishop/components/databasemanager.dart';
import 'package:aishop/icons/icons.dart';
import 'package:flutter/material.dart';
import 'package:aishop/widgets/modal_model.dart';

//model for one item
//take product details as parameters and return and clickable countainer that displays the image & price of product
class ProductCard extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String description;
  final String price;

  ProductCard(
    this.imgUrl,
    this.name,
    this.description,
    this.price,
  );

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
                      Modal(context, imgUrl, name, description, price);
                      DataService().increment(name);
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
                                imgUrl,
                                width: 180,
                                height: 280,
                                fit: BoxFit.fitWidth,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              //text
                              Text(
                                "Name: " + name,
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              //price
                              Text("Price: R " + price,
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
