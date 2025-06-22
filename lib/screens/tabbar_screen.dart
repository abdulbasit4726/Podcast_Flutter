import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:podcast_flutter/screens/downloads_screen.dart';

import 'package:podcast_flutter/screens/favorites_screen.dart';
import 'package:podcast_flutter/screens/search_screen.dart';

class TabbarScreen extends StatefulWidget {
  const TabbarScreen({super.key});

  @override
  State<TabbarScreen> createState() => _TabbarScreenState();
}

class _TabbarScreenState extends State<TabbarScreen> {
  // int _selectedIndex = 0;

  final List<Widget> _screens = [
    const SearchScreen(),
    const FavoritesScreen(),
    const DownloadsScreen(),
  ];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: Colors.purple,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            activeIcon: Icon(Icons.search_outlined),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorites',
            activeIcon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download),
            label: 'Downloads',
          ),
        ],
      ),
      tabBuilder: (ctx, index) {
        return CupertinoTabView(
          builder: (context) {
            return _screens[index];
          },
        );
      },
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: _screens[_selectedIndex],
  //     bottomNavigationBar: BottomNavigationBar(
  //       currentIndex: _selectedIndex,
  //       onTap: _onItemTapped,
  //       items: const [
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.search),
  //           label: 'Search',
  //           activeIcon: Icon(Icons.search_outlined),
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.favorite_border),
  //           label: 'Favorites',
  //           activeIcon: Icon(Icons.favorite),
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.download),
  //           label: 'Downloads',
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
