import 'package:coffe/detail.dart';
import 'package:coffe/home.dart';
import 'package:coffe/homee.dart';
import 'package:coffe/profile.dart';
import 'package:coffe/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splash()
    );
  }
}

