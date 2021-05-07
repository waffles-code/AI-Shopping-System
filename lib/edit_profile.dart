import 'dart:html';

import 'package:flutter/material.dart';

import 'components/round_textfield.dart';
import 'screens/homepage.dart';
import 'settings.dart';

import 'main.dart';

class EditProfilePage extends StatefulWidget {
  bool showPassword = false;
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class SettingsUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Setting UI",
      home: EditProfilePage(),
    );
  }
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 1,
          title: Text(
            'AI SHOPPING SYSTEM',
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => SettingsPage()));
                }),
          ]),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text("Edit Profile",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10)),
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover, image: NetworkImage(""))),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Colors.black,
                          ),
                          child: Icon(Icons.edit, color: Colors.white),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Divider(
                height: 20,
                thickness: 2,
                indent: 0,
                endIndent: 20,
                color: Colors.black,
              ),
              Container(
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //====================================================================================row
                      children: [
                    Container(
                        width: 600,
                        height: 50,
                        child: TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.black87,
                            hintText: 'first name',
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 2.0),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 2.0),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          style: TextStyle(
                              fontFamily: 'Nunito Sans',
                              fontWeight: FontWeight.w300),
                        )),
                    //====================================================================================row
                  ]
                      //====================================================================================rowEnded
                      )),
              SizedBox(
                height: 15,
              ),
              Container(
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //====================================================================================row
                      children: [
                    Container(
                        width: 600,
                        height: 50,
                        child: TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.black87,
                            hintText: 'last name',
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 2.0),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 2.0),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          style: TextStyle(
                              fontFamily: 'Nunito Sans',
                              fontWeight: FontWeight.w300),
                        )),
                    //====================================================================================row
                  ]
                      //====================================================================================rowEnded
                      )),
              SizedBox(
                height: 15,
              ),
              Container(
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //====================================================================================row
                      children: [
                    Container(
                        width: 600,
                        height: 50,
                        child: TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.black87,
                            hintText: 'Email or username',
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 2.0),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 2.0),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          style: TextStyle(
                              fontFamily: 'Nunito Sans',
                              fontWeight: FontWeight.w300),
                        )),
                    //====================================================================================row
                  ]
                      //====================================================================================rowEnded
                      )),
              SizedBox(
                height: 15,
              ),
              Container(
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //====================================================================================row
                      children: [
                    Container(
                        width: 600,
                        height: 50,
                        child: TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.black87,
                            hintText: '*********',
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 2.0),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 2.0),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          style: TextStyle(
                              fontFamily: 'Nunito Sans',
                              fontWeight: FontWeight.w300),
                        )),
                    //====================================================================================row
                  ]
                      //====================================================================================rowEnded
                      )),
              SizedBox(
                height: 15,
              ),
              Container(
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //====================================================================================row
                      children: [
                    Container(
                        width: 600,
                        height: 50,
                        child: TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.black87,
                            hintText: 'DD/MM/YYYY',
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 2.0),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 2.0),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          style: TextStyle(
                              fontFamily: 'Nunito Sans',
                              fontWeight: FontWeight.w300),
                        )),
                    //====================================================================================row
                  ]
                      //====================================================================================rowEnded
                      )),
              SizedBox(
                height: 15,
              ),
              Container(
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //====================================================================================row
                      children: [
                    Container(
                        width: 600,
                        height: 50,
                        child: TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.black87,
                            hintText: 'location',
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 2.0),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 2.0),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          style: TextStyle(
                              fontFamily: 'Nunito Sans',
                              fontWeight: FontWeight.w300),
                        )),
                    //====================================================================================row
                  ]
                      //====================================================================================rowEnded
                      )),
              Divider(
                height: 20,
                thickness: 2,
                indent: 0,
                endIndent: 20,
                color: Colors.black,
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => HomePage()));
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.black),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {},
                    color: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 2,
                    child: Text(
                      "Save",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
