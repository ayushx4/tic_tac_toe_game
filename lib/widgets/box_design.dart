import 'package:flutter/material.dart';
import 'package:ox_game/values/values.dart';

class Box extends StatefulWidget {
  VoidCallback? onTap;
  Image? childImage;
  Box({this.onTap, this.childImage});
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

        child: Container(
          height: Values.boxHeight,
          width: Values.boxWidth,
          decoration: BoxDecoration(
            color: Values.boxColor,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: widget.childImage,
        ),
      ),
    );
  }

  onMove(turn) {}
}
