import 'package:flutter/material.dart';

//
class CustomIconButton extends StatelessWidget {
  final icon;
  final press;

  const CustomIconButton({
    Key? key,
    this.press,
    this.icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        width: 70,

        child: IconButton(
            icon:  Icon(
              icon, size: 30,
            ),
            onPressed: press,
        )
    );
  }
}