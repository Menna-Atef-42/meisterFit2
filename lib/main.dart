import 'package:flutter/material.dart';
import 'package:fluttercourse/auth/Login/login_gym.dart';
import 'package:fluttercourse/auth/Register/sign_in_1.dart';
import 'package:fluttercourse/auth/Register/sign_in_2.dart';
import 'package:fluttercourse/customs/custom_formField.dart';
import 'package:fluttercourse/screens/dashboard/homeIcon.dart';
import 'package:fluttercourse/screens/dashboard/dashboard_main.dart';
import 'package:fluttercourse/screens/dashboard/profileIcone.dart';
import 'package:fluttercourse/screens/front_screen.dart';
import 'package:fluttercourse/screens/gender_screen.dart';
import 'package:fluttercourse/screens/dashboard/heartIcon.dart';
import 'package:fluttercourse/screens/dashboard/ironIcon.dart';
import 'package:fluttercourse/utils/routes.dart';
import 'package:fluttercourse/screens/intro_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.dashScreen,
      routes: {
        AppRoutes.homeIcon: (context) => Homeicon(),
        AppRoutes.introScreen: (context) => IntroScreen(),
        AppRoutes.heartIcon: (context) => Hearticon(),
        AppRoutes.ironIcon: (context) => Ironicon(),
        AppRoutes.profileIcon: (context) => Profileicone(),
        AppRoutes.signIn1: (context) => SignIn1(),
        AppRoutes.signIn2: (context) => SignIn2(),
        AppRoutes.customFormField: (context) => CustomFormfield(filled: null),
        AppRoutes.login: (context) => Login(),
        AppRoutes.genderScreen: (context) => GenderScreen(),
        AppRoutes.frontScreen: (context) => FrontScreen(),
        AppRoutes.dashScreen: (context) => DashboardMain(),
      },
    );
  }
}