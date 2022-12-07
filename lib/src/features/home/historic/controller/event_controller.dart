import 'package:financial_control/src/common/database/database_controller.dart';
import 'package:financial_control/src/model/event.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../../splash_screen/presentation/splash_screen.page.dart';

class EventController{
  List<EventEntity> eventList = [];
  DatabaseController databaseController = DatabaseController();
  DatabaseReference dbRef = FirebaseDatabase.instance.reference();
  late Event event;

  // void retrieveStudentData() {
  //   dbRef.child(userId).child('events').onChildAdded.listen((data) {
  //     EventData eventData = EventData.fromJson(data.snapshot.value as Map);
  //     EventEntity event = EventEntity(key: data.snapshot.key, eventData: eventData);
  //     eventList.add(event);
  //     print(event.eventData);
  //     // setState(() {});
  //
  //   });
  // }

  Future<void> retrieveStudentData() async {
    dbRef.child(userId).child('events').onChildAdded.listen((data) {
      EventData eventData = EventData.fromJson(data.snapshot.value as Map);
      EventEntity event = EventEntity(key: data.snapshot.key, eventData: eventData);
      eventList.add(event);
      print(event.eventData);
    });
  }

}