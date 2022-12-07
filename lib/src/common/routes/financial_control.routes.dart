import 'package:financial_control/src/features/error_page/erro_on_save.dart';
import 'package:financial_control/src/features/error_page/error_page.dart';
import 'package:financial_control/src/features/faq/faq_page.dart';
import 'package:financial_control/src/features/financial_control.dart';
import 'package:financial_control/src/features/home/add_event/add_event.dart';
import 'package:financial_control/src/features/home/add_event/edit_event.dart';
import 'package:flutter/material.dart';

import '../../features/home/home_screen.dart';
import '../../features/splash_screen/presentation/splash_screen.page.dart';

class FinancialControlRoutes {
  static Map<String, Widget Function(BuildContext)> financialRoutes = {
    'splash_screen': (context) => const SplashScreen(),
    'home': (context) => const HomeScreen(),
    'error_page': (context) => const ErrorPage(),
    'erro_on_save':(context)=>ErrorOnSavePage(),
    'create_event': (context) => AddEventForm(),
    'edit_event': (context) => EditEventForm(),
    'faq':(context)=>FaqPage(),
    '/': (context) => const FinancialControlApp(),
  };
}
