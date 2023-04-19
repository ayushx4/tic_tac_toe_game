import 'package:flutter/material.dart';

import '../constants/values.dart';

class Box extends StatefulWidget {
  VoidCallback onTap;
  int boxNumber;
  Box({required this.onTap,required this.boxNumber});
  @override
  State<StatefulWidget> createState() => BoxState();
}

class BoxState extends State<Box> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: widget.onTap,


        child: (Values.boxDetail[widget.boxNumber]=="0") ? Container(
          height: Values.boxHeight,
          width: Values.boxWidth,
          decoration: BoxDecoration(
            color: Values.boxColor,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ) :
        Container(
          height: Values.boxHeight,
          width: Values.boxWidth,
          decoration: BoxDecoration(
            color: Values.boxColor,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Image.asset(Values.boxDetail[widget.boxNumber],color: Colors.indigo[100]),
        )
      ),
    );
  }


}
