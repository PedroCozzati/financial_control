import 'package:flutter/material.dart';

import '../../features/home/presentation/home_screen.dart';
import '../../features/splash_screen/presentation/splash_screen.page.dart';

class FinancialControlRoutes {
  static Map<String, Widget Function(BuildContext)> financialRoutes = {
    'splash_screen': (context) =>  const SplashScreen(),
    'home': (context) => const HomeScreen(),
  };
}