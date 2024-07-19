import 'package:flutter/material.dart';

class HeroBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  // final String pagedescroption;
  final double barHeight = 50.0;
  
  HeroBar({
    required this.title, 
    // required this.pagedescription
  });

  @override
  Widget build(BuildContext context) {
    final double statusbarHeight = MediaQuery
      .of(context)
      .padding
      .bottom;
    return AppBar(
      title: Column(
        children: [
          Row(
            children: [
              Image.asset('assests/strakins_logo.png', height: 50.0), // Ensure you have the logo in the assets folder
              SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          // SizedBox(width: 20),
          // Text(
          //   pagedescroption,
          //   style: TextStyle(),
          // ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
