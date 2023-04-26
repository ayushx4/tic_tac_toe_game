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

  TextEditingController player1 =TextEditingController();
  TextEditingController player2=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Values.player1="player1";
    Values.player2="player2";
    Values.turn=Values.player1;

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
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Image(image: AssetImage(
                  "assets/images/tictactoeLogo.png"
              ),
                height: 80,
              ),

              SizedBox(height: 40,),

              Button(
                isTextField: true,
                textEditingController:player1,
              ),
              SizedBox(height: 15,),
              Button(
                isTextField: true,
                textEditingController:player2,
              ),
              SizedBox(height: 40,),
              Button(
                isTextField: false,
                  text: "Play",
                  buttonColor: Colors.white,
                  textColor: Values.blackText,
                  onPressed: (){
                    Values.player1 = player1.text.trim() ?? "player1" ;
                    Values.player2 = player2.text.trim() ?? "player2" ;
                    Values.turn = Values.player1;


                // Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(builder: (context)=>GameRoom(
                //       // player1: Values.player1,
                //       // player2: Values.player2,
                //     ))
                // );
                    Navigator.of(context).pushReplacement(
                      PageRouteBuilder(
                          pageBuilder: (context,aniation,_){
                            return GameRoom();
                          }

                    ));
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
