import 'package:flutter/material.dart';
import 'package:flutter_wallpaper_app/MyHomePage.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Wallpaper App",
      home: MyHomePage(),

    );
  }
}
