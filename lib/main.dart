import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tictactoe/screens/first.dart';
import 'package:tictactoe/screens/game.dart';
import 'package:tictactoe/screens/result.dart';
import 'package:tictactoe/screens/side.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white, // navigation bar color
    statusBarColor: Colors.white, // status bar color
    statusBarIconBrightness: Brightness.dark, // status bar icons' color
    systemNavigationBarIconBrightness:
        Brightness.dark, //navigation bar icons' color
  ));
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => First(),
        '/side': (context) => Side(),
        '/game': (context) => Game(),
        '/result': (context) => Result(),
      },
    ),
  );
}
