import 'package:flutter/material.dart';
import 'package:tic_tak_toe_game/game_page.dart';
import 'package:tic_tak_toe_game/players.dart';

void main()
{
   runApp(MyGame());
}

class MyGame extends StatelessWidget {
  const MyGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: players(),
    );
  }
}
