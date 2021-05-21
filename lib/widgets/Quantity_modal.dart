import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aishop/utils/cart.dart';
import 'package:flutter/services.dart';
import 'package:aishop/screens/checkout.dart';

import '../theme.dart';

//model for modal pop up
//displays image , price, name, description



Future<String?> QModal(context ) {

  TextEditingController customController = TextEditingController(

  );

  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Enter Quantity"),
          content: TextField(
              controller: customController,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ]
          ),
          actions: <Widget>[
            MaterialButton(
              elevation: 5.0,
              child: Text('Submit'),
              onPressed: (){
                Navigator.of(context).pop(customController.text.toString());
              },
            )
          ],
        );

      });
}
