import 'package:financial_control/src/features/home/historic/domain/event.entity.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../../../main.dart';
import '../../../../feature_default/data/models/coffee.model.dart';
import '../../../../feature_default/domain/errors/default.failure.dart';
import '../models/event.model.dart';

class EventDataSource {
  @override
   void getEvents() async {
    try {
      void readData(){
        databaseReference.once().then((DataSnapshot snapshot) {
          print('Data : ${snapshot.value}');
        });
      }
     readData();

    } catch (e) {
      CoffeeDatasourceError('Erro');
    }

    throw CoffeeDatasourceError('Erro');
  }
}
