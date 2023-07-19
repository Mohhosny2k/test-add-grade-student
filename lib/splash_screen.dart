import 'package:flutter/material.dart';

import 'constants.dart';





class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool first = true;
  @override
  void didChangeDependencies() async {
    if (first) {
      first = false;
      await Future.delayed(Duration(seconds: 3), () async {
        Navigator.pushNamed(context, 'boarding');
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:kPrimaryColorTwo,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Image.asset(
                  'assets/images/scholar.png',
                  height: 100,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Student Data',
                      //  textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                         ),
                    ),
                  ],
                ),
       
     
        ],
      ),
    );
  }
}
