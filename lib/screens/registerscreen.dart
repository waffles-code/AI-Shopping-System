import 'package:aishop/components/google_round_button.dart';
import 'package:aishop/components/or_divider.dart';
import 'package:aishop/components/round_button.dart';
import 'package:aishop/components/round_passwordfield.dart';
import 'package:aishop/components/round_textfield.dart';
import 'package:aishop/components/sidepanel.dart';
import 'package:aishop/components/textlink.dart';
import 'package:aishop/components/title.dart';
import 'package:aishop/screens/loginscreen.dart';
import 'package:aishop/utils/authentication.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../theme.dart';
import 'package:line_icons/line_icons.dart';

import 'homepage.dart';


class RegisterScreen extends StatefulWidget {

	@override
	State<StatefulWidget> createState() {
		return _RegisterScreenState();
	}
}

//ignore: must_be_immutable
class _RegisterScreenState extends State <RegisterScreen>{

	late TextEditingController userEmailController;
	late FocusNode textFocusNodeEmail = FocusNode();
	bool _isEditingEmail = false;

	late TextEditingController userPasswordController;
	late FocusNode textFocusNodePassword = FocusNode();
	bool _isEditingpassword = false;

	String loginStatus = "";
	late Color loginStringColor;

	late TextEditingController userConfirmPasswordController;
	late FocusNode textFocusNodeConfirmPassword = FocusNode();

	late TextEditingController userFirstNameController;
	late FocusNode textFocusNodeFirstName = FocusNode();

	late TextEditingController userLastNameController;
	late FocusNode textFocusNodeLastName = FocusNode();

	late TextEditingController userBirthdayController;
	late FocusNode textFocusNodeBirthday = FocusNode();

	late TextEditingController userLocationController;
	late FocusNode textFocusNodeLocation = FocusNode();

