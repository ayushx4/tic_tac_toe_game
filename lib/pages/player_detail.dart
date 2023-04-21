import 'package:flutter/material.dart';
import 'package:ox_game/pages/game_room.dart';
import '../common/constants/values.dart';
import '../common/widgets/button.dart';

class PlayerDetail extends StatefulWidget {
  const PlayerDetail({Key? key}) : super(key: key);

  @override
  State<PlayerDetail> createState() => _PlayerDetailState();
}

class _PlayerDetailState extends State<PlayerDetail> {

  var player1 =TextEditingController();
  var player2=TextEditingController();

 @override
  void setState(VoidCallback fn) {
   Values.boxDetail = [
     "0","0","0",
     "0","0","0",
     "0","0","0",
   ];
   Values.winner=null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Values.bgColor,
      // appBar: AppBar(
      //   title: Text("Players detail"),
      // ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: player1,
              ),
              SizedBox(height: 15,),
              TextField(
                controller: player2,
              ),
              SizedBox(height: 40,),
              Button(
                  text: "Play",
                  buttonColor: Colors.white,
                  textColor: Values.blackText,
                  onPressed: (){
                setState(() {
                  Values.player1=player1.text.trim();
                  Values.player2=player2.text.trim();
                  Values.turn=Values.player1;
                });
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context)=>GameRoom(
                      player1: player1.text.trim(),
                      player2: player2.text.trim(),
                    ))
                );
              },
                width: 80,
                height: 50,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
