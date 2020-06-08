import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Incident extends StatefulWidget {
  @override
  _IncidentState createState() => _IncidentState();
}

class _IncidentState extends State<Incident> {

  String incident_selected;
  List incident_list = ["", "Fonds non reçu", "Carte capturée", "Opposition sur carte", "Problème de connexion", "Autre (précisez en commentaire)"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Incident"),
      ),

      body: Column(
        children: <Widget>[
          Text(
            "Déclarez un incident\nbancaire",
            textAlign: TextAlign.center,
            style: TextStyle(),
          ),
          Theme(
            data: ThemeData(
                primaryColor: Color(0xffe2b80e),
                primaryColorDark: Color(0xffe2b80e),
              hintColor: Colors.white
            ),
            child: TextField(
              cursorColor: Colors.white,
              decoration: InputDecoration(
                labelText: "Nom et prénom(s)",
              ),
              style: TextStyle(color: Colors.white),
            ),

          ),

          Theme(
            data: ThemeData(
                primaryColor: Color(0xffe2b80e),
                primaryColorDark: Color(0xffe2b80e),
                hintColor: Colors.white
            ),
            child: TextField(
              cursorColor: Colors.white,
              decoration: InputDecoration(
                labelText: "La banque",
              ),
              style: TextStyle(color: Colors.white),
            ),

          ),

          Theme(
            data: ThemeData(
                primaryColor: Color(0xffe2b80e),
                primaryColorDark: Color(0xffe2b80e),
                hintColor: Colors.white
            ),
            child: DropdownButton(
                hint: Text("Select Your Friends"),
                value: incident_selected,
                items: incident_list.map((value) {
                  return DropdownMenuItem(
                    child: Text(value),
                    value: value,
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    incident_selected = value;
                  });
                },

            ),

          ),


          TextField(
            decoration: InputDecoration(
              labelText: "Numéro de téléphone",
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "E-mail",
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Commentaire",
            ),
          )
        ],
      ),

    );
  }
}
