import 'package:aishop/components/google_round_button.dart';
import 'package:aishop/components/sidepanel.dart';
import 'package:aishop/components/textlink.dart';
import 'package:aishop/components/or_divider.dart';
import 'package:aishop/components/round_button.dart';
import 'package:aishop/components/round_passwordfield.dart';
import 'package:aishop/components/round_textfield.dart';
import 'package:aishop/components/title.dart';
import 'package:aishop/screens/homepage.dart';
import 'package:aishop/screens/registerscreen.dart';
import 'package:aishop/theme.dart';
import 'package:aishop/utils/authentication.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginScreenState();
  }
}

// ignore: must_be_immutable
class _LoginScreenState extends State <LoginScreen>{

  late TextEditingController userEmailController;
  late FocusNode textFocusNodeEmail;
  bool _isEditingEmail = false;

  late TextEditingController userPasswordController;
  late FocusNode textFocusNodePassword;
  bool _isEditingpassword = false;

  String loginStatus = "";
  late Color loginStringColor;

  @override
  void initState() {
    userEmailController = TextEditingController();
    userEmailController.text = '';
    textFocusNodeEmail = FocusNode();

    userPasswordController = TextEditingController();
    userPasswordController.text = '';
    textFocusNodePassword = FocusNode();

    super.initState();
  }

  String? _validateEmail(String value) {
    value = value.trim();

    if (userEmailController.text.isNotEmpty) {
      if (value.isEmpty) {
        return 'Email can\'t be empty';
      } else if (!value.contains(RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
        return 'Enter a correct email address';
      }
    }

    return null;
  }

  String? _validatePassword(String value) {
    value = value.trim();

    if (userPasswordController.text.isNotEmpty) {
      if (value.isEmpty) {
        return 'Please enter password';
      } else if (!value.contains(RegExp(
          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'))) {
        return 'Enter a valid password';
      }
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return
      new Scaffold(
          body:
          Container(
              width: size.width,
              height: size.height,
              color: lightblack,
              child:
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                    Expanded(
                        child: SidePanel()
                    ),
                    Expanded(
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width*0.1,
                                vertical: size.height*0.1
                            ),
                            decoration:
                            BoxDecoration( color: white),
                            child:
                            Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  //=============================================
                                  //heading login
                                  PageTitle(
                                    text: "LOGIN",
                                  ),
                                  //=============================================
                                  //Email text field
                                  RoundTextField(
                                    focusNode: textFocusNodeEmail,
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                    control: userEmailController,
                                    text: "Email",
                                    autofocus: false,
                                    preicon: Icon(LineIcons.user),
                                    onChanged: (value){
                                      setState(() {
                                        _isEditingEmail = true;
                                      });
                                    },
                                    onSubmitted:(value){
                                      textFocusNodeEmail.unfocus();
                                      //FocusScope.of(context).requestFocus(textFocusNodePassword);
                                    },
                                    errorText: _isEditingEmail
                                        ? _validateEmail(userEmailController.text): "",
                                    errorstyle: TextStyle(
                                        color: Colors.redAccent,
                                    ),
                                  ),
                                  //=============================================
                                  //Password text field
                                  RoundPasswordField(
                                      control: userPasswordController,
                                      text: "Password",
                                      icon: Icon(LineIcons.key),
                                    onChanged: (value){
                                      setState(() {
                                        _isEditingpassword = true;
                                      });
                                    },
                                    onSubmitted:(value){
                                      textFocusNodePassword.unfocus();
                                    },
                                    errorText: _isEditingpassword
                                        ? _validatePassword(userPasswordController.text)
                                        : "",
                                    errorstyle: TextStyle(
                                        color: Colors.redAccent
                                    ),
                                  ),
                                  //=============================================
                                  //login button
                                  RoundButton(
                                    text: "LOGIN",
                                    press: () async {
                                      await signInWithEmailPassword(
                                      userEmailController.text,
                                      userPasswordController.text
                                      ).then((result) {
                                        if (result != null) {
                                          setState(() {
                                            loginStatus =
                                            'You have signed in successfully';
                                            loginStringColor = Colors.green;
                                            Navigator.push(context, new MaterialPageRoute(builder: (context) => HomePage()));
                                          });
                                          print(result);
                                        }
                                      }).catchError((error) {
                                        print('Sign in Error: $error');
                                        setState(() {
                                          loginStatus =
                                          'Error occured while Signing in';
                                          Navigator.push(context, new MaterialPageRoute(builder: (context) => LoginScreen()));
                                          loginStringColor = Colors.red;
                                        });
                                      });
                                    },
                                  ),
                                  //=============================================
                                  TextLink(
                                      text: "Forgot Password?",
                                      align: Alignment.centerRight,
                                      press: () => {}
                                  ),
                                  //=========================================
                                  //or dividers
                                  OrDivider(),
                                  //==========================================
                                  //Google sign in button
                                  GoogleRoundButton(),
                                  //==========================================
                                  TextLink(
                                      text: "Not Registered?",
                                      align: Alignment.center,
                                      press: () => {
                                        Navigator.push(context, new MaterialPageRoute(builder: (context) => RegisterScreen()))
                                      }
                                  )
                                  //=====================================================
                                ]
                            )
                        )
                    )
                  ]
              )
          )
      );
  }
}
