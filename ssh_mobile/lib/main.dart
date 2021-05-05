import 'package:flutter/material.dart';

import 'package:ssh_mobile/screen/cart.dart';
import 'package:ssh_mobile/screen/product.dart';
import 'package:ssh_mobile/screen/product_details.dart';
import 'package:ssh_mobile/screen/profile.dart';
import 'package:ssh_mobile/screen/order.dart';
import 'package:ssh_mobile/screen/search.dart';

import './widgets/appbar.dart';
import 'package:ssh_mobile/widgets/bottomNavigationBar.dart';

import './screen/login_screen.dart';

import 'package:provider/provider.dart';
import './providers/auth.dart';
import './providers/cart.dart';

import 'constant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SSH();
  }
}

class SSH extends StatefulWidget {
  @override
  _SSHstate createState() => _SSHstate();
}

class _SSHstate extends State<SSH> {
  int selectedIndex = 0;

  void onPageChange(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = [
      ProductPage(selectedIndex: selectedIndex, onPageChange: onPageChange),
      Cart(),
      Search(),
      Profile(),
    ];

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (ctx) => Auth()),
          ChangeNotifierProvider(create: (ctx) => CartProvider())
        ],
        child: Consumer<Auth>(
          builder: (context, auth, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'SSH',
            theme: ThemeData(
              textTheme:
                  Theme.of(context).textTheme.apply(bodyColor: kTextColor),
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: auth.isAuth ? ProductPage() : LoginPage(),
            routes: {
              LoginPage.routeName: (context) => LoginPage(),
              ProductPage.routeName: (context) => ProductPage(),
              ProductDetails.routeName: (context) => ProductDetails(),
              Cart.routeName: (context) => Cart(),
              Profile.routeName: (context) => Profile(),
              Order.routeName: (context) => Order(),
              Search.routeName: (context) => Search()
            },
          ),
        ));
  }
}
