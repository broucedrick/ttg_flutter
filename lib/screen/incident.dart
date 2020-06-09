import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


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

      body: ListView(
        padding: EdgeInsets.all(20),
        children: <Widget>[
          Text(
            "Déclarez un incident\nbancaire",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25),
          ),

          Container(
            margin: EdgeInsets.only(top: 20),
            child: Theme(
              data: ThemeData(
                primaryColor: Color(0xffe2b80e),
                primaryColorDark: Color(0xffe2b80e),
                hintColor: Colors.white,
              ),
              child: TextField(
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  labelText: "Nom et prénom(s) *",

                ),
                style: TextStyle(color: Colors.white),
              ),

            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 20),
            child: Theme(
              data: ThemeData(
                  primaryColor: Color(0xffe2b80e),
                  primaryColorDark: Color(0xffe2b80e),
                  hintColor: Colors.white
              ),
              child: TextField(
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  labelText: "La banque *",
                ),
                style: TextStyle(color: Colors.white),
              ),

            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 20),
            child: Theme(
              data: ThemeData(
                  primaryColor: Color(0xffe2b80e),
                  primaryColorDark: Color(0xffe2b80e),
                  hintColor: Color(0xffe2b80e)
              ),
              child: DropdownButton(
                style: TextStyle(color: Colors.white),
                dropdownColor: Color(0xff303030),
                hint: Text("Select Your Friends *"),
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
          ),

          Container(
            margin: EdgeInsets.only(top: 20),
            child: Theme(
              data: ThemeData(
                  primaryColor: Color(0xffe2b80e),
                  primaryColorDark: Color(0xffe2b80e),
                  hintColor: Colors.white
              ),
              child: TextField(
                keyboardType: TextInputType.number,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  labelText: "Numéro de téléphone *",
                ),
                style: TextStyle(color: Colors.white),
              ),

            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 20),
            child: Theme(
              data: ThemeData(
                  primaryColor: Color(0xffe2b80e),
                  primaryColorDark: Color(0xffe2b80e),
                  hintColor: Colors.white
              ),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  labelText: "E-mail *",
                ),
                style: TextStyle(color: Colors.white),
              ),

            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 20),
            child: Theme(
              data: ThemeData(
                  primaryColor: Color(0xffe2b80e),
                  primaryColorDark: Color(0xffe2b80e),
                  hintColor: Colors.white
              ),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                cursorColor: Colors.white,
                maxLength: 1000,
                decoration: InputDecoration(
                  labelText: "Commentaire",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffe2b80e), style: BorderStyle.solid, width: 1.0),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),

            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 50, right: 50, top: 20),
            child: RaisedButton(
              child: Text("Envoyer",
                style: TextStyle(fontSize: 15.0),),
              textColor: Colors.white,
              padding: const EdgeInsets.only(left: 10, right: 10),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
              color: Color(0xffe2b80e),
              onPressed: () {},
            ),
          ),
        ],
      ),

    );
  }
}
