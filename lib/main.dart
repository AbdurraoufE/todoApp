import 'package:flutter/material.dart';
import 'package:todo_app1/screens/home.dart';
// import 'package:flutter/flutter_todo_app1/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //this widget is the root of the app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Todo App",
      home: Home(),
    ); // MaterialApp
  }
}