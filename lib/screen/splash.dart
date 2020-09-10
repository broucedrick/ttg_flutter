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
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      child: Image(image: AssetImage('assets/images/Favicon_trouve_ton_gab.png'),width: MediaQuery.of(context).size.width/6,)
                  ),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Text("Trouve ton GAB", textAlign: TextAlign.center, style: TextStyle(fontSize: 20), ),

                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Text("Mon assistant pour trouver\nun guichet automatique ou\nune agence",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: new AlwaysStoppedAnimation<Color>(Color(0xffe2b80e)),

                    ),
                  ),
                  Image(
                    image: AssetImage('assets/images/df_logo.png'),
                    width: MediaQuery.of(context).size.width/3,
                  ),
                ],
              ),

            )
          ],
        ),
      ),
    );
  }
}