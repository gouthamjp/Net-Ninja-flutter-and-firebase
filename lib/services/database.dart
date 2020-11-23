import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireapp/models/brew.dart';
import 'package:fireapp/models/user.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  //collection reference
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');

  Future updateUserData(String name, int strength, String sugar) async {
    return await brewCollection.doc(uid).set({
      'sugars': sugar,
      'name': name,
      'strength': strength,
    });
  }

  //brews data stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapShot);
  }

  //brew list from a snapshot
  List<Brew> _brewListFromSnapShot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Brew(
        name: doc.data()['name'] ?? "",
        strength: doc.data()['strength'] ?? 0,
        sugar: doc.data()['sugar'] ?? "",
      );
    }).toList();
  }

  //document stream and stuff
  Stream<UserData> get userData {
    return brewCollection.doc(uid).snapshots().map(userDatafromSnapshot);
  }

  //converting snapshots to custom class
  UserData userDatafromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        name: snapshot.data()['name'],
        strength: snapshot.data()['strength'],
        sugar: snapshot.data()['sugar'],
        ui: uid);
  }
}
