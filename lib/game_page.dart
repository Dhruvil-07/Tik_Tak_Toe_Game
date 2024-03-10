import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class game_page extends StatefulWidget {
  game_page({required this.player1 , required this.player2 , super.key});

  String player1 , player2 ;

  @override
  State<game_page> createState() => _game_pageState();
}

class _game_pageState extends State<game_page> {


  Color baseColor = Color(0xFFF2F2F2);

  String turn = "x";
  List<String> values = ["*" , "*" , "*" , "*" , "*" , "*" , "*" , "*" , "*" ];
  List<int> highlightIndex = [];
  int counter = 0;
  String win = "";
  int player1_point = 0;
  int player2_point = 0;


  //method for put value
  void set_value(int index)
  {
    
    if(values[index] == "*")
    {
        values[index] = turn;
        counter++;

        turn == "x" ? turn="0" : turn = "x";

        //check for win
        if(counter>=4 && counter<=8)
        {
           winnner();
        }
        //check for draw
        else if(counter == 9)
        {
           show_snakbar("Match Draw");
        }
    }
    else
    {
       show_snakbar("Value is already there",Colors.red);
    }

     setState(() {});
  }

  //check places
  bool check_places(p1,p2,p3)
  {
     if( (values[p1]==values[p2]) && (values[p2] == values[p3]) && (values[p1]!="*") )
     {
         win = values[p1];
         highlightIndex.addAll([p1,p2,p3]);
         return true;
     }
     else
     {
       return false;
     }
  }


  //get winner
  void winnner() {
    if (check_places(0, 1, 2) || check_places(3, 4, 5) || check_places(6, 7, 8)) {
        //call increase point method
        point_increase();
    }
    else if (check_places(0, 3, 6) || check_places(1, 4, 7) || check_places(2, 5, 8))
    {
       //call increase point method
        point_increase();
    }
    else if( check_places(0,4,8) || check_places(2,4,6) )
    {
      //call increase point method
      point_increase();
    }

  }


  //increase point
  void point_increase() {
    win == "x" ? player1_point++ : player2_point++;
    show_snakbar("${win == "x" ? widget.player1 : widget.player2} Win");
  }

  //reset method
  void reset()
  {
     for(int i = 0 ; i<values.length ; i++)
     {
        values[i] = "*";
     }
     highlightIndex.clear();
     counter = 0;
     win = "";
     turn = "x";

     setState(() {});
  }


  //show snak bar
  void show_snakbar(String msg , [Color? color])
  {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Center( child: Text(msg,
        style: GoogleFonts.alegreya(
          textStyle : TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      ) ,
        backgroundColor: color == null ? Colors.black : color,
        padding: EdgeInsets.all(12.0),
        duration: Duration(seconds: 1),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(

      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [

            //tic tak toe title
            SizedBox(height: 80,),

            Text("TIC TAK TOE",
              style: GoogleFonts.alegreya(
                textStyle : TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  wordSpacing: 4,
                ),
              ),
             ),


            SizedBox(height: 40,),

            //plaers name
            Container(
              width: 300.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Text("${widget.player1}",
                    style: GoogleFonts.alegreya(
                      textStyle : TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        wordSpacing: 2,
                      ),
                    )
                  ),

                  SizedBox(width: 50.0,),

                  Text("${widget.player2}",
                      style: GoogleFonts.alegreya(
                        textStyle : TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          wordSpacing: 2,
                        ),
                      )
                  ),


                ],
              ),
            ),

            SizedBox(height: 10,),

            //players point
            Container(
              width: 300.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Text("x Win : ${player1_point}",
                      style: GoogleFonts.alegreya(
                        textStyle : TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          wordSpacing: 2,
                        ),
                      ),
                  ),

                  SizedBox(width: 50.0,),

                  Text("0 Win : ${player2_point}",
                      style: GoogleFonts.alegreya(
                        textStyle : TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          wordSpacing: 2,
                        ),
                      )
                  ),


                ],
              ),
            ),



            SizedBox(height: 10.0,),


            //grid view
            Container(
              height: height*0.50,
              width: width,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.builder(
                   shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                    ),
                    itemCount: 9,
                    itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: InkWell(
                          onTap: (){
                            if(win == "")
                            {
                              set_value(index);
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 50,
                            width: 50,
                            child:Center(
                                child: ClayContainer(
                                    color: baseColor,
                                    borderRadius: 10,
                                    child: Stack(
                                      children: [
                                        Center(child: Text('${values[index]}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28),)),
                                        highlightIndex.contains(index)?SpinKitCircle(color: Colors.redAccent,):Container()
                                      ],
                                    )),
                            ),
                          ),
                        ),
                      );
                    },
                ),
              ),
            ),

            SizedBox(height: 50.0,),

            //play again button
            InkWell(
              onTap: (){
                reset();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.black,
                ),
                width: 150.0,
                height: 40.0,
                child: Center(
                  child: Text("Play Again" ,
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

    );
  }
}

