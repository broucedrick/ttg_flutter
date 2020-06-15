import 'package:flutter/material.dart';
import 'package:trouvetongab/screen/progressView.dart';
import './screen/home.dart';
import './screen/intro_slide.dart';
import './screen/splash.dart';



void main() {
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Trouve Ton GAB',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Splash(),
    );
  }
}