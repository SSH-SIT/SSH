import 'package:flutter/material.dart';
import 'package:ssh_mobile/providers/products.dart';
import 'package:ssh_mobile/screen/signup_screen.dart';
import 'package:ssh_mobile/screen/splash_screen.dart';

import './screen/cart.dart';
import './screen/product.dart';
import './screen/product_details.dart';
import './screen/profile.dart';
import './screen/order.dart';
import './screen/search.dart';

import './screen/login_screen.dart';

import 'package:provider/provider.dart';
import './providers/auth.dart';
import './providers/cart.dart';
import './providers/products.dart';

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
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (ctx) => Auth()),
          ChangeNotifierProvider(create: (ctx) => CartProvider()),
          ChangeNotifierProvider(create: (ctx) => Products())
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
            home: auth.isAuth
                ? ProductPage()
                : FutureBuilder(
                    future: auth.autoLogin(),
                    builder: (context, authSnapShot) =>
                        authSnapShot.connectionState == ConnectionState.waiting
                            ? SplashScreen()
                            : LoginPage(),
                  ),
            routes: {
              LoginPage.routeName: (context) => LoginPage(),
              SignUp.routeName: (context) => SignUp(),
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
