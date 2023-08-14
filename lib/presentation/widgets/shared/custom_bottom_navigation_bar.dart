import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home_max), label: 'Home'),
      BottomNavigationBarItem(
          icon: Icon(Icons.label_outlined), label: 'Categories'),
      BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites')
    ],
    );
  }
}
