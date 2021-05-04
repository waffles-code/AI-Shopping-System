
import 'package:aishop/screens/loginscreen.dart';
import 'package:aishop/utils/authentication.dart';
import 'package:flutter/material.dart';

import 'screens/checkout.dart';
import 'screens/loginscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp>{

  void initState() {
    getUserInfo();
    super.initState();
  }
//check if user is already logged in in the previous session.
  //get user info if logged in.
  Future getUserInfo() async {
    await getUser();
    setState(() {
    });
    print(uid);
  }

  //remove debug banner in the corner
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}