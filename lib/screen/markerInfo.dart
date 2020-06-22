import 'package:flutter/material.dart';

class MarkerInfo extends StatefulWidget {
  String title, horaire, contact;


  MarkerInfo(this.title, this.horaire, this.contact);

  @override
  _MarkerInfoState createState() => _MarkerInfoState();
}

class _MarkerInfoState extends State<MarkerInfo> {

  bool contactVisibility(){
    bool visibility = false;
    setState(() {
      if(widget.contact == "" || widget.contact == null){
        visibility = false;
      }else{
        visibility = true;
      }
    });
    return visibility;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(widget.title, style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),),
          Row(
            children: <Widget>[
              Icon(Icons.access_time, color: Color(0xffe2b80e),),
              Text(widget.horaire, style: TextStyle(color: Colors.black),)
            ],
          ),
         Visibility(
           visible: contactVisibility(),
           maintainSize: true,
           maintainAnimation: true,
           maintainState: true,
           child:  Row(
             children: <Widget>[
               Icon(Icons.phone, color: Color(0xffe2b80e),),
               Text(widget.contact, style: TextStyle(color: Colors.black),)
             ],
           ),
         )
        ],
      ),
    );
  }
}
