import 'package:coffe/home.dart';
import 'package:flutter/material.dart';
import 'list.dart';
class detail extends StatefulWidget {
  const detail({super.key, required this.image, required this.cName, required this.cSub, required this.cDes});

  final String image;
  final String cName;
  final String cSub;
  final String cDes;

  @override
  State<detail> createState() => _detailState();
}

class _detailState extends State<detail> {

  int selectedSize = 0;
  int selectedType = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
    body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              child: Image(
                image: AssetImage(widget.image),
                height: 400,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 300,
            left: 10,
            child: Column(
              children: [
                Text(
                  widget.cName,
                  style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  widget.cSub,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )
              ],
            ),
          ),
          Positioned(
            top: 60,
            right: 25,
            child: Icon(Icons.favorite_sharp, color: Colors.white, size: 40),
          ),
          Positioned(
            top: 60,
            left: 25,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context, MaterialPageRoute(builder: (context) => home()));
              },
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
          Positioned(
            top: 370,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(29),
              ),
              height: 700,
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 45),
                    child: SizedBox(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: list().size.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedType = index;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: selectedType == index ? Colors.green : Colors.brown,
                              ),
                              child: Center(
                                child: Text(
                                  list().type[index],
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 10),
                    child: Text(
                      'Coffee Size',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 45, top: 20),
                    child: SizedBox(
                      height: 50,
                      child: ListView.builder(
                        itemCount: list().size.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = index;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              height: 50,
                              width: 125,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: selectedSize == index ? Colors.green : Colors.brown,
                              ),
                              child: Center(
                                child: Text(
                                  list().size[index],
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 10),
                    child: Text(
                      'About',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 30),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 20),
                    child: Text(
                      widget.cDes,
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: Container(
                      height: 60,
                      width: 250,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.brown),
                      child: Center(child: Text('Order', style: TextStyle(fontSize: 30))),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
