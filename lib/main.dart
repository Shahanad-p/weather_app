import 'package:flutter/material.dart';
import 'package:weather_app/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent, elevation: 0),
          iconTheme: IconThemeData(color: Colors.white, size: 30)),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
