import 'package:calculator/pages/main_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Get.off(MainMenu());
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assests/strakins_logo.png"),
            const Text(
              'Welcome to Strakins',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700
              ),
            ),
            const Text(
              'Loan/Investment Calculator',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
