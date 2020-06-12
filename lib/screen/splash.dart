import 'package:flutter/material.dart';
import 'package:trouvetongab/screen/loginnnnnnnnnnnnnnnn.dart';
import 'package:animated_splash/animated_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: AnimatedSplash(
      imagePath: 'assets/Favicon_trouve_ton_gab.png',
      home: Splash(),
      duration: 2500,
      type: AnimatedSplashType.StaticDuration,
    ),
  ));
}
BuildContext context;
_verf() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var get = prefs.getString('email');
  if(get.toString().contains('null')){
    print(get.toString());

  }else{
    print('rien');
  }
}
class Splash extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        ),
        body: Center(
            child: Text('xxxxx',
                style: TextStyle(color: Colors.black, fontSize: 20.0))));
  }
}