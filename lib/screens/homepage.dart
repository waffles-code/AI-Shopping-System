import 'dart:js';
import 'dart:ui';

import 'package:aishop/components/databasemanager.dart';
import 'package:aishop/components/horizontal_listView.dart';
import 'package:aishop/edit_profile.dart';
import 'package:aishop/icons/icons.dart';
import 'package:aishop/settings.dart';
import 'package:aishop/utils/authentication.dart';
import 'package:aishop/widgets/beauty.dart';
import 'package:aishop/widgets/books.dart';
import 'package:aishop/widgets/category.dart';
import 'package:aishop/widgets/clothes.dart';
import 'package:aishop/widgets/kitchen.dart';
import 'package:aishop/widgets/tech.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:aishop/widgets/modal_model.dart';
import 'package:aishop/screens/checkout.dart';

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
    bool _isProcessing = false;
    return Scaffold(
        appBar: AppBar(
            title: !isSearching
                ? Text(
                    "AI Shopping",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )
                : TextField(
                    onChanged: (val) {
                      initiateSearch(val);
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        hintText: "Search",
                        hintStyle: TextStyle(color: Colors.white)),
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
                        Icons.search_outlined,
                        color: Colors.white,
                        size: 30,
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
                  size: 30,
                ),
                onPressed: () {},
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => CheckOutPage()));
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "3",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(0.8)),
                    ),
                  )
                ],
              )
            ],
            iconTheme: IconThemeData(color: Colors.white)),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              //Header
              UserAccountsDrawerHeader(
                //sets up drawer with user details
                //if no user name is found the display welcome instead.
                accountName: Text(name ?? "Welcome!"),
                accountEmail: Text(userEmail!),
                currentAccountPicture: GestureDetector(
                  child: CircleAvatar(
                    radius: 15,
                    backgroundImage:
                        imageUrl != null ? NetworkImage(imageUrl!) : null,
                    child: imageUrl == null
                        ? Icon(Icons.account_circle, size: 30)
                        : Container(),
                  ),
                ),
                decoration: BoxDecoration(color: Colors.black87),
              ),

              //Body of the drawer
              InkWell(
                //Action when you tap the text
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => HomePage()));
                },
                child: ListTile(
                  title: Text('Home Page'),
                  leading: Icon(Icons.home),
                ),
              ),

              InkWell(
                //Action when you tap the text
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => EditProfilePage()));
                },
                child: ListTile(
                  title: Text('My Account'),
                  leading: Icon(Icons.person),
                ),
              ),

              InkWell(
                //Action when you tap the text
                onTap: () {},
                child: ListTile(
                  title: Text('My Orders'),
                  leading: Icon(Icons.shopping_basket),
                ),
              ),

              InkWell(
                //Action when you tap the text
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => SettingsPage()));
                },
                child: ListTile(
                  title: Text('Settings'),
                  leading: Icon(Icons.settings),
                ),
              ),

              InkWell(
                  //Action when you tap the text
                  onTap: () async {
                    setState(() {
                      _isProcessing = true;
                    });
                    await signOut().then((result) {
                      print(result);
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    }).catchError((error) {
                      print('Sign Out Error: $error');
                    });
                    setState(() {
                      _isProcessing = false;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 8.0,
                      bottom: 8.0,
                    ),
                    child: _isProcessing
                        ? CircularProgressIndicator()
                        : ListTile(
                            title: Text('Sign out'),
                            leading: Icon(Icons.logout),
                          ),
                  )),
            ],
          ),
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
                  Cat(),
                  SizedBox(
                    height: 10,
                  ),
                  //Products
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
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
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
        Modal(context, data['url'], data['name'], data['description'],
            data['price']);
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
