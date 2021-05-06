import 'dart:ui';

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
import 'package:flutter/material.dart';

import '../theme.dart';
import 'loginscreen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    bool _isProcessing = false;
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "AI Shopping",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.search_outlined,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                AIicons.wishlist,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {},
            ),
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
      body: ListView(
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
      ),
    );
  }
}
