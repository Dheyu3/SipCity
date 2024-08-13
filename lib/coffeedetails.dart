import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:coffe/order.dart';
import 'dart:convert';

import 'list.dart';

class DetailPage extends StatefulWidget {
  final String imagePath;
  final String coffeeName;
  final String dt;

  DetailPage({required this.imagePath, required this.coffeeName, required this.dt});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    _loadFavoriteStatus();
  }

  Future<void> _loadFavoriteStatus() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favoriteList = prefs.getStringList('favorites') ?? [];

    Map<String, String> currentItem = {
      'imagePath': widget.imagePath,
      'coffeeName': widget.coffeeName,
    };

    String currentItemJson = jsonEncode(currentItem);

    setState(() {
      isFavorite = favoriteList.contains(currentItemJson);
    });
  }

  Future<void> _toggleFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favoriteList = prefs.getStringList('favorites') ?? [];

    print(favoriteList);
    Map<String, String> newFavorite = {
      'imagePath': widget.imagePath,
      'coffeeName': widget.coffeeName,
    };

    String favoriteJson = jsonEncode(newFavorite);

    if (favoriteList.contains(favoriteJson)) {
      favoriteList.remove(favoriteJson);
    } else {
      favoriteList.add(favoriteJson);
    }

    await prefs.setStringList('favorites', favoriteList);

    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Details",
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100),
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 1,
              child: Hero(
                tag: widget.imagePath,
                child: Image.asset(widget.imagePath),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Text(
                widget.coffeeName,
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(widget.dt,style: TextStyle(fontSize: 20,color: Colors.black
              ),),
            ),
            SizedBox(height: 5),
            IconButton(
              icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
              color: isFavorite ? Colors.red : null,
              onPressed: _toggleFavorite,
            ),
            SizedBox(height: 30),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => order(
                        cimage: widget.imagePath,
                        cname: widget.coffeeName,
                      ),
                    ),
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.brown,
                  ),
                  child: Center(
                    child: Text(
                      'Order Now',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
