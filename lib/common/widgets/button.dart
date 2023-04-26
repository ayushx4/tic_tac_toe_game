import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';



class Button extends StatefulWidget {

  //this is use as button as well TextField

  String? text;
  String? fontFamily;
  Color? buttonColor;
  Color? textColor;
  double? height;
  double? width;
  double? borderRadius;
  double? fontSize;
  FontWeight? fontWeight;
  VoidCallback? onPressed;
  bool isTextField;
  TextEditingController? textEditingController;


  Button({super.key,
    required this.isTextField,
    this.textEditingController,
    this.text,
    this.onPressed,
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

  bool isPressed =false;


  @override
  Widget build(BuildContext context) {
    double blurRadius= isPressed ? 0.5 : 5.0;
    Offset distance =isPressed ? Offset(2, 2) : Offset(4, 4);

    return     Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(

        onTap: widget.onPressed,

        child: Listener(
          //when we press
          onPointerDown: (_)=>setState(() {isPressed=true;}),
          //when we release
          onPointerUp: (_)=>setState(() {isPressed=false;}),

          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            height: widget.height,
            width: widget.width,
            decoration: BoxDecoration(
                color: widget.buttonColor,
                borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius ?? 17)),
                boxShadow: [
                  BoxShadow(
                    blurRadius: blurRadius,
                    offset: -distance,
                    color: Colors.indigo.shade800,
                    inset :isPressed,
                  ),
                  BoxShadow(
                    blurRadius: blurRadius,
                    offset: distance,
                    color: Colors.black87,
                    inset : isPressed,
                  ),
                ]
            ),

            child: (widget.isTextField) ?
            TextField(

              decoration: InputDecoration(
                hintText: "Enter player name"
              ),
              controller: widget.textEditingController,
            ) :

            Center(
                child: Text(
                  widget.text!,
                  style:TextStyle(
                    fontFamily: widget.fontFamily,
                    fontWeight: widget.fontWeight,
                    fontSize: widget.fontSize,
                  ),)
            ),
          ),
        ),
      ),
    );



  }
}


///////
