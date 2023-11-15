import 'package:eden/util/eden_navigator.dart';
import 'package:fade_out_particle/fade_out_particle.dart';
import 'package:flutter/material.dart';
import 'onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static final routeName = "/splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
          height: height,
          width: width,
          color: Colors.black,
          padding: const EdgeInsets.all(0.0),
          margin: const EdgeInsets.all(0.0),
          child: Center(
            child: FadeOutParticle(
              disappear: true,
              curve: Curves.easeIn,
              duration: Duration(milliseconds: 1500),
              child:  Text('Edenlife'),
              onAnimationEnd: (){
                processLoginStatus();
              },
            ),
          )
      ),
    );
  }

  processLoginStatus() async{
      EdenNavigator.clearAndNavigateTo(context, OnboardingScreen.routeName);
  }
}