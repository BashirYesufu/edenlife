import 'package:flutter/material.dart';

/// This provides routing in the app
class EdenNavigator {

  /// This function navigates to the specified routeName,
  /// you can also pass arguments to the next screen.
  /// If the arguments parameter is null it does not pass information to the next screen.
  static Future<dynamic> navigateTo(BuildContext context, String routeName, {arguments}) {
    if (arguments != null) {
      return Navigator.pushNamed(context, routeName, arguments: arguments);
    }
    return Navigator.pushNamed(context, routeName);
  }

  static  Future<dynamic> clearAndNavigateTo(BuildContext context, String routeName, {arguments,String endRoute = "/"}) {
    if(Navigator.canPop(context)){
      return Navigator.pushNamedAndRemoveUntil(context, routeName,ModalRoute.withName(endRoute),arguments: arguments);
    }
    return Navigator.pushReplacementNamed(context, routeName,arguments: arguments);
  }

  static void goBack(BuildContext context) => Navigator.pop(context);

  static void popUntil(BuildContext _buildContext, String routeName) => Navigator.popUntil(_buildContext, ModalRoute.withName(routeName));
}
