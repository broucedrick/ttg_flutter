import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trouvetongab/screen/intro_slide.dart';
import 'package:trouvetongab/screen/login.dart';

import 'home.dart';

class ProgressView extends StatefulWidget {
  @override
  _ProgressViewState createState() => _ProgressViewState();
}

class _ProgressViewState extends State<ProgressView> {

  @override
  void initState() {
    getIntro();
    super.initState();
  }

  void getIntro() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getBool("viewed"));
    if(prefs.getBool("viewed") == true){
      if(prefs.getString("email") != null){
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Home()));
      }else{
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Login()));
      }
    }else{
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => IntroSlide()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff303030),
      child: Center(
        child: Text("Chargement...", style: TextStyle(color: Colors.white, decoration: TextDecoration.none, fontSize: 16),),
      )
    );
  }
}

