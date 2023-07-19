import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_student_app/onboarding_screen.dart';
import 'package:test_student_app/register_page.dart';
import 'package:test_student_app/splash_screen.dart';

import 'home_page.dart';
import 'landing_page.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter student app',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      routes: {
           'loginPage': (context) => LandingPage(),
           'registerPage': (context) => RegisterPage(),
           'homePage':(context) => HomePage(),
           'boarding':(context) => onBoardingScreen(),
      },
      home: SplashScreen()//LandingPage(),
    );
  }
}

