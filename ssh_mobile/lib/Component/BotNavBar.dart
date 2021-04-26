import 'package:flutter/material.dart';

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
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: _selectedIndex == 0 ? Color(0xFFFEC10E) : Colors.white54,
          ),
          title: Text(
            'Home',
            style: TextStyle(
                color:
                    _selectedIndex == 0 ? Color(0xFFFEC10E) : Colors.white54),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart,
              color: _selectedIndex == 1 ? Color(0xFFFEC10E) : Colors.white54),
          title: Text(
            'Cart',
            style: TextStyle(
                color:
                    _selectedIndex == 1 ? Color(0xFFFEC10E) : Colors.white54),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search,
              color: _selectedIndex == 2 ? Color(0xFFFEC10E) : Colors.white54),
          title: Text(
            'Search',
            style: TextStyle(
                color:
                    _selectedIndex == 2 ? Color(0xFFFEC10E) : Colors.white54),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person,
              color: _selectedIndex == 3 ? Color(0xFFFEC10E) : Colors.white54),
          title: Text(
            'Profile',
            style: TextStyle(
                color:
                    _selectedIndex == 3 ? Color(0xFFFEC10E) : Colors.white54),
          ),
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTap,
    ));
  }
}
