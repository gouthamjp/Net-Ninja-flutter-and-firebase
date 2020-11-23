
import 'package:fireapp/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fireapp/services/database.dart';
import './brewList.dart';
import 'package:fireapp/models/brew.dart';
import 'settingsForm.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    void showSettingPanel(){
      showModalBottomSheet(context: context,builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20 , horizontal: 60),
          child: SettingsForm(),
        );
      });
    }
    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          title: Text('Hello User'),
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              onPressed: () async {
                await _auth.signOut();
              },
              label: Text(
                'Log Out',
                style: TextStyle(color: Colors.white),
              ),
            ),
            FlatButton.icon(
              icon : Icon(Icons.settings),
              label: Text('Settings'),
              onPressed: (){
                showSettingPanel();
              },
            )
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
