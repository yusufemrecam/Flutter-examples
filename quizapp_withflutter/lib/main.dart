import 'package:flutter/material.dart';
import 'package:quizapp_withflutter/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Uygulaması',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.orangeAccent,
      ),
      home: Home(),
    );
  }
}


