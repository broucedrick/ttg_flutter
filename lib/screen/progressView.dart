import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trouvetongab/screen/intro_slide.dart';

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
    if(prefs.getKeys() == null || prefs.getBool("viewed") == true){
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()));
    }else{
      Navigator.push(
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

