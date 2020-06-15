import 'package:flutter/material.dart';
import 'package:trouvetongab/screen/progressView.dart';
import 'dart:async';



class Splash extends StatefulWidget {
  @override
  State <StatefulWidget> createState() {
    return SplashState();
  }
}


class SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }
  startTime() async {
    var duration = new Duration(seconds: 6);
    return new Timer(duration, route);
  }
  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => ProgressView()
    )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }
  initScreen(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image(image: AssetImage('assets/images/Favicon_trouve_ton_gab.png'),width: MediaQuery.of(context).size.width/5,)

            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text("Trouve ton GAB", textAlign: TextAlign.center, style: TextStyle(fontSize: 20), ),

            Padding(padding: EdgeInsets.only(top: 20.0)),
            CircularProgressIndicator(
              backgroundColor: Colors.red,
              strokeWidth: 1,
              //valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),

            )
          ],
        ),
      ),
    );
  }
}