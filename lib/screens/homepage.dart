import 'dart:ui';

import 'package:aishop/components/databasemanager.dart';
import 'package:aishop/edit_profile.dart';
import 'package:aishop/icons/icons.dart';

import 'package:aishop/screens/wishlistscreen.dart';
import 'package:aishop/settings.dart';
import 'package:aishop/utils/authentication.dart';
import 'package:aishop/widgets/beauty.dart';
import 'package:aishop/widgets/recommendations.dart';
import 'package:aishop/widgets/books.dart';
import 'package:aishop/widgets/category.dart';
import 'package:aishop/widgets/clothes.dart';
import 'package:aishop/widgets/kitchen.dart';
import 'package:aishop/widgets/tech.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:aishop/widgets/modal_model.dart';
import 'package:aishop/screens/checkout.dart';
import 'package:aishop/components/order_review.dart';
import '../theme.dart';
import 'loginscreen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSearching = false;

  var queryResultSet = [];
  var tempSearchStore = [];

  initiateSearch(value) {
    if (value.length == 0) {
      setState(() {
        queryResultSet = [];
        tempSearchStore = [];
      });
    }

    var capitalizedValue =
        value.substring(0, 1).toUpperCase() + value.substring(1);

    if (queryResultSet.length == 0 && value.length == 1) {
      DataService().searchByName(capitalizedValue).then((QuerySnapshot mydocs) {
        for (int i = 0; i < mydocs.docs.length; ++i) {
          queryResultSet.add(mydocs.docs[i].data());
          setState(() {
            tempSearchStore.add(queryResultSet[i]);
          });
        }
      });
    } else {
      tempSearchStore = [];
      queryResultSet.forEach((element) {
        if (element['name'].toLowerCase().contains(value.toLowerCase()) ==
            true) {
          if (element["name"].toLowerCase().indexOf(value.toLowerCase()) == 0) {
            setState(() {
              tempSearchStore.add(element);
            });
          }
        }
      });
    }
    if (tempSearchStore.length == 0 && value.length > 1) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    updateCartTotal();
    return Scaffold(
        backgroundColor: lightestgrey,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
              leading: Icon(
                AIicons.chip,
                color: Colors.white,
                size: 30,
              ),
              backgroundColor: lightblack,
              title: !isSearching
                  ? Text(
                "AI Shopping",
                style:
                TextStyle(color: white, fontWeight: FontWeight.bold),
              )
                  : TextField(
                onChanged: (val) {
                  initiateSearch(val);
                },
                style: TextStyle(color: white),
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.search_rounded,
                      color: white,
                    ),
                    hintText: "Search",
                    hintStyle: TextStyle(color: white)),
              ),
              actions: [
                isSearching
                    ? IconButton(
                  icon: Icon(
                    Icons.cancel,
                    color: white,
                  ),
                  onPressed: () {
                    setState(() {
                      tempSearchStore.clear();
                      this.isSearching = false;
                    });
                  },
                )
                    : IconButton(
                  icon: Icon(
                    AIicons.search,
                    color: Colors.white,
                    size: 25,
                  ),
                  onPressed: () {
                    setState(() {
                      this.isSearching = true;
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (BuildContext context) => SearchBar()));
                    });
                  },
                ),
                IconButton(
                  icon: Icon(
                    AIicons.wishlist,
                    color: Colors.white,
                    size: 25,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => W()));
                  },
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: Icon(
                          AIicons.cart,
                          color: Colors.white,
                          size: 25,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => CheckOutPage()));
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          AIicons.profile,
                          color: Colors.white,
                          size: 25,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => EditProfilePage()));
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          AIicons.settings,
                          color: Colors.white,
                          size: 25,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => SettingsPage()));
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          AIicons.signout,
                          color: Colors.white,
                          size: 25,
                        ),
                        onPressed: () {
                          signOut().then((response) => {
                            if(response == "User signed out"){
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: new Text("Success!"),
                                    content: new Text(response),
                                    actions: <Widget>[
                                      ElevatedButton(
                                        child: new Text("OK"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          Navigator.of(context).push(MaterialPageRoute(
                                              builder: (BuildContext context) => LoginScreen()));
                                        },
                                      ),
                                    ],
                                  );
                                },
                              ),

                            }
                            else
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: new Text("Error!!"),
                                  content: new Text(response),
                                  actions: <Widget>[
                                    ElevatedButton(
                                      child: new Text("OK"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            )
                          });
                        },
                      ),
                    ],
                  ),
                )
              ],
              iconTheme: IconThemeData(color: white)),
        ),

        //Body of the home page
        body: !isSearching
            ? ListView(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            //category
            Center(
              child: Text(
                "Categories",
                style: TextStyle(fontSize: 40),
              ),
            ),
            Category(),
            SizedBox(
              height: 10,
            ),

            //Products
            Center(
              child: Text(
                "Recommendations",
                style: TextStyle(fontSize: 40),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Recommendations(),
            SizedBox(
              height: 10,
            ),
            Center(
                child: Text(
                  "Books",
                  style: TextStyle(fontSize: 40),
                )),

            SizedBox(
              height: 10,
            ),
            Books(),

            SizedBox(
              height: 10,
            ),
            Center(
                child: Text(
                  "Clothes",
                  style: TextStyle(fontSize: 40),
                )),

            SizedBox(
              height: 10,
            ),
            Clothes(),

            SizedBox(
              height: 10,
            ),

            Center(
                child: Text(
                  "Shoes",
                  style: TextStyle(fontSize: 40),
                )),
            Beauty(),
            SizedBox(
              height: 10,
            ),

            Center(
                child: Text(
                  "Kitchen",
                  style: TextStyle(fontSize: 40),
                )),
            SizedBox(
              height: 10,
            ),
            Kitchen(),
            SizedBox(
              height: 10,
            ),
            Center(
                child: Text(
                  "Tech",
                  style: TextStyle(fontSize: 40),
                )),
            SizedBox(
              height: 10,
            ),
            Tech(),

            SizedBox(
              height: 10,
            ),
          ],
        )
            : ListView(children: <Widget>[
          SizedBox(height: 10.0),
          GridView.count(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              crossAxisCount: 4,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
              primary: false,
              shrinkWrap: true,
              children: tempSearchStore.map((element) {
                return buildResultCard(context, element);
              }).toList())
        ]));
  }
}

Widget buildResultCard(BuildContext context, data) {
  return InkWell(
      onTap: () {
        DataService().increment(data['name']);
        Modal(context, data['id'], data['url'], data['name'],
            data['description'], data['price']);
      },
      splashColor: Colors.white30,
      customBorder:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
              decoration: BoxDecoration(
                  color: white,
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
                      data['url'],
                      width: 180,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //text
                    Text(
                      "Name: " + data['name'],
                      style:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    //price
                    Text("Price: R " + data['price'],
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ],
                ),
              ))));
}
