import 'package:flutter/material.dart';

import '../constants/values.dart';

class NamePlate extends StatefulWidget {
  String name;
  String? fontFamily;
  Color? fontColor;
  double? fontSize;


  NamePlate({required this.name,this.fontSize,this.fontFamily,this.fontColor});
  @override
  State<NamePlate> createState() => _NamePlateState();
}

class _NamePlateState extends State<NamePlate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: (widget.name == Values.turn) ? Colors.indigo[100]!.withOpacity(0.5) : Colors.transparent ,
            borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      child: Text(
        widget.name,
        style: TextStyle(
            fontSize : widget.fontSize,
            fontFamily: widget.fontFamily,
            color: widget.fontColor,
        ),
      ),
    );
  }
}