	@override
	void initState() {
		userEmailController = TextEditingController();
		userEmailController.text = '';

		userPasswordController = TextEditingController();
		userPasswordController.text = '';

		userConfirmPasswordController = TextEditingController();
		userFirstNameController = TextEditingController();
		userLastNameController = TextEditingController();
		userBirthdayController = TextEditingController();
		userLocationController = TextEditingController();

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

	String? _checkRepeatedPassword(String value) {
		value = value.trim();

		if (userConfirmPasswordController.text.isNotEmpty) {
			if (value.isEmpty) {
				return 'Please repeat password';
			} else if (userConfirmPasswordController.text != userPasswordController.text) {
				return 'Passwords do not match';
			}
		}
		return null;
	}

	@override
	Widget build(BuildContext context) {
		Size size = MediaQuery.of(context).size;
		// TODO: implement build
		return new Scaffold(
				body: Container(
						width: size.width,
						height:size.height,
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
													padding: EdgeInsets.all(60),
													decoration:
													BoxDecoration( color: white),
													child:
													Column(
															mainAxisAlignment: MainAxisAlignment.spaceBetween,
															children:<Widget>[
																//=============================================
																//heading Signup
																PageTitle(
																		text: "SIGNUP"
																),
																//=============================================

																Row(
																		mainAxisAlignment: MainAxisAlignment.spaceBetween,
																		//====================================================================================row
																		children:[
																			Expanded(
																					child: RoundTextField(
																						preicon: Icon(LineIcons.user),
																						margin: EdgeInsets.fromLTRB(0,0,10,0),
																						control: userFirstNameController,
																						text: "First Name",
																						focusNode: textFocusNodeFirstName,
																						onSubmitted:(value){
																							textFocusNodeFirstName.unfocus();
																							FocusScope.of(context).requestFocus(textFocusNodeLastName);
																						},
																					)
																			),
																			//====================================================================================row
																			Expanded(
																					child: RoundTextField(
																						preicon: Icon(LineIcons.user),
																						margin: EdgeInsets.fromLTRB(10,0,0,0),
																						control: userLastNameController,
																						text: "Last Name",
																						focusNode: textFocusNodeLastName,
																						onSubmitted:(value){
																							textFocusNodeLastName.unfocus();
																							FocusScope.of(context).requestFocus(textFocusNodeEmail);
																						},
																					)
																			)
																		]
																	//====================================================================================rowEnded
																),
																Row(
																		mainAxisAlignment: MainAxisAlignment.spaceBetween,
																		//====================================================================================row
																		children:<Widget>[
																			Expanded(
																					flex:2,
																					child: RoundTextField(
																						preicon: Icon(LineIcons.at),
																						margin: EdgeInsets.fromLTRB(0,0,10,0),
																						focusNode: textFocusNodeEmail,
																						keyboardType: TextInputType.emailAddress,
																						textInputAction: TextInputAction.next,
																						control: userEmailController,
																						text: "Email",
																						autofocus: false,
																						onChanged: (value){
																							setState(() {
																								_isEditingEmail = true;
																							});
																						},
																						onSubmitted:(value){
																							textFocusNodeEmail.unfocus();
																							FocusScope.of(context).requestFocus(textFocusNodeBirthday);
																						},
																						errorText: _isEditingEmail
																								? _validateEmail(userEmailController.text)
																								: null,
																						errorstyle: TextStyle(
																								color: Colors.redAccent
																						),
																					)
																			),
																			//====================================================================================row
																			Expanded(
																					flex: 1,
																					child:RoundTextField(
																						focusNode: textFocusNodeBirthday,
																							onSubmitted:(value){
																								textFocusNodeBirthday.unfocus();
																								FocusScope.of(context).requestFocus(textFocusNodePassword);
																							},
																							preicon: Icon(LineIcons.birthdayCake),
																							margin: EdgeInsets.fromLTRB(10,0,0,0),
																							control: userBirthdayController,
																							text: "Birthday",
																							tap: () =>
																							{
																								FocusScope.of(context).unfocus(),
																								showDatePicker(
																									context: context,
																									initialDate: DateTime.now(),
																									firstDate: DateTime(DateTime.now().year - 100, 01),
																									lastDate: DateTime.now(),
																									builder:  (BuildContext context, picker){
																											return Theme(
																												//TODO: change colors
																												data: ThemeData.dark().copyWith(
																													colorScheme: ColorScheme.dark(
																														primary: lightgrey, //highlighter
																														onPrimary: black, //text highlighted
																														surface: mediumblack,
																														onSurface: white,
																													),
																													dialogBackgroundColor:lightblack,
																												),
																												child: (picker)!);
																										})
																										.then((pickedDate) {
																									if(pickedDate!=null) {
																										String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
																										userBirthdayController.text =
																												formattedDate;
																									}
																								})
																							}
																					)
																			)
																		]
																	//====================================================================================rowEnded
																),
																Row(
																		mainAxisAlignment: MainAxisAlignment.spaceBetween,
																		//====================================================================================row
																		children:<Widget>[
																			Expanded(
																					child: RoundPasswordField(
																						icon: Icon(LineIcons.key),
																						margin: EdgeInsets.fromLTRB(0,0,10,0),
																						text: "Password",
																						control: userPasswordController,
																						focusNode: textFocusNodePassword,
																						onSubmitted:(value){
																							textFocusNodePassword.unfocus();
																							FocusScope.of(context).requestFocus(textFocusNodeConfirmPassword);
																						},
																						onChanged: (value){
																							setState(() {
																								_isEditingpassword = true;
																							});
																						},
																						errorText: _isEditingpassword
																								? _validatePassword(userPasswordController.text)
																								: null,
																						errorstyle: TextStyle(
																								color: Colors.redAccent
																						),
																					)
																			),
																			//====================================================================================row
																			Expanded(
																					child:RoundPasswordField(
																						icon: Icon(LineIcons.key),
																						margin: EdgeInsets.fromLTRB(10,0,0,0),
																						text: "Password",
																						control: userConfirmPasswordController,
																						focusNode: textFocusNodeConfirmPassword,
																						onSubmitted:(value){
																							textFocusNodeConfirmPassword.unfocus();
																							FocusScope.of(context).requestFocus(textFocusNodeLocation);
																						},
																						errorText: _isEditingpassword
																								? _checkRepeatedPassword(userConfirmPasswordController.text)
																								: null,
																						errorstyle: TextStyle(
																								color: Colors.redAccent
																						),
																					)
																			)
																		]
																),
																//==================================================
																//location
																RoundTextField(
																	text: "Location",
																	focusNode: textFocusNodeLocation,
																	control: userLocationController,
																	preicon: Icon(LineIcons.mapMarker),
																	suficon: IconButton(
																		icon: Icon(LineIcons.searchLocation), onPressed: () {  },
																	),
																),

																//=============================================
																//login button
																RoundButton(
																		text: "SIGNUP",
																	press: () async {
																		await registerWithEmailPassword(
																				userEmailController.text,
																				userPasswordController.text
																		).then((result) {
																			if (result != null) {
																				setState(() {
																					loginStatus =
																					'You have registered successfully';
																					loginStringColor = Colors.green;
																					Navigator.push(context, new MaterialPageRoute(builder: (context) => HomePage()));
																				});
																				print(result);
																			}
																		}).catchError((error) {
																			print('Registering Error: $error');
																			setState(() {
																				loginStatus =
																				'Error occured while Registering';

																				Navigator.push(context, new MaterialPageRoute(builder: (context) => RegisterScreen()));
																				loginStringColor = Colors.red;
																			});
																		});
																	},
																),
																//=================================================================
																//or dividers
																OrDivider(),
																//==========================================
																//Google sign in button
																GoogleRoundButton(),
																//=============================================
																// Already registered button => take user to login page
																TextLink(
																		align: Alignment.center,
																		text: 'Already have an account? Login here.',
																		press: () => {
																			Navigator.push(context, new MaterialPageRoute(builder: (context) => LoginScreen()))
																		}
																)
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

//=============================================
