import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trouvetongab/screen/intro_slide.dart';
import 'package:trouvetongab/screen/loginn.dart';

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
    //print(prefs.getBool("viewed"));
    if(prefs.getKeys() == null || prefs.getBool("viewed") == false){
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Loginn()));


    }
    if(prefs.getKeys() == null && prefs.getBool("viewed") == false){
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Loginn()));
    }
    else{
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Loginn()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("chargement..."),
      )
    );
  }
}

