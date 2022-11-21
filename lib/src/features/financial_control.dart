import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../main.dart';
import '../common/colors/colors.dart';
import '../common/routes/financial_control.routes.dart';
import 'home/home_screen.dart';

class FinancialControlApp extends StatefulWidget {
  const FinancialControlApp({Key? key}) : super(key: key);

  @override
  State<FinancialControlApp> createState() => _FinancialControlAppState();
}

class _FinancialControlAppState extends State<FinancialControlApp> {

  @override
  void initState() {
    isInternetConnected();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: "Controle financeiro",
      routes: FinancialControlRoutes.financialRoutes,
      initialRoute: 'splash_screen',
      theme: ThemeData(
        highlightColor:Colors.green.shade800,
        focusColor:Colors.green.shade800 ,
        primarySwatch: Colors.green,
        iconTheme: IconThemeData(
          color: Colors.green.shade800,
        ),
        hoverColor: Colors.green.shade800,
        indicatorColor:Colors.green.shade800,
        primaryColor: Colors.green.shade800,
        cursorColor:  Colors.green.shade800,
      )
    );
  }
}
