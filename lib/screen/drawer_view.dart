import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // column holds all the widgets in the drawer
      child: Column(
        children: <Widget>[
          Expanded(
            // ListView contains a group of widgets that scroll inside the drawer
            child: ListView(
              children: <Widget>[
                DrawerHeader(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Image(image: AssetImage('assets/images/Favicon_trouve_ton_gab.png'),width: MediaQuery.of(context).size.width/5,),
                        Text("Trouve ton GAB", textAlign: TextAlign.center, style: TextStyle(fontSize: 20), ),
                        Text("By Digitale Finances", textAlign: TextAlign.center, style: TextStyle(fontSize: 11),
                        ),

                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                  ),
                ),
                ListTile(
                  title: Text('A propos'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                ListTile(
                  title: Text('Mentions légales'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                ListTile(
                  title: Text('Conditions d\'utilisation'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                ListTile(
                  title: Text('Digitale Finances'),
                  onTap: _markertplaceUrl,
                ),
                ListTile(
                  title: Text('Se déconnecter'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
              ],
            ),
          ),
          // This container holds the align
          Container(
            padding: EdgeInsets.only(left: 15, bottom: 15),
            // This align moves the children to the bottom
            child: Align(
                alignment: FractionalOffset.bottomLeft,
                // This container holds all the children that will be aligned
                // on the bottom and should not scroll with the above ListView
                child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Version : 1.0.0\nPropriété de Digitale Finances\nTous droits reservés"),
                        Image(image: AssetImage("assets/images/df_logo.png"), width: MediaQuery.of(context).size.width/3,),
                      ],
                    ),
                )
            )
          )
        ],
      ),
    );
  }

  _markertplaceUrl() async{
    const url = 'https:www.digitalefinances.com';
    if(await canLaunch(url)){
      await launch(url);
    }else{
      throw 'Could not launch $url';
    }
  }
}
