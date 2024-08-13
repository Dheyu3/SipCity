import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  List<Map<String, String>> favorites = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favoriteList = prefs.getStringList('favorites') ?? [];
    List<Map<String, String>> tempFavorites = [];

    for (String favorite in favoriteList) {
      Map<String, String> favoriteMap = Map<String, String>.from(jsonDecode(favorite));
      tempFavorites.add(favoriteMap);
    }

    setState(() {
      favorites = tempFavorites;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            elevation: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Fixed size for the image with proper constraints
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.22,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(favorites[index]['imagePath']!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(35),
                  child: Text(
                    'Coffee Name: ${favorites[index]['coffeeName']}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
