import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BotNavBar extends StatelessWidget {
  BotNavBar({Key key, this.selectedIndex, this.onPageChange}) : super(key: key);

  final selectedIndex;
  final onPageChange;

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
      currentIndex: selectedIndex,
      selectedLabelStyle: GoogleFonts.montserrat(),
      selectedItemColor: Color(0xFFFEC10E),
      onTap: (index) => onPageChange(index),
    ));
  }
}
