import 'package:flutter/material.dart';
import 'package:orange_interview/core/shared/constants.dart';
import 'package:orange_interview/features/presentation/authentication/screens/login_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:orange_interview/features/presentation/main_layout/screens/main_layout_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        backgroundColor: Colors.black,
        splash: Image.asset('assets/images/app_logo.png'),
        nextScreen: userToken != '' ? MainLayoutScreen() : LoginScreen(),
        animationDuration: const Duration(seconds: 2),
        splashTransition: SplashTransition.slideTransition,
        curve: Curves.easeInBack,
      ),
    );
  }
}
