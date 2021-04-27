import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BotNavBar extends StatefulWidget {
  @override
  _BotNavBarState createState() => _BotNavBarState();
}

class _BotNavBarState extends State<BotNavBar> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Text('Home'), //can change from Text to class home when page home finish
    Text('Cart'),
    Text('Search'),
    Text('Profile'),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (BottomNavigationBar(
      unselectedItemColor: Colors.white54,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xFF282424),
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      currentIndex: _selectedIndex,
      selectedLabelStyle: GoogleFonts.montserrat(),
      selectedItemColor: Color(0xFFFEC10E),
      onTap: _onItemTap,
    ));
  }
}
