import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../values/values.dart';

class Button extends StatefulWidget {
  String text;
  Color buttonColor;
  Color textColor;
  VoidCallback onPressed;

  Button({super.key, required this.text,required this.onPressed,required this.buttonColor,required this.textColor});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        child: Text(
          widget.text,
          style: TextStyle(
            color:widget.textColor ,
          )
        ),
        onPressed: widget.onPressed,
      color: widget.buttonColor,
    );

  }
}
