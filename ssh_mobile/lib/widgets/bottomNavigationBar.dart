import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ssh_mobile/screen/cart.dart';
import 'package:ssh_mobile/screen/product.dart';
import 'package:ssh_mobile/screen/profile.dart';
import 'package:ssh_mobile/screen/search.dart';
import 'package:ssh_mobile/transitions/fade_transition.dart';

class BotNavBar extends StatelessWidget {
  BotNavBar({Key key, this.selectedIndex}) : super(key: key);

  final selectedIndex;

  Widget onPageChange(int index) {
    // if (index == 0) {
    //   return ProductPage.routeName;
    // } else if (index == 1) {
    //   return Cart.routeName;
    // } else if (index == 2) {
    //   return Search.routeName;
    // } else if (index == 3) {
    //   return Profile.routeName;
    // }

    if (index == 0) {
      return ProductPage();
    } else if (index == 1) {
      return Cart();
    } else if (index == 2) {
      return Search();
    } else if (index == 3) {
      return Profile();
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
            unselectedItemColor: Colors.white54,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color(0xFF282424),
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: 'Cart'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ],
            currentIndex: selectedIndex,
            selectedLabelStyle: GoogleFonts.montserrat(),
            selectedItemColor: Color(0xFFFEC10E),
            onTap: (index) => Navigator.pushReplacement(
                context, FadeRoute(page: onPageChange(index)))));
  }
}
