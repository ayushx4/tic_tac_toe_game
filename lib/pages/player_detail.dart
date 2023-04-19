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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Players detail"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: player1,
              ),
              SizedBox(height: 10,),
              TextField(
                controller: player2,
              ),
              SizedBox(height: 15,),
              Button(
                  text: "Play",
                  buttonColor: Values.blueButton,
                  textColor: Values.blackText,
                  onPressed: (){
                setState(() {
                  Values.player1=player1.text.trim();
                  Values.player2=player2.text.trim();
                  Values.turn="player1";
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
