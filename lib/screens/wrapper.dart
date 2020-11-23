import 'package:flutter/material.dart';
import '../screens/authenticate/authenticate.dart';
import '../models/user.dart';
import 'package:provider/provider.dart';
import './home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser>(context);
    if (user == null){
      return Authenticate();
    }else{
      return Home();
    }
  }
}
