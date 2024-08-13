import 'package:coffe/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homee.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}


class _splashState extends State<splash> with SingleTickerProviderStateMixin{

  @override
  void initState() {
    super.initState();
    Navigation();
  }

  Navigation()async{
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => homee()));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/co3.png'),
        ],
      ),
    );
  }
}
