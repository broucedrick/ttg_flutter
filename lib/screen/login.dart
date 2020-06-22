import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:trouvetongab/screen/inscription.dart';
import 'package:trouvetongab/screen/home.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';



class Login extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String _message = 'Log in/out by pressing the buttons below.';

  static final FacebookLogin facebookSignIn = new FacebookLogin();

  void _showMessage(String message) {
    setState(() {
      _message = message;
    });
  }
  Future<List> senddata(String nom,String email,String ID) async {

    try{
      ProgressDialog pr = ProgressDialog(context,type: ProgressDialogType.Normal,isDismissible: true);
      await pr.show();
      var rep = await  http.post("https://digitalfinances.innovstech.com/visiteur_ios.php", body: {
        "nom" :nom,
        "email":email,
        "mdp":ID,
      });
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('nom', nom);
      var pre = prefs.getString('nom');
      print(pre);
      Navigator.push(context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    }catch(error){
      print(error);
    }
  }
  Future<Null> _loginFB() async {
    final FacebookLoginResult result = await facebookSignIn.logIn(['email']);

    switch (result.status) {

      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        final token = result.accessToken.token;
        ProgressDialog pr = ProgressDialog(context,type: ProgressDialogType.Normal,isDismissible: true);
        pr.show();
        final graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${token}');
        final   profile = jsonDecode(graphResponse.body);

        _showMessage('''
         Logged in!
         
         Token: ${accessToken.token}
         User id: ${accessToken.userId}
         Expires: ${accessToken.expires}
         Permissions: ${accessToken.permissions}
         Declined permissions: ${accessToken.declinedPermissions}
         ''');
    String email =profile['email'];
    String nom =profile['name'];
    String Id =profile['id'];
 print(profile);
    senddata(nom,email,Id);

        break;
      case FacebookLoginStatus.cancelledByUser:
        _showMessage('Login cancelled by the user.');
        break;
      case FacebookLoginStatus.error:
        _showMessage('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');
        break;
    }
  }
  _Alert_email(context) {
    ProgressDialog pr = ProgressDialog(context,type: ProgressDialogType.Normal,isDismissible: true);
    Alert(
      context: context,
      title: "ERROR",
      style:alertStyle,
      desc: "Veuillez vous inscrire",
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.black, fontSize: 20),

          ),
          //  onPressed: () => Navigator.pop(context),
          onPressed:(){
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => Login()),
            );
          } ,
          width: 120,
          color: Colors.white,
        )
      ],
    ).show();
  }
  _Alert(context) {
    ProgressDialog pr = ProgressDialog(context,type: ProgressDialogType.Normal,isDismissible: true);
    Alert(
      context: context,
      title: "ERROR",
      style: alertStyle,
      desc: "VERIFIER LA CONNECTION INTERNET",
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.black, fontSize: 20),

          ),
          //  onPressed: () => Navigator.pop(context),
          onPressed:(){
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => Login()),
            );
          } ,
          width: 120,
          color: Colors.white,
        )
      ],
    ).show();
  }



  Future<List> connection() async {
    ProgressDialog pr = ProgressDialog(context,type: ProgressDialogType.Normal,isDismissible: true);
   SharedPreferences prefs = await SharedPreferences.getInstance();

    await pr.show();
    try{
      var rep = await  http.post("https://digitalfinances.innovstech.com/ios_connect.php", body: {
        "email": emailController.text,
        "mdp":passwordController.text,
      });
      if(rep.body.contains('0')){
        print('veillez vous inscrire');
        pr.hide();
        if(pr.isShowing()){
          print('veillez vous inscrire');
          _Alert_email(context);
          pr.hide();
        }
        else{
          _Alert_email(context);
          print('veillez vous inscrire');

        }
      }else if(rep.body.contains(('1'))){
        print('connection reuissi');
        prefs.setString('email', emailController.text);
        if(pr.isShowing()){
          pr.hide();
          Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Home()),
          );
        }else{
          await pr.hide();
         // print('connection reuissi');
         //var pref = await prefs.setString('email', emailController.toString());
         //print(emailController.toString());
          Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Home()),
          );
        }
      }
    }catch(error){
      await pr.hide();
      print(error);
      _Alert(context);
      print('echec');
    }

  }

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

  @override
  Widget build(BuildContext context) {
    ProgressDialog pr = ProgressDialog(context,type: ProgressDialogType.Normal,isDismissible: true);

    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20),
                alignment: AlignmentDirectional.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image(image: AssetImage('assets/images/Favicon_trouve_ton_gab.png'),width: MediaQuery.of(context).size.width/5,),
                    Text("Trouve ton GAB", textAlign: TextAlign.center, style: TextStyle(fontSize: 20), ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 30, top: 30, right: 30),
                  decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)), color: Colors.white),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: ListView(
                      children: <Widget>[
                        Container(
                          height: 50,
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: SignInButton(

                            Buttons.Facebook,
                            text:"connexion avec Facebook",
                            onPressed: (){
                              _loginFB();
                              },
                        )),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Ou',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          )),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Theme(
                            data: ThemeData(
                              backgroundColor: Colors.black,
                            ),
                            child: TextField(
                              controller: emailController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black, width: 1.0, style: BorderStyle.solid)),
                                labelText: 'email',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: Theme(
                            data: ThemeData(
                              backgroundColor: Colors.black,

                            ),
                            child: TextField(
                              obscureText: true,
                              controller: passwordController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Mot de passe',
                              ),
                            ),
                          ),
                        ),

                        FlatButton(
                          onPressed: (){
                    //forgot password screen
                          },
                          textColor: Colors.blue,
                          child: Text(''),
                        ),
                        Container(
                          height: 50,
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: RaisedButton(
                            textColor: Colors.white,
                            color: Colors.blue,
                            child: Text('connexion'),
                            onPressed: () {
                              if(emailController.text ==""){
                                _onBasicAlertPressed(context);
                              }
                              else if(passwordController.text ==""){
                                _onBasicAlertPressed(context);
                              }else{
                                connection();

                    //pr.show();
                              }
                            },
                          )),
                        Divider(),

                        Container(
                          child: Column(
                            children: <Widget>[
                              Text("Vous n'avez pas de compte ?", style: TextStyle(color: Colors.black),),
                              FlatButton(
                                textColor: Colors.blue,
                                child: Text(
                                  'inscivez vous ',
                                  style: TextStyle(fontSize: 20),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Inscritpion()),
                                  );
                    //signup screen
                                },
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          ))
                      ],
                    )
                  )
                ),
              )
            ],
          ),
        ));




  }
}