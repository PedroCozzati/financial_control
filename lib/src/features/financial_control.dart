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
        highlightColor:Colors.red ,
        focusColor:Colors.red ,
        primarySwatch: Colors.red,
        iconTheme: IconThemeData(
          color: CustomColors.secundaryRed,
        ),
        hoverColor: CustomColors.secundaryRed,
        indicatorColor: CustomColors.secundaryRed,
        primaryColor: CustomColors.secundaryRed,
        cursorColor:  CustomColors.secundaryRed,
      )
    );
  }
}
