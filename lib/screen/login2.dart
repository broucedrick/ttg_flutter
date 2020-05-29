import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';



GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);


class Login2 extends StatefulWidget {
  @override
  _Login2State createState() => _Login2State();


}

class _Login2State extends State<Login2> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
        AppBar(
          title: Text("Identification"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SignInButton(
                Buttons.GoogleDark,
                text: 'Se connecter avec Google',
                onPressed: () {
                  //_handleSignIn();
                  //signOutGoogle();
                },
              ),

            ],
          ),
        )
    );
  }
}
