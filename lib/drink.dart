import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class drink extends StatefulWidget {
  const drink({super.key});

  @override
  State<drink> createState() => _drinkState();
}

class _drinkState extends State<drink> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(child: Text('drink me until to happy')),
    );
  }
}
