import 'package:financial_control/src/features/error_page/error_page.dart';
import 'package:financial_control/src/features/financial_control.dart';
import 'package:flutter/material.dart';

import '../../features/home/home_screen.dart';
import '../../features/splash_screen/presentation/splash_screen.page.dart';

class FinancialControlRoutes {
  static Map<String, Widget Function(BuildContext)> financialRoutes = {
    'splash_screen': (context) =>  const SplashScreen(),
    'home': (context) => const HomeScreen(),
    'error_page': (context) => const ErrorPage(),
    '/': (context) => const FinancialControlApp(),
  };
}