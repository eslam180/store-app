import 'package:firebase_auth/firebase_auth.dart';
import 'package:flower_app/costants.dart';
import 'package:flower_app/views/checkout_view.dart';
import 'package:flower_app/views/home_view.dart';
import 'package:flower_app/views/profile_page.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Color(0xff67548E)),
            accountName: Text(
              FirebaseAuth.instance.currentUser?.displayName ?? 'user',
              style: const TextStyle(fontSize: 18),
            ),
            accountEmail: Text(
              FirebaseAuth.instance.currentUser?.email ?? 'No Email',
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 40, color: kprimaryColor),
            ),
          ),

          ListTile(
            leading: Icon(Icons.home, color: kprimaryColor),
            title: Text(
              'Home',
              style: TextStyle(fontSize: 16, color: kprimaryColor),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),

          ListTile(
            leading: Icon(Icons.person, color: kprimaryColor),
            title: Text(
              'Profile Page',
              style: TextStyle(fontSize: 16, color: kprimaryColor),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.logout, color: Colors.redAccent),
            title: const Text(
              'Logout',
              style: TextStyle(fontSize: 16, color: Colors.redAccent),
            ),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}
