import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trouvetongab/screen/Itinenaire.dart';

class GabListItem extends StatelessWidget {
  String title;
  String location;
  GabListItem(this.title, this.location);
  @override
  Widget build(BuildContext context) {
    return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,

                  ),
                  child: Icon(Icons.location_on),
                  padding: EdgeInsets.all(4),
                ),
                Container(
                  margin: EdgeInsets.only(left: 3, right: 3),
                  child: Text(
                    title,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(4),
                  margin: EdgeInsets.only(left: 3, right: 3),
                  child: RaisedButton(
                    child: Text('Itinéraire'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Itineraire(location, title))
                      );

                    },
                    padding: EdgeInsets.all(2),
                    color: Colors.black12,
                  ),
                )
              ],
            ),

    );
  }
}
