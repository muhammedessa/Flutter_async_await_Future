import 'package:flutter/material.dart';
import 'package:API_Tutorial_Flutter/UI/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final String title='';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Future & Async',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}