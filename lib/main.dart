import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:financial_control/src/features/financial_control.dart';
import 'package:financial_control/src/features/home/historic/presentation/contacts.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

late final DatabaseReference databaseReference;
bool isInternet = false;

Future<bool> isInternetConnected() async {
  try {
    final result = await InternetAddress.lookup('example.com');
    var res = result.isNotEmpty && result[0].rawAddress.isNotEmpty;

    isInternet = res;

    return res;
  } on SocketException catch (_) {
    isInternet = false;

    return false;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  databaseReference = FirebaseDatabase.instance.reference();

  // databaseReference.child('events').push().set({
  //   'value':value
  // });
  runApp(
    FinancialControlApp(),
  );
}
