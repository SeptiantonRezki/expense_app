import 'package:flutter/material.dart';

class CustomAppRoute {
  // * Routes:

  static const String homeScreen = "/";
  static const String errorScreen = "/error";
  static const String summaryScreen = "/summary";

  // * Go to route:

  static Route goToRoute(dynamic screen, String routeName) {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName), builder: (context) => screen);
  }
}
