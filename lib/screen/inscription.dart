import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:trouvetongab/screen/loginn.dart';
import 'package:trouvetongab/screen/inscription.dart';

import 'package:http/http.dart' as http;



class Inscritpion extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Inscritpion> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  var alertStyle = AlertStyle(
    animationType: AnimationType.fromTop,
    isCloseButton: false,
    isOverlayTapDismiss: false,
    descStyle: TextStyle(fontWeight: FontWeight.bold),
    animationDuration: Duration(milliseconds: 400),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0.0),
      side: BorderSide(
        color: Colors.grey,
      ),
    ),
    titleStyle: TextStyle(
      color: Colors.white,
    ),
  );


  _onBasicAlertPressed(context) {

    Alert(
      context: context,
      title: "ERROR",
      style:alertStyle,
      desc: "veullez remplir les champs vides",
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),

          width: 120,
          color: Colors.white,
        )
      ],
    ).show();
  }
  _Alert_email(context) {
    ProgressDialog pr = ProgressDialog(context,type: ProgressDialogType.Normal,isDismissible: true);
    Alert(
      context: context,
      title: "ERROR",
      style:alertStyle,
      desc: "Email deja utilisé",
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.black, fontSize: 20),

          ),
     //  onPressed: () => Navigator.pop(context),
        onPressed:(){
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => Inscritpion()),
          );
        } ,
          width: 120,
          color: Colors.white,
        )
      ],
    ).show();
  }
  Future<List> senddata() async {
    ProgressDialog pr = ProgressDialog(context,type: ProgressDialogType.Normal,isDismissible: true);
    await pr.show();
      try{
        var rep = await  http.post("https://digitalfinances.innovstech.com/visiteur_ios.php", body: {

          "nom": nameController.text,
          "email": emailController.text,
          "mdp":passwordController.text,

        });
      //  pr.hide().whenComplete(() => null);
        print(rep.body);

        if(rep.body.contains('0')){
          print('element enregistrer');
          pr.hide();
          if(pr.isShowing()){
            pr.hide();
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => Loginn()),
            );
          }
        else{
            pr.hide();
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => Loginn()),
            );
          }

        }else if(rep.body.contains(('1'))){
          if(pr.isShowing()){
            pr.hide();
            print('email existe deja enregistré');
            _Alert_email(context);
          }else{
            await pr.hide();
            _Alert_email(context);
          }


        }
      }catch(error){
        print(error);
      }

  }
  @override
  Widget build(BuildContext context) {
   ProgressDialog pr = ProgressDialog(context,type: ProgressDialogType.Normal,isDismissible: true);
    return Scaffold(
        appBar: AppBar(
          title: Text('Inscritpion'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[

                Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nom & Prenom',
                    ),

                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Divider(),

                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Mot de passe',

                    ),
                  ),
                ),
                Divider(),

                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Enregister'),
                      onPressed: () {

                        if(emailController.text ==""){
                          _onBasicAlertPressed(context);
                        }
                       else if(nameController.text ==""){
                          _onBasicAlertPressed(context);

                        }else if(passwordController.text ==""){
                          _onBasicAlertPressed(context);
                        }
                        else{
                          senddata();
                          //// write the code to send some element to the database

                          pr.show();

                        }

                      },
                    )),
                Divider(),

              ],
            )));
  }
}