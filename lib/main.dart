import 'package:flutter/material.dart';
import 'screens/splasscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Route Contacts',
      theme: ThemeData(
        primaryColor: Color(0xFF29384D),
        scaffoldBackgroundColor: Color(0xFF29384D),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF29384D),
          titleTextStyle: TextStyle(
            color: Color(0xFFFFF1D4),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: SplashScreen(),
    );
  }
}