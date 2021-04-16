
import 'package:aishop/screens/loginscreen.dart';
import 'package:aishop/utils/authentication.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }


  }

  class _MyAppState extends State<MyApp>{

    void initState() {
      getUserInfo();
      super.initState();
    }

    Future getUserInfo() async {
      await getUser();
      setState(() {
        //Navigator.push(context, new MaterialPageRoute(builder: (context) => HomePage()));
      });
      print(uid);
    }

    @override
    Widget build(BuildContext context) {
      return  MaterialApp(home: LoginScreen(),
        debugShowCheckedModeBanner: false,
      );
    }
  }