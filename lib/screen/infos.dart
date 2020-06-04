import 'package:flutter/material.dart';

class Infos extends StatelessWidget {
  String title;
  String text;

  Infos(this.title, this.text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Image(image: AssetImage('assets/images/Favicon_trouve_ton_gab.png'),width: MediaQuery.of(context).size.width/5,),
                Text("Trouve ton GAB", textAlign: TextAlign.center, style: TextStyle(fontSize: 20), ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
