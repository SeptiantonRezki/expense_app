import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/error_screen.dart';
import '../screens/summary_screen.dart';
import '../config/custom_app_route.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case CustomAppRoute.homeScreen:
        return CustomAppRoute.goToRoute(
            const HomeScreen(), CustomAppRoute.homeScreen);
      case CustomAppRoute.summaryScreen:
        return CustomAppRoute.goToRoute(
            const SummaryScreen(), CustomAppRoute.summaryScreen);
      default:
        return CustomAppRoute.goToRoute(
            const ErrorScreen(), CustomAppRoute.errorScreen);
    }
  }
}
