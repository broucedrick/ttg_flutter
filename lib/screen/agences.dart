import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:trouvetongab/model/bank.dart';
import 'package:trouvetongab/screen/markerInfo.dart';
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

  final Set<Marker> markers = {};


  List agences = [];
  List<Agence> latlng = [];

  @override
  void initState() {
    fetchLatData();
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {

      myController.complete(controller);
      //BitmapDescriptor icon = await BitmapDescriptor.fromAsset("assets/images/boa_marker.png");

  }

  /*addMarker(){
    setState(() {

    });
  }*/


  void setCustomMapPin() async {
    /*pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(24.0, 24.0), devicePixelRatio: 2.5),
        imageUrl);*/
    switch (widget.bankid){
      case 1:
        BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 2.5),
            'assets/images/boa_marker.png').then((onValue) {
          pinLocationIcon = onValue;
        });

        break;
      case 2:
        BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 2.5),
            'assets/images/baci_marker.png').then((onValue) {
          pinLocationIcon = onValue;
        });
        break;
      case 3:
        BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 2.5),
            'assets/images/bda_marker.png').then((onValue) {
          pinLocationIcon = onValue;
        });
        break;
      case 4:
        BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 2.5),
            'assets/images/nsia_marker.png').then((onValue) {
          pinLocationIcon = onValue;
        });
        break;
      case 5:
        BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 2.5),
            'assets/images/bicici_marker.png').then((onValue) {
          pinLocationIcon = onValue;
        });
        break;
      case 6:
        BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 2.5),
            'assets/images/afb_marker.png').then((onValue) {
          pinLocationIcon = onValue;
        });
        break;
      case 7:
        BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 2.5),
            'assets/images/bni_marker.png').then((onValue) {
          pinLocationIcon = onValue;
        });
        break;
      case 8:
        BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 2.5),
            'assets/images/sib_marker.png').then((onValue) {
          pinLocationIcon = onValue;
        });
        break;
      case 9:
        BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 2.5),
            'assets/images/ecobank_marker.png').then((onValue) {
          pinLocationIcon = onValue;
        });
        break;
      case 10:
        BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 2.5),
            'assets/images/gtbank_marker.png').then((onValue) {
          pinLocationIcon = onValue;
        });
        break;
      case 11:
        BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 2.5),
            'assets/images/citi_marker.png').then((onValue) {
          pinLocationIcon = onValue;
        });
        break;
      case 12:
        BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 2.5),
            'assets/images/bridge_marker.png').then((onValue) {
          pinLocationIcon = onValue;
        });
        break;
      case 13:
        BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 2.5),
            'assets/images/orabank_marker.png').then((onValue) {
          pinLocationIcon = onValue;
        });
        break;
      case 14:
        BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 2.5),
            'assets/images/stanbic_marker.png').then((onValue) {
          pinLocationIcon = onValue;
        });
        break;
      case 15:
        BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 2.5),
            'assets/images/sgbci_marker.png').then((onValue) {
          pinLocationIcon = onValue;
        });
        break;
      case 16:
        BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 2.5),
            'assets/images/stc_marker.png').then((onValue) {
          pinLocationIcon = onValue;
        });
        break;
      case 17:
        BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 2.5),
            'assets/images/bp_marker.png').then((onValue) {
          pinLocationIcon = onValue;
        });
        break;
      case 18:
        BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 2.5),
            'assets/images/bduci_marker.png').then((onValue) {
          pinLocationIcon = onValue;
        });
        break;
      case 19:
        BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 2.5),
            'assets/images/bgfi_marker.png').then((onValue) {
          pinLocationIcon = onValue;
        });
        break;
      case 20:
        BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 2.5),
            'assets/images/nhci_marker.png').then((onValue) {
          pinLocationIcon = onValue;
        });
        break;
      case 21:
        BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 2.5),
            'assets/images/versus_marker.png').then((onValue) {
          pinLocationIcon = onValue;
        });
        break;
      case 22:
        BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 2.5),
            'assets/images/uba_marker.png').then((onValue) {
          pinLocationIcon = onValue;
        });
        break;
      case 23:
        BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 2.5),
            'assets/images/bmci_marker.png').then((onValue) {
          pinLocationIcon = onValue;
        });
        break;
      case 24:
        BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 2.5),
            'assets/images/diamond_marker.png').then((onValue) {
          pinLocationIcon = onValue;
        });
        break;
      case 25:
        BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 2.5),
            'assets/images/coris_marker.png').then((onValue) {
          pinLocationIcon = onValue;
        });
        break;
      case 26:
        BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 2.5),
            'assets/images/bsic_marker.png').then((onValue) {
          pinLocationIcon = onValue;
        });
        break;
      default:

        break;
    }
  }

  void fetchLatData() async {
    final response = await http.get(
        'https://digitalfinances.innovstech.com/getAgenceLatLng.php?id='+widget.bankid.toString());

    //BitmapDescriptor icon = await BitmapDescriptor.fromAsset("assets/images/boa_marker.png");
    //setCustomMapPin("assets/images/boa_marker.png");

    if (response.statusCode == 200) {
      setState(() {
        agences = json.decode(response.body);

        for(var a in agences){

          markers.add(Marker(
            markerId: MarkerId(a['title']),
            position: LatLng(double.parse(a['latitude']), double.parse(a['longitude'])),
            infoWindow: InfoWindow(title: a['title'], snippet: "\n"+a['horaire']+"\n\n"+a['contact']),
            icon: pinLocationIcon
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
              markers: markers,
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
