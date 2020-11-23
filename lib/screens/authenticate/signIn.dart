import 'package:flutter/material.dart';
import 'package:fireapp/services/auth.dart';
import 'package:fireapp/constants.dart';

class SignIn extends StatefulWidget {
  final Function signInSwitch;

  SignIn({this.signInSwitch});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          title: Text('Sign in BrewCrew'),
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Sign Up'),
              onPressed: () {
                widget.signInSwitch();
              },
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: inputDesign.copyWith(hintText: 'Email'),
                  validator: (val) => val.isEmpty ? 'Enter Email' : null,
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: inputDesign.copyWith(hintText: 'Password'),
                  validator: (val) => val.length < 6 ? 'Pass longer 6' : null,
                  obscureText: true,
                  onChanged: (val) {
                    setState(() {
                      password = val;
                    });
                  },
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                  color: Colors.pink[400],
                  child: Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      dynamic result =
                          await _auth.signInEmailAndPass(email, password);
                      if (result == null) {
                        setState(() {
                          error = 'Couldnt Sign in with that Credentials';
                        });
                      }
                    }
                  },
                ),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 12.0),
                ),
              ],
            ),
          ),
        ));
  }
}
