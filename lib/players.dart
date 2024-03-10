import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tak_toe_game/game_page.dart';

class players extends StatefulWidget {
  const players({super.key});

  @override
  State<players> createState() => _playersState();
}

class _playersState extends State<players> {

  TextEditingController player1 = TextEditingController();
  TextEditingController player2 = TextEditingController();
  var fromkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            Text("Enter Players Names" ,
            style: GoogleFonts.alegreya(
                textStyle : TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  wordSpacing: 2.0,
                  letterSpacing: 1.0,
                ),
              ),
            ),

            //form for players namds
            Container(
              width: 320.0,
              child: Form(
                 key: fromkey,
                  child: Column(
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(
                          top: 40.0,
                        ),
                        child: TextFormField(
                           decoration: InputDecoration(
                             border: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(10.0),
                               borderSide: BorderSide(color: Colors.black),
                             ),
                             focusedBorder: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(10.0),
                               borderSide: BorderSide(color: Colors.black),
                             ),
                             label: Text("Enter First PLayer Name")
                           ),
                          controller: player1,
                          validator: (value) {
                            if(value!.isEmpty)
                              {
                                 return "Enter Player Name";
                              }
                          },
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.only(
                            top: 24.0 , bottom: 24.0,
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              label: Text("Enter Second PLayer Name")
                          ),
                          controller: player2,
                          validator: (value) {
                            if(value!.isEmpty)
                            {
                              return "Enter Player Name";
                            }
                          },
                        ),
                      ),

                      SizedBox(height: 20.0,),

                      //play button
                      InkWell(
                        onTap: (){
                          if(fromkey.currentState!.validate())
                          {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => game_page(player1: player1.text.toString(), player2: player2.text.toString(),),
                                )
                            );
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.black,
                          ),
                          width: 130.0,
                          height: 40.0,
                          child: Center(
                            child: Text("Play" ,
                              style: GoogleFonts.alegreya(
                                textStyle : TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
              ),
            ),
            
          ],
        ),
      ),

    );
  }
}
