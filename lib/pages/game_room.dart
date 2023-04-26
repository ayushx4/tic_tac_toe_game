import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ox_game/common/widgets/name_plate.dart';
import 'package:ox_game/pages/player_detail.dart';
import '../common/constants/values.dart';
import '../common/widgets/box_design.dart';
import '../common/widgets/button.dart';

class GameRoom extends StatefulWidget {
  // String player1;
  // String player2;
  // GameRoom({required this.player1, required this.player2});

  @override
  State<GameRoom> createState() => _GameRoomState();

}

class _GameRoomState extends State<GameRoom> {


  String circleImage = "assets/images/circle.png";
  String crossImage = "assets/images/cross.png";

  @override
  void initState() {
    // TODO: implement initState
    if(Values.player1=="") Values.player1="player1";
    if(Values.player2=="") Values.player2="player2";
  }



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Values.bgColor,
      body:TweenAnimationBuilder()
    );
  }




   playerMove(int boxNumber){
    return Values.boxDetail[boxNumber]=="0" ? (){
      setState(() {
        if(Values.winner==null){
          if(Values.turn==Values.player2){
            Values.boxDetail[boxNumber]="assets/images/cross.png";
            winCondition(crossImage);
            Values.turn=Values.player1;
          } else{
            Values.boxDetail[boxNumber]="assets/images/circle.png";
            winCondition(circleImage);
            Values.turn=Values.player2;
          }
        }

      });
    } :

    (){

    };
   }

    winCondition(String move){

    if( ( Values.boxDetail[0]==move && Values.boxDetail[1]==move && Values.boxDetail[2]==move ) ||
        ( Values.boxDetail[3]==move && Values.boxDetail[4]==move && Values.boxDetail[5]==move ) ||
        ( Values.boxDetail[6]==move && Values.boxDetail[7]==move && Values.boxDetail[8]==move ) ||
        ( Values.boxDetail[0]==move && Values.boxDetail[3]==move && Values.boxDetail[6]==move ) ||
        ( Values.boxDetail[1]==move && Values.boxDetail[4]==move && Values.boxDetail[7]==move ) ||
        ( Values.boxDetail[2]==move && Values.boxDetail[5]==move && Values.boxDetail[8]==move ) ||
        ( Values.boxDetail[0]==move && Values.boxDetail[4]==move && Values.boxDetail[8]==move ) ||
        ( Values.boxDetail[2]==move && Values.boxDetail[4]==move && Values.boxDetail[6]==move )
    ){
      Values.winner= Values.turn;
      AlertDialog dialog=AlertDialog(
        backgroundColor: Values.bgColor,
        title: Center(
            child: Text(
              "Winner!!",
              style: TextStyle(
                  color: Colors.yellowAccent,
                fontFamily: "LilitaOne"
              ),
            )),
        content: Wrap(
          children: [
            Center(
              child: Text(
                Values.winner.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "ModernAntiqua-Regular.ttf"
                ),),
            )
          ],
        )
        ,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Button(
                isTextField: false,
                text: "Rematch",
                onPressed: reMatch(),
                buttonColor: Colors.blue,
                textColor: Values.blackText,
                width: 80,
                height: 50,
              ),

              Button(
                isTextField: false,
                text: "New Game",
                onPressed: newGame(),
                buttonColor: Colors.green,
                textColor: Values.blackText,
                width: 80,
                height: 50,
              ),
            ],
          )        ],

      );

      return showDialog(
          barrierDismissible: false,
          context: context, builder: (BuildContext context){
        return dialog;
      });

    }
   }

    VoidCallback newGame() {
    return () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PlayerDetail()),
      );
    };
   }

  VoidCallback reMatch() {
    return () {
      setState(() {

        Values.turn=Values.player1;
        Values.winner=null;

        Values.boxDetail = [
          "0","0","0",
          "0","0","0",
          "0","0","0",
        ];

        Navigator.pop(context);
      });
    };
  }



}


