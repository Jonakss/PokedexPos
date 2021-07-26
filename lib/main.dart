import 'package:flutter/material.dart';
import 'package:pokedex_pos/screens/home/homeScreen.dart';
//import 'package:pokedex_pos/screens/print_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex POS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      //Print(),
    );
  }
}
