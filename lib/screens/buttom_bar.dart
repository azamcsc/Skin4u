import 'package:customers_app/screens/home_screen.dart';
import 'package:customers_app/screens/home_screen1.dart';
import 'package:customers_app/screens/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/dark_theme_provider.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> _pages = [
    {
      'page': const HomeScreen1(),
      'title': 'Home',
    },
    {
      'page': HomeScreen1(),
      'title': 'Categories',
    },
    {
      'page': const HomeScreen1(),
      'title': 'Cart',
    },
    {
      'page': const UserScreen(),
      'title': 'user',
    },
  ];

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool _isDark = themeState.getDarkTheme;
    return Scaffold(
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: _isDark ? Theme.of(context).cardColor : Colors.white,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        unselectedItemColor: _isDark ? Colors.white70 : Colors.black12,
        selectedItemColor: _isDark ? Colors.lightBlue.shade500 : Colors.lightBlue.shade500,
        onTap: _selectedPage,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "User",
          ),
        ],
      ),
    );
  }
}
