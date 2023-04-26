import 'package:flutter/material.dart';

class NameInput extends StatefulWidget {

  TextEditingController textEditingController;

  NameInput({
    required this.textEditingController,
  });


  @override
  State<NameInput> createState() => _NameInputState();
}

class _NameInputState extends State<NameInput> {



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color:
      ),
      child: TextField(
        controller: widget.textEditingController,
      ),
    );
  }
}
