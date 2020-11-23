import 'package:fireapp/services/auth.dart';
import 'package:provider/provider.dart';

import './screens/wrapper.dart';
import './models/user.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  //this part isnt mentioned in the video , this works around the default error thats called
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
//end
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<CustomUser>.value(
      value: AuthService().userDet,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
