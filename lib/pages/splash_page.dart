import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:my_first_app/pages/first_page.dart';

class SplashScreen extends StatelessWidget{
  const SplashScreen({super.key});

  get splash => null;

  @override
  Widget build(BuildContext context){
    return AnimatedSplashScreen(splash: 
    Column(
      children: [
        Center(
          child: LottieBuilder.asset("assets/start.json"),
        )
      ]
    ),
     nextScreen: FirstPage(),
     splashIconSize: 400,
     backgroundColor: Color.fromARGB(255, 255, 255, 255),
    );
  }
}