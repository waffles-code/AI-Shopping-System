import 'dart:html';

import 'package:aishop/theme.dart';
import 'package:flutter/material.dart';
import 'components/icon_button.dart';
import 'components/round_textfield.dart';

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
      title: "My Profile",
      home: EditProfilePage(),
    );
  }
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 60,
                  width: size.width*0.3,
                  color: mediumblack,
                  padding: EdgeInsets.only(left: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: mediumblack,
                      onSurface: white,
                      elevation: 0
                    ),
                      onPressed: () => {
                        /*Navigator.pop(context)*/
                      },
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back_ios, color: white),
                          Text("Close",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Nunito Sans",
                            fontWeight: FontWeight.w100,
                            color: white
                          ),)
                        ],
                      ),
                  ),
                ),
                Container(
                  color: white,
                  width: size.width*0.7,
                  height: 60,
                  padding: EdgeInsets.only(right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomIconButton(icon: Icons.home, press: () => {/*Navigator.pop(context)*/}),
                      CustomIconButton(icon: Icons.favorite, press: () => {/*Navigator.pop(context)*/}),
                      CustomIconButton(icon: Icons.history, press: () => {/*Navigator.pop(context)*/}),
                      CustomIconButton(icon: Icons.shopping_cart, press: () => {/*Navigator.pop(context)*/}),
                      CustomIconButton(icon: Icons.settings, press: () => {/*Navigator.pop(context)*/}),
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  height: size.height,
                  width: size.width*0.3,
                  color: mediumblack,
                  alignment: Alignment.centerRight,
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Text("My Profile",
                    style: TextStyle(
                      fontFamily: 'Inria Serif',
                      fontSize: 80,
                      fontWeight: FontWeight.w800,
                      color: white
                    ),
                    ),
                  ),
                ),
                Container(
                  height: size.height,
                  width: size.width*0.7,
                  padding: EdgeInsets.symmetric(horizontal: size.width*0.1),
                  color: white,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundColor: mediumblack,
                        child: CircleAvatar(
                          radius: 65,
                           child: Icon(Icons.account_circle, size: 120)
                        )
                       /* imageUrl != null ? NetworkImage(imageUrl!) : null,
                        child: imageUrl == null
                            ? Icon(Icons.account_circle, size: 30)
                            : Container(),*/
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: RoundTextField(
                          preicon: Icon(Icons.person),
                          text: Text("firstname"),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: RoundTextField(
                          preicon: Icon(Icons.person),
                          text: Text("lastName"),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: RoundTextField(
                          preicon: Icon(Icons.alternate_email),
                          text: Text("email"),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: RoundTextField(
                          text: Text("birthday"),
                          preicon: Icon(Icons.cake),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: RoundTextField(
                          preicon: Icon(Icons.location_pin),
                          text: Text("location"),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      )
    );
  }
}
