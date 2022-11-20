import 'package:financial_control/src/features/home/historic/domain/category.entity.dart';
import 'package:financial_control/src/features/home/historic/domain/event.entity.dart';
import 'package:financial_control/src/features/home/historic/presentation/contacts.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../../../../main.dart';
import '../../../../common/database/database_controller.dart';
import '../data/datasource/event_datasource.dart';

class HistoricPage extends StatefulWidget {
  const HistoricPage({Key? key}) : super(key: key);

  @override
  State<HistoricPage> createState() => _HistoricPageState();
}

DatabaseController databaseController=DatabaseController();

List<EventEntity> test = [
  EventEntity(
    value: '200',
    description: 'Teste',
    type: 'false',
    category: CategoryEntity().alimentacao,
    date: ' ',
  ),
  EventEntity(
    value: '200',
    description: 'Teste',
    type: 'false',
    category: CategoryEntity().lazer,
    date: ' ',
  ),
  EventEntity(
    value: '200',
    description: 'Teste',
    type: 'false',
    category: CategoryEntity().alimentacao,
    date: ' ',
  )
];

class _HistoricPageState extends State<HistoricPage> {


  @override
  void initState(){

   // databaseController.readData();

  }

  @override
  Widget build(BuildContext context) {
    return Contacts();
  }
}
