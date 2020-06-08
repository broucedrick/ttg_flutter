import 'package:flutter/cupertino.dart';
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
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              alignment: AlignmentDirectional.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image(image: AssetImage('assets/images/Favicon_trouve_ton_gab.png'),width: MediaQuery.of(context).size.width/5,),
                  Text("Trouve ton GAB", textAlign: TextAlign.center, style: TextStyle(fontSize: 20), ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 30, top: 30, right: 30),
                decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)), color: Colors.white),
                child: ListView(
                  children: <Widget>[
                    Text(title, style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                    Divider(),
                    Text(text, style: TextStyle(color: Colors.black),)
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
