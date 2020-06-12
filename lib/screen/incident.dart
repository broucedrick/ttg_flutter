import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';


class Incident extends StatefulWidget {
  @override
  _IncidentState createState() => _IncidentState();
}

class _IncidentState extends State<Incident> {

  TextEditingController _controllerName = new TextEditingController();
  bool _validateName = false;
  String name_error_text = null;
  TextEditingController _controllerBAnk = new TextEditingController();
  bool _validateBank = false;
  String bank_error_text = null;
  TextEditingController _controllerNumber = new TextEditingController();
  bool _validateNumber = false;
  String number_error_text = null;
  TextEditingController _controllerMail = new TextEditingController();
  bool _validateMail = false;
  String email_error_text = null;
  TextEditingController _controllerComment = new TextEditingController();

  String incident_selected;
  String itemSelected;
  List incident_list = ["", "Fonds non reçu", "Carte capturée", "Opposition sur carte", "Problème de connexion", "Autre (précisez en commentaire)"];

  void getDropDownItem(){
    setState(() {
      itemSelected = incident_selected ;
    });
  }

  void fielValidation(String name, String bank, String number, String email){
    if(name.isEmpty) {
      name_error_text = "Champ obligatoire *";
      _validateName = false;
    }else{
      _validateName = true;
    }

    if(bank.isEmpty) {
      bank_error_text = "Champ obligatoire *";
      _validateBank = false;
    }else{
      _validateBank = true;
    }

    if(number.isEmpty) {
      number_error_text = "Champ obligatoire *";
      _validateNumber = false;
    }else{
      _validateNumber = true;
    }

    if(email.isEmpty) {
      email_error_text = "Champ obligatoire *";
      _validateMail = false;
    }else if(email.contains("@") && email.contains(".")){
      _validateMail = true;
    }else{
      email_error_text = "Adresse mail incorrect";
      _validateMail = false;
    }
  }

  void senMail(String name, String bank, String incident, String number, String email, String comment) async{
    String command;
    if(incident.contains("Autre")){
      command = 'mailto:info@digitalefinances.com?subject=Déclaration d\'incident&body='
          +'Nom et prénom(s) : '+name
          +'\n\nBanque : '+bank
          +'\n\nIncident : '+comment
          +'\n\nNuméro de téléphone : '+number
          +'\n\nE-mail : '+email;
    }else if(comment.isEmpty){
      command = 'mailto:info@digitalefinances.com?subject=Déclaration d\'incident&body='
          +'Nom et prénom(s) : '+name
          +'\n\nBanque : '+bank
          +'\n\nIncident : '+incident
          +'\n\nNuméro de téléphone : '+number
          +'\n\nE-mail : '+email;
    }else{
      command = 'mailto:info@digitalefinances.com?subject=Déclaration d\'incident&body='
          +'Nom et prénom(s) : '+name
          +'\n\nBanque : '+bank
          +'\n\nIncident : '+incident
          +'\n\nNuméro de téléphone : '+number
          +'\n\nE-mail : '+email
          +'\n\nCommentaire : '+comment;
    }

    if(await canLaunch(command)){
      await launch(command);
    }
  }

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
                controller: _controllerName,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  labelText: "Nom et prénom(s) *",
                  errorText: _validateName ? null : name_error_text,
                ),
                style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  if(value.isNotEmpty){
                    setState(() {
                      _validateName = true;
                    });
                  }else{
                    setState(() {
                      _validateName = false;
                    });
                  }
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
                controller: _controllerBAnk,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  labelText: "La banque *",
                  errorText: _validateBank ? null : bank_error_text,
                ),
                style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  if(value.isNotEmpty){
                    setState(() {
                      _validateBank = true;
                    });
                  }else{
                    setState(() {
                      _validateBank = false;
                    });
                  }
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
                controller: _controllerNumber,
                keyboardType: TextInputType.number,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  labelText: "Numéro de téléphone *",
                  errorText: _validateNumber ? null : number_error_text,
                ),
                style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  if(value.isNotEmpty){
                    setState(() {
                      _validateNumber = true;
                    });
                  }else{
                    setState(() {
                      _validateNumber = false;
                    });
                  }
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
                controller: _controllerMail,
                keyboardType: TextInputType.emailAddress,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  labelText: "E-mail *",
                  errorText: _validateMail ? null : email_error_text,
                ),
                style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  if(value.contains("@") && value.contains(".")){
                    setState(() {
                      _validateMail = true;
                    });
                  }else{
                    setState(() {
                      _validateMail = false;
                    });
                  }
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
                controller: _controllerComment,
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
              onPressed: () {
                fielValidation(_controllerName.text, _controllerBAnk.text, _controllerNumber.text, _controllerMail.text);
                getDropDownItem();
                senMail(_controllerName.text, _controllerBAnk.text, incident_selected, _controllerNumber.text, _controllerMail.text, _controllerComment.text);
              },
            ),
          ),
        ],
      ),

    );
  }
}
