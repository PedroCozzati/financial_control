import 'package:flutter/material.dart';

import '../common/routes/financial_control.routes.dart';
import 'home/presentation/home_screen.dart';

class FinancialControlApp extends StatelessWidget {
  const FinancialControlApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Controle financeiro",
      routes: FinancialControlRoutes.financialRoutes,
      initialRoute: 'splash_screen',
    );
  }
}
