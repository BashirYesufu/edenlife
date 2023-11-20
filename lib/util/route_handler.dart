import 'package:eden/core/models/order_status.dart';
import 'package:eden/features/order_screen.dart';
import 'package:flutter/material.dart';
import '../features/onboarding.dart';
import '../features/order_timeline.dart';
import '../features/splash.dart';

class RouteHandler {
  static String initialRoute = SplashScreen.routeName;

  static Map<String, Widget Function(BuildContext)> routes = {
    SplashScreen.routeName: (context) => SplashScreen(),
    OnboardingScreen.routeName: (context) => OnboardingScreen(),
    OrderScreen.routeName: (context) => OrderScreen(),
  };

  static Route<dynamic>? generatedRoute(RouteSettings route) {
    switch (route.name) {

      case OrderTimelineScreen.routeName:
        final args = route.arguments as OrderStatus;
        return MaterialPageRoute(builder: (context) {
          return OrderTimelineScreen(orderStatus: args);
        });

      default:
        return null;
    }
  }
}
