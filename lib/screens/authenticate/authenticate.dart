import 'package:fireapp/screens/authenticate/signIn.dart';
import 'package:fireapp/screens/authenticate/register.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void switchPage(){
   setState(() {
      showSignIn = !showSignIn;
   });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: showSignIn ? SignIn(signInSwitch: switchPage,):Register(signInSwitch: switchPage),
    );
  }
}