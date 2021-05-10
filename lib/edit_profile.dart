import 'package:aishop/settings.dart';
import 'package:aishop/theme.dart';
import 'package:aishop/components/icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'components/round_textfield.dart';


class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(size);
    return new Scaffold(
        body: Container(
          color: mediumblack,
          width: size.width,
          height: size.height,
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    height: 60,
                    width: size.width*0.3,
                    color: mediumblack,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: mediumblack,
                          onSurface: white,
                          elevation: 0
                      ),
                      onPressed: () => {
                        Navigator.pop(context)
                      },
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.arrow_back_ios, color: white),
                          Text("Close",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Nunito Sans',
                                fontWeight: FontWeight.w100,
                                color: white
                            ),
                          )
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
                      children: <Widget>[
                        CustomIconButton(icon: Icons.home, press: () => {Navigator.pop(context)}),
                        CustomIconButton(icon: Icons.favorite, press: () => {}),
                        CustomIconButton(icon: Icons.history, press: () => {}),
                        CustomIconButton(icon: Icons.shopping_cart, press: () => {}),
                        CustomIconButton(icon: Icons.settings, press: () => {Navigator.pop(context),
                          Navigator.push(context, new MaterialPageRoute(builder: (context) => SettingsPage()))}),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    height: size.height-60,
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
                    height: size.height-60,
                    width: size.width*0.7,
                    padding: EdgeInsets.symmetric(horizontal: size.width*0.1),
                    color: white,
                    child: ListView(
                        children: [
                          Column(
                            children: <Widget>[
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
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15.0),
                                child: RoundTextField(
                                  autofocus: false,
                                  preicon: Icon(Icons.alternate_email),
                                  text: "email",
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15.0),
                                child: RoundTextField(
                                  autofocus: false,
                                  text: "fname",
                                  preicon: Icon(Icons.person),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15.0),
                                child: RoundTextField(
                                  autofocus: false,
                                  preicon: Icon(Icons.person),
                                  text: "lname",
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15.0),
                                child: RoundTextField(
                                  autofocus: false,
                                  text: "birthday",
                                  preicon: Icon(Icons.cake),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15.0),
                                child: RoundTextField(
                                  autofocus: false,
                                  preicon: Icon(Icons.location_pin),
                                  text: "location",
                                ),
                              )
                            ],
                          ),
                        ]
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

