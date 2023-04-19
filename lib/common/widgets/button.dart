import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  String text;
  String? fontFamily;
  Color? buttonColor;
  Color? textColor;
  double? height;
  double? width;
  double? borderRadius;
  double? fontSize;
  FontWeight? fontWeight;
  VoidCallback onPressed;

  Button({super.key,
    required this.text,
    required this.onPressed,
    this.buttonColor,
    this.textColor,
    this.width,
    this.height,
    this.borderRadius,
    this.fontFamily,
    this.fontWeight,
    this.fontSize
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return     InkWell(
      onTap: widget.onPressed,
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: widget.buttonColor,
          borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius ?? 17)),
        ),
        child: Center(
            child: Text(
              widget.text,
              style:TextStyle(
                fontFamily: widget.fontFamily,
                fontWeight: widget.fontWeight,
                fontSize: widget.fontSize,
              ),)
        ),
      ),
    );



  }
}
