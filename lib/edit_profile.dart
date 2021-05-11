import 'package:aishop/settings.dart';
import 'package:aishop/theme.dart';
import 'package:aishop/components/icon_button.dart';
import 'package:aishop/utils/authentication.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'components/round_textfield.dart';

class EditProfilePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _EditProfilePage();
  }
}

class _EditProfilePage extends State<EditProfilePage> {

  Future getUserInfofromdb() async {

    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    CollectionReference _collectionReference = _firestore.collection("Users");
    DocumentReference _documentReference = _collectionReference.doc(uid);

    _documentReference.get().then((documentSnapshot) => {
      if(!documentSnapshot.exists){
        print("Sorry, User profile not found."),
      }
      else{
        print("Collected: "+documentSnapshot.data().toString()),
        setState((){
          userFirstNameController.text = documentSnapshot.get("fname");
          userLastNameController.text = documentSnapshot.get("lname");
          userEmailController.text = documentSnapshot.get("email");
          userBirthdayController.text = documentSnapshot.get("bday");
          userLocationController.text = documentSnapshot.get("location");
        }
        )
      }
    });
  }

  late TextEditingController userEmailController = TextEditingController();
  late TextEditingController userFirstNameController = TextEditingController();
  late TextEditingController userLastNameController = TextEditingController();
  late TextEditingController userBirthdayController = TextEditingController();
  late TextEditingController userLocationController = TextEditingController();

  void initState() {

    getUserInfofromdb();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

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
                                  backgroundImage:
                                  imageUrl != null ? NetworkImage(imageUrl!) : null,
                                  child: imageUrl == null
                                      ? Icon(Icons.account_circle, size: 120)
                                      : Container(),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15.0),
                                child: RoundTextField(
                                  autofocus: false,
                                  preicon: Icon(Icons.alternate_email),
                                  text: "Email",
                                  control: userEmailController,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15.0),
                                child: RoundTextField(
                                  autofocus: false,
                                  text: "First Name",
                                  preicon: Icon(Icons.person),
                                  control: userFirstNameController
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15.0),
                                child: RoundTextField(
                                  autofocus: false,
                                  preicon: Icon(Icons.person),
                                  text:  "Last Name",
                                  control: userLastNameController
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15.0),
                                child: RoundTextField(
                                  autofocus: false,
                                  text: "Birthday",
                                  preicon: Icon(Icons.cake),
                                  control: userBirthdayController
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15.0),
                                child: RoundTextField(
                                  autofocus: false,
                                  preicon: Icon(Icons.location_pin),
                                  text: "Location",
                                  control: userLocationController,
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

