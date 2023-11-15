import 'package:flutter/material.dart';

import '../features/splash.dart';

class RouteHandler {
  static String initialRoute = SplashScreen.routeName;

  static Map<String, Widget Function(BuildContext)> routes = {

  };

  static Route<dynamic>? generatedRoute(RouteSettings route) {
    switch (route.name) {

      // case SignUpEmailScreen.routeName:
      //   final args = route.arguments as RegistrationIdResponse;
      //   return MaterialPageRoute(builder: (context) {
      //     return SignUpEmailScreen(regResponse: args);
      //   });

      default:
        return null;
    }
  }
}
