import 'package:aishop/components/horizontal_listView.dart';
import 'package:aishop/edit_profile.dart';
import 'package:aishop/settings.dart';
import 'package:aishop/utils/authentication.dart';
import 'package:flutter/material.dart';
import 'package:aishop/screens/checkout.dart';


import '../theme.dart';
import 'checkout.dart';
import 'checkout.dart';
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
        backgroundColor: black,
        //left black panel for intro
        title: Text('AI Shopping System'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: white,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) =>
                          CheckOutPage()));
            },
          ),
        ],
      ),
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
          //Padding widget
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Shop by Category',
                style: TextStyle(fontSize: 30, fontFamily: 'Inria Serif')),
          ),
          //Horizontal listview for Categories
          CategoriesHorizontalList(),

          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 35.0, 8.0, 8.0),
            child: Text('Books',
                style: TextStyle(fontSize: 30, fontFamily: 'Inria Serif')),
          ),
          //Horizontal listview for Books
          BooksHorizontalList(),
          Divider(
            thickness: 2,
            indent: 25,
            endIndent: 25,
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Clothes',
                style: TextStyle(fontSize: 30, fontFamily: 'Inria Serif')),
          ),
          //Horizontal listview for Clothes
          ClothesHorizontalList(),
          Divider(
            thickness: 2,
            indent: 25,
            endIndent: 25,
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Beauty',
                style: TextStyle(fontSize: 30, fontFamily: 'Inria Serif')),
          ),
          //Horizontal listview for cosmetics
          BeautyHorizontalList(),
          Divider(
            thickness: 2,
            indent: 25,
            endIndent: 25,
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Kitchen',
                style: TextStyle(fontSize: 30, fontFamily: 'Inria Serif')),
          ),
          //Horizontal listview for Kitchen
          KitchenHorizontalList(),
          Divider(
            thickness: 2,
            indent: 25,
            endIndent: 25,
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Tech',
                style: TextStyle(fontSize: 30, fontFamily: 'Inria Serif')),
          ),
          //Horizontal listview for Tech
          TechHorizontalList(),
          Divider(
            thickness: 2,
            indent: 25,
            endIndent: 25,
          ),
        ],
      ),
    );
  }
}
