import 'package:flutter/material.dart';

class MyNavigationPanel extends StatelessWidget {
  final int currentIndex;
  final Function(int) onNavBarTapped;

  const MyNavigationPanel({
    super.key,
    required this.currentIndex,
    required this.onNavBarTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onNavBarTapped,
      selectedItemColor: Colors.deepPurple,
      unselectedItemColor: Colors.deepPurple.shade200,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Books',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: 'Add Books',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
