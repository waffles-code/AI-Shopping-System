import 'package:aishop/icons/icons.dart';
import 'package:aishop/screens/Adminloginscreen.dart';
import 'package:aishop/utils/authentication.dart';
import 'package:flutter/material.dart';
import 'package:aishop/addons/popup_menu_admin.dart';
import '../theme.dart';

void choiceAction(String choice) {
  if (choice == Constants.signout) {
    signOut().then((response) => {
          if (response == "User signed out")
            {
              showDialog(
                context: contxt,
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
                              builder: (BuildContext context) =>
                                  AdminLoginScreen()));
                        },
                      ),
                    ],
                  );
                },
              ),
            }
          else
            showDialog(
              context: contxt,
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
  }
}

BuildContext contxt = "" as BuildContext;

class MyAppBarAdmin extends AppBar {
  MyAppBarAdmin({Key? key, Widget? title, required BuildContext context})
      : super(key: key, title: title, backgroundColor: black, actions: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(5, 0, 20, 0),
            child: PopupMenuButton<String>(
              child: Center(
                  child: Icon(
                AIicons.signout,
                size: 30,
              )),
              itemBuilder: (context) {
                contxt = context;
                return Constants.choices.map((String choice) {
                  return PopupMenuItem<String>(
                    child: Text(choice),
                    value: choice,
                  );
                }).toList();
              },
              onSelected: choiceAction,
            ),
          ),
        ]);
}
