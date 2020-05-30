import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:trouvetongab/model/bank.dart';
import '../model/agence.dart';

class Agences extends StatefulWidget {

  final int bankid;


  Agences(this.bankid);

  @override
  _AgencesState createState() => _AgencesState();
}

class _AgencesState extends State<Agences> {

  GoogleMapController myController;

  final CameraPosition _initialPosition = CameraPosition(target: LatLng(7.539988999999998, -5.547079999999999), zoom: 6);

  final List<Marker> markers = [];


  List agences = [];
  List<Agence> latlng = [];

  @override
  void initState() {
    fetchLatData();
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {
    myController = controller;
  }

  addMarker(){
    setState(() {

    });
  }

  void fetchLatData() async {
    final response = await http.get(
        'https://digitalfinances.innovstech.com/getAgenceLatLng.php?id='+widget.bankid.toString());

    if (response.statusCode == 200) {
      setState(() {
        agences = json.decode(response.body);
        print(agences);
        for(var a in agences){
          markers.add(Marker(
              markerId: MarkerId(a['title']),
              position: LatLng(double.parse(a['latitude']), double.parse(a['longitude']))
          ));
        }

      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: GoogleMap(
              mapType: MapType.normal,
              onMapCreated: _onMapCreated,
              markers: Set.of(markers),
              myLocationEnabled: true,
              rotateGesturesEnabled: false,
              compassEnabled: true,
              initialCameraPosition: _initialPosition,
            ),
          )
        ],
      ),
    );
  }
}
