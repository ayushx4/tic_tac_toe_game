import 'package:flutter/material.dart';
import 'package:ox_game/pages/player_detail.dart';
import 'package:ox_game/widgets/button.dart';

import '../values/values.dart';
import '../widgets/box_design.dart';

class GameRoom extends StatefulWidget {
  const GameRoom({Key? key}) : super(key: key);

  @override
  State<GameRoom> createState() => _GameRoomState();
}

class _GameRoomState extends State<GameRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Values.bgColor,
      body: SafeArea(
        child:Center(
          child: Column(
            children: [
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Button(
                        text:"Quit" ,
                        buttonColor: Values.redButton,
                        textColor: Values.blackText,
                        onPressed:(){
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context)=> PlayerDetail())
                          );
                        }
                    )
                  ],
                ),
              ),

              SizedBox(height: 150,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Box(),
                  Box(),
                  Box(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Box(),
                  Box(),
                  Box(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Box(),
                  Box(),
                  Box(),
                ],
              ),

            ],
          ),
        ) ,
      )
    );
  }

   Image playerMove(){
    if(Values.turn=="player1"){
      Values.turn="player2";
      return Image.asset("assets/images/circle.png");
    }else{
      Values.turn="player1";
      return Image.asset("assets/images/cross.png");
    }
  }

}


