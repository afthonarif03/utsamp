import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(255, 230, 126, 23), Color.fromARGB(255, 121, 222, 14)],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DashboardItem(icon: Icons.home, label: 'Home'),
              DashboardItem(icon: Icons.settings, label: 'Settings'),
              InkWell(
                onTap: () {
                  // Ketika ikon "Profile" diklik, navigasikan ke tampilan profil dengan data
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ));
                },
                child: DashboardItem(icon: Icons.person, label: 'Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardItem extends StatelessWidget {
  final IconData icon;
  final String label;

  DashboardItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Icon(
                icon,
                size: 150,
                color: Color.fromARGB(255, 121, 5, 5),
              ),
              SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        backgroundColor: const Color.fromARGB(255, 253, 253, 253), // Ganti warna latar belakang sesuai kebutuhan
      ),
      body: Container(
        color: Color.fromARGB(255, 103, 4, 4),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 40),
              CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('assets/afthonarif.jpg'),
              ),
              const SizedBox(height: 40),
              itemProfile('Name', 'Afthon Arif', CupertinoIcons.person),
              const SizedBox(height: 10),
              itemProfile('NPM', '21670038', CupertinoIcons.list_number),
              const SizedBox(height: 10),
              itemProfile('Phone', '082324955704', CupertinoIcons.phone),
              const SizedBox(height: 10),
              itemProfile(
                  'Email', 'afthonarif@gmail.com', CupertinoIcons.mail),
              const SizedBox(height: 10),
              itemProfile(
                  'Club Favorite', 'Manchester United FC', CupertinoIcons.heart),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 5),
                color: Colors.black,
                spreadRadius: 2,
                blurRadius: 10)
          ]),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        trailing: Icon(Icons.arrow_forward, color: Colors.black),
        tileColor: Colors.black,
      ),
    );
  }
}
