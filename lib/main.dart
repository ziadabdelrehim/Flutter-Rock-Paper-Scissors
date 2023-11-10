import 'package:flutter/material.dart';
import 'package:rsp_game/game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rock,Scissor,Paper',
      debugShowCheckedModeBanner: false,
      home: MyGame(),
    );
  }
}
