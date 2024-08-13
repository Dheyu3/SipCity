import 'package:coffe/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coffee.dart';
import 'favorites.dart';
import 'home.dart';

class homee extends StatefulWidget {
  const homee({super.key});

  @override
  State<homee> createState() => _homeeState();
}

class _homeeState extends State<homee> {
  int index= 0;
  final screens = [
    home(),
    Coffee(),
    Favorites(),
    profile(),


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:screens[index],
      bottomNavigationBar:
      NavigationBarTheme(
        data: NavigationBarThemeData(
            labelTextStyle: MaterialStateProperty.all(TextStyle(fontSize: 20))
        ),
        child: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: (index) =>
              setState(() => this.index = index),
          destinations: [
            NavigationDestination(icon: Icon(CupertinoIcons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.coffee), label: 'coffee'),
            NavigationDestination(icon: Icon(CupertinoIcons.heart_solid), label: 'Favorites'),
            NavigationDestination(icon: Icon(CupertinoIcons.profile_circled), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
