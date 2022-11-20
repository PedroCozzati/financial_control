import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';

import '../../../../main.dart';
import '../../../common/colors/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

late String? userId;

Future<String?> _getId() async {
  var deviceInfo = DeviceInfoPlugin();
  if (Platform.isIOS) {
    // import 'dart:io'
    var iosDeviceInfo = await deviceInfo.iosInfo;
    return iosDeviceInfo.identifierForVendor; // unique ID on iOS
  } else if (Platform.isAndroid) {
    var androidDeviceInfo = await deviceInfo.androidInfo;
    return androidDeviceInfo.androidId; // unique ID on Android
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override


  Future getId() async {
    userId = await _getId();
  }

  void initState() {

    Future.delayed(const Duration(seconds: 6), () {
      if (!isInternet) {
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.pushReplacementNamed(context, 'error_page');
        });
      }
      Future.delayed(const Duration(seconds: 7), () {
        getId().then((value) =>
            Navigator.pushReplacementNamed(context, 'home'));
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Bem vindo",
              style: TextStyle(color: CustomColors.primayRed, fontSize: 29),
            ),
          ),
          Lottie.asset('lib/assets/loading_animation/loading.json')
        ],
      ),
    );
  }
}
