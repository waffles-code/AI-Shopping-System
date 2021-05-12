import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aishop/icons/icons.dart';

import '../theme.dart';

//model for modal pop up
//displays image , price, name, description

modal(context, imgUrl, name, description, price) {
  return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black54),
            padding: EdgeInsets.all(15),
            width: MediaQuery.of(context).size.width * 0.7,
            height: 600,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      imgUrl,
                      width: 250,
                      height: 250,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "Name: " + name,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: white),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Price: R " + price,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: white)),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Description: " + description,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: lightestgrey)),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(180.0, 5.0, 20.0, 0.0),
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            AIicons.wishlist,
                            color: white,
                            size: 35,
                          ),
                          onPressed: () {},
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: lightgrey,
                          ),
                          icon: Icon(
                            Icons.add_shopping_cart_rounded,
                            size: 20,
                            color: white,
                          ),
                          label: Text(
                            "ADD TO CART",
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: white),
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
          ),
        );
      });
}

/*
modal(context, imgUrl, name, description, price) {
  return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black54),
              padding: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width * 0.7,
              height: 600,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        imgUrl,
                        width: 250,
                        height: 250,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "Name: " + name,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: white),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Price: R " + price,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: white)),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Description: " + description,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: lightestgrey)),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(180.0, 5.0, 20.0, 0.0),
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              AIicons.wishlist,
                              color: white,
                              size: 35,
                            ),
                            onPressed: () {},
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          ElevatedButton.icon(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: lightgrey,
                            ),
                            icon: Icon(
                              Icons.add_shopping_cart_rounded,
                              size: 20,
                              color: white,
                            ),
                            label: Text(
                              "ADD TO CART",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: white),
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
            ),
          ),
        );
      });
}
*/
