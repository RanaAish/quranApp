import 'package:flutter/material.dart';

class background_splach extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0, right: 30, left: 30),
      child: Center(
        child: Image(
          image: AssetImage("assets/images/splach_background.png"),
          height: 420,
          width: 314,
        ),
      ),
    );
  }
}