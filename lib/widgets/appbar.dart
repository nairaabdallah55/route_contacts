import 'package:flutter/material.dart';

class IntroAppBar extends StatelessWidget {
  const IntroAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Center(
        child: Image.asset(
          "assets/images/logo.png",
          height: 151,
        ),
      ),
    );
  }
}