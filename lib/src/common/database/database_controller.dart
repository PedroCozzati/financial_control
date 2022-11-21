import 'package:firebase_database/firebase_database.dart';

import '../../../main.dart';
import '../../features/splash_screen/presentation/splash_screen.page.dart';

class DatabaseController {
  getDatabaseReference() {
    FirebaseDatabase.instance.reference().child(userId).child('events');
  }

  getQueryRefForOrder() {
    FirebaseDatabase.instance
        .reference()
        .child(userId)
        .child('events')
        .orderByChild('timeStamp');
  }

  void createData(String id, String value, String name) {
    databaseReference.child('events').push().set({'value': value});
  }

  // void removeData(String id, String value, String name){
  //   databaseReference.child(id).
  // }

  void updateData(String id, String value, String name) {
    databaseReference.child(id).set({'name': name, 'value': value});
  }

  Future<DataSnapshot> readData() {
    return databaseReference.once().then((DataSnapshot snapshot) {
      return snapshot;
    });
  }
}
