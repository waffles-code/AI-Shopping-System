import 'dart:async';

import 'package:aishop/screens/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class VerifyScreen extends StatefulWidget {
  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final auth = FirebaseAuth.instance;
  late User user;
  late Timer timer;

  @override
  void initState() {
    user = auth.currentUser!;
    user.sendEmailVerification();

    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      checkVerification();
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.black,
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 40.0,
            color: Colors.white
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              WavyAnimatedText('Please check email for verification link'),

            ],
            isRepeatingAnimation: true,
            onTap: () {
              print("Tap Event");
            },
          ),
        ),
      ),
    );
  }

  Future<void> checkVerification() async {
    user = auth.currentUser!;
    await user.reload();
    if (user.emailVerified) {
      timer.cancel();
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) =>
                  HomePage()));
    }
  }
}