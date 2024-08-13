import 'dart:convert';

import 'package:coffe/coffeedetails.dart';
import 'package:coffe/detail.dart';
import 'package:coffe/list.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Coffee extends StatefulWidget {
  
  Coffee({super.key});

  @override
  State<Coffee> createState() => _Coffee();
}



class _Coffee extends State<Coffee> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coffees',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Column(children: [
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 0,
                mainAxisSpacing: 30,
                childAspectRatio: 1.5,
              ),
              itemCount: list().assetss.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailPage(
                                  imagePath: list().assetss[index],
                                  coffeeName: list().coffees[index],
                                  dt: list().ab[index],
                                )));
                  },
                  child: Hero(
                    tag: list().assetss[index],
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey,
                          image: DecorationImage(
                            image: AssetImage(list().assetss[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 1),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.45,
                                height: MediaQuery.of(context).size.height * 0.03,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white),
                                child: Center(
                                  child: Text(
                                    list().coffees[index],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                );
              },
            ),
          ),
        )
      ]),
    );
  }
}
