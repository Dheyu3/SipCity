import 'package:coffe/detail.dart';
import 'package:coffe/list.dart';

import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'coffee.dart';
import 'coffeedetails.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body:
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height: 80,),
              Row(
                children: [
                  Text("Welcome to love",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.white)  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text("Let's select the Best taste for your ",style: TextStyle(fontSize: 20,color: Colors.white),),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text("Next Coffe Brack ",style: TextStyle(fontSize: 20,color: Colors.white),),
                ],
              ),
              SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Taest of the Week ",style: TextStyle(fontSize: 25,color: Colors.white),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(child: Text("See all",style: TextStyle(fontSize: 25,color: Colors.white),),
                      onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Coffee(),));
                      })
                  ),
                ],
              ),
              SizedBox(height: 20),

              Container(
                height: 370,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      height: 350,
                      width: 300,
                      color: Colors.brown.shade50,
                      child: Column(
                        children: [
                          Card(
                            color: Colors.brown.shade400,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(list().shops[index],style: TextStyle(fontSize: 15,color: Colors.white),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(list().coffee[index],style: TextStyle(fontSize: 40,color: Colors.white),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(list().about[index],style: TextStyle(fontSize: 20,color: Colors.white),),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(list().price[index],style: TextStyle(fontSize: 30,color: Colors.white),),
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(CupertinoIcons.heart_circle,size: 50,color: Colors.red),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15,),
                          InkWell(
                            onTap: () {
                              Navigator.push(context,MaterialPageRoute(builder: (context) => detail(
                                image: list().assets[index],
                                cName: list().cname[index],
                                cSub: list().csub[index],
                                cDes:list().dcof[index],
                              ),
                              )
                              );
                            },
                            child: Container(
                              child: Text('Order Now',style: TextStyle(fontSize: 30),),
                              height: 55,
                              width: 200,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(borderRadius:BorderRadius.circular(35),color: Colors.green ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text('Categories',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),),
                ],
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.250,
                  aspectRatio: 16/8,
                  viewportFraction: 0.6,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  autoPlayAnimationDuration: Duration(seconds: 1),
                ),
                items: list().cat.map((e) {
                  return Container(
                    child: CircleAvatar(
                      radius: 140,
                      backgroundImage: AssetImage(e),
                    ),
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}