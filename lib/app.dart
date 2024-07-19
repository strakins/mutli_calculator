import 'package:calculator/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Strakins Loan Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue, 
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
