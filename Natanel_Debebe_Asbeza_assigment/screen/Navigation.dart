import 'package:flutter/material.dart';

class Navigation extends StatelessWidget {
  const Navigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex:0,
      onTap: (index){},
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home),label:'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.history),label:'History'),
        BottomNavigationBarItem(icon: Icon(Icons.person),label:'Account'),
      ],
    );
  }
}
