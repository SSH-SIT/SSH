import 'package:flutter/material.dart';
import './screen/home_screen.dart';
import './screen/login_screen.dart';

import 'package:provider/provider.dart';
import './providers/auth.dart';

import 'constant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (ctx) => Auth()),
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
              home: auth.isAuth ? HomeScreen() : LoginPage()),
        ));
  }
}
