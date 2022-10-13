import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants.dart';

import '../widgets/custom_add_icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: backgroundColor,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            // ignore: avoid_print
            print(currentIndex);
          });
        },
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 25,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 25,
            ),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: CustomAddIcon(),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
              size: 25,
            ),
            label: "Message",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 25,
            ),
            label: "Profile",
          ),
        ],
      ),
      body: Center(child: pageIndex[currentIndex]),
    );
  }
}
