import 'package:flutter/material.dart';
import 'package:meemus_delivery_service/screens/bottom_tabs/favorite_screen.dart';
import 'package:meemus_delivery_service/screens/bottom_tabs/location_screen.dart';
import 'package:meemus_delivery_service/screens/bottom_tabs/menu_screen.dart';

import 'bottom_tabs/cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> bottomScreens = const [
    MenuScreen(),
    LocationScreen(),
    FavoriteScreen(),
    CartScreen(),
  ];

  int _selectedScreen = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: bottomScreens.elementAt(_selectedScreen),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: _selectedScreen,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.pink.shade300,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: '',
          ),
        ],
      ),
    );
  }
}
