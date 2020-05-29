import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Agence extends StatefulWidget {
  @override
  _AgenceState createState() => _AgenceState();
}

class _AgenceState extends State<Agence> {

  GoogleMapController myController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            child: GoogleMap(
              onMapCreated: (controller) {
                setState(() {
                  myController = controller;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
