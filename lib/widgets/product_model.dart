import 'package:aishop/components/databasemanager.dart';
import 'package:aishop/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:aishop/icons/icons.dart';
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
    return InkWell(
        onTap: () {
          //on tap modal pop up
          Modal(context, imgUrl, name, description, price);
          DataService().increment(name);
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
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ],
                  ),
                )
            )
        )
    );
  }
}
