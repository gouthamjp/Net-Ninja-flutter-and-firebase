// firebase authentication
import 'package:fireapp/models/user.dart';
import 'package:fireapp/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //creat custom user based on User object from firbase
  CustomUser _userFromFirebase(User tempUser) {
    return tempUser != null ? CustomUser(uid: tempUser.uid) : null;
  }

  //auth change stream
  Stream<CustomUser> get userDet {
    return _auth.authStateChanges().map(
        _userFromFirebase); // here its different from the tutorial regarding the authstatechanges part.
  }

  //sign in anon

  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebase(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // sign in email and pass
  Future signInEmailAndPass(String email, String password) async{
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email and pass
  Future regEmailAndPass(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user; 

      //creating an instacne of database service
     await DatabaseService(uid: user.uid).updateUserData('New User',100, '0');

      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
