import 'package:flower_app/costants.dart';
import 'package:flower_app/views/home_view.dart';
import 'package:flower_app/views/profile_page.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;

  final List<Widget> pages = [HomeView(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: kprimaryColor,
        onTap: (index) async {
          setState(() => currentIndex = index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: kprimaryColor),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: kprimaryColor),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
