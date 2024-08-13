import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background Image with Gradient Overlay
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/cc4.jpg"), // Replace with your asset path
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.2),
                  ],
                ),
              ),
            ),
          ),
          // Profile Content
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 100),
                // Profile assetsture
                Center(
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage('assets/s3.jfif'), // Replace with your asset path
                  ),
                ),
                SizedBox(height: 20.0),
                // Name
                Text(
                  'John Doe',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10.0),
                // Email
                Text(
                  'johndoe@example.com',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: 30.0),
                // Information Cards
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Opacity(
                      opacity: _isVisible ? 1.0: 00,
                    child: Card(
                      color: Colors.greenAccent.withOpacity(0.3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 5.0,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: Icon(Icons.person,color: Colors.greenAccent.shade400,),
                              title: Text('Username',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
                              subtitle: Text('johndoe',style: TextStyle(color: Colors.white,fontSize: 17),),
                            ),
                            Divider(),
                            ListTile(
                              leading: Icon(Icons.phone,color: Colors.greenAccent.shade400,),
                              title: Text('Phone',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
                              subtitle: Text('+123 456 7890',style: TextStyle(color: Colors.white,fontSize: 17),),
                            ),
                            Divider(),
                            ListTile(
                              leading: Icon(Icons.location_city,color: Colors.greenAccent.shade400),
                              title: Text('Location',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
                              subtitle: Text('New York, USA',style: TextStyle(color: Colors.white,fontSize: 17),),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                // Settings and Logout Buttons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ElevatedButton.icon(
                        onPressed: () {
                          // Handle settings button press
                        },
                        icon: Icon(Icons.settings),
                        label: Text('Settings'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.brown, // Background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          // Handle logout button press
                        },
                        icon: Icon(Icons.logout),
                        label: Text('Logout'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red, // Background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

