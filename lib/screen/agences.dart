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
  BitmapDescriptor pinLocationIcon;

  Completer<GoogleMapController> myController = Completer();

  final CameraPosition _initialPosition = CameraPosition(target: LatLng(7.539988999999998, -5.547079999999999), zoom: 6);

  final List<Marker> markers = [];


  List agences = [];
  List<Agence> latlng = [];

  @override
  void initState() {
    fetchLatData();
    /*switch (widget.bankid){
      case 1:
        BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 2.5),
            'assets/images/boa_marker.png').then((onValue) {
          pinLocationIcon = onValue;
        });
        break;
      case 2:

        break;
      case 3:

        break;
      case 4:

        break;
      case 5:

        break;
      case 6:

        break;
      case 7:

        break;
      case 8:

        break;
      case 9:

        break;
      case 10:

        break;
      case 11:

        break;
      case 12:

        break;
      case 13:

        break;
      case 14:

        break;
      case 15:

        break;
      case 16:

        break;
      case 17:

        break;
      case 18:

        break;
      case 19:

        break;
      case 20:

        break;
      case 21:

        break;
      case 22:

        break;
      case 23:

        break;
      case 24:

        break;
      case 25:

        break;
      case 26:

        break;
      default:

        break;
    }*/
    //setCustomMapPin();
    setCustomMapPin("assets/images/boa_marker.png");
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {

      myController.complete(controller);

      for(var a in agences){
        setState(() async{
          BitmapDescriptor icon = await BitmapDescriptor.fromAsset("assets/images/boa_marker.png");
          markers.add(Marker(
              markerId: MarkerId(a['title']),
              position: LatLng(double.parse(a['latitude']), double.parse(a['longitude'])),

          ));
        });
      }

  }

  addMarker(){
    setState(() {

    });
  }


  void setCustomMapPin(String imageUrl) async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(48,48)),
        imageUrl);
  }

  void fetchLatData() async {
    final response = await http.get(
        'https://digitalfinances.innovstech.com/getAgenceLatLng.php?id='+widget.bankid.toString());

    if (response.statusCode == 200) {
      setState(() async{
        agences = json.decode(response.body);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    setCustomMapPin("assets/images/boa_marker.png");
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: GoogleMap(
              mapType: MapType.normal,
              onMapCreated: (GoogleMapController controller) {

                myController.complete(controller);

                for(var a in agences){
                  setState(() async{
                    markers.add(Marker(
                      markerId: MarkerId(a['title']),
                      position: LatLng(double.parse(a['latitude']), double.parse(a['longitude'])),
                    ));
                  });
                }

              },
              markers: Set.of(markers),
              myLocationEnabled: true,
              rotateGesturesEnabled: true,
              compassEnabled: true,
              initialCameraPosition: _initialPosition,
            ),
          )
        ],
      ),
    );
  }
}
