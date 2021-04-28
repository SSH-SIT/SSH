import 'package:flutter/material.dart';
import 'package:ssh_mobile/Screen/product_page.dart';

import 'package:ssh_mobile/widgets/bottomNavigationBar.dart';
import './screen/login_screen.dart';

import './widgets/appbar.dart';

import 'package:provider/provider.dart';
import './providers/auth.dart';

import 'constant.dart';

void main() {
  runApp(MyApp());
}
//test test test

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
  List<Widget> _widgetOptions = [
    ProductPage(),
    Text('Yo2'),
    Text('Yo3'),
    Text('Yo4'),
  ];

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
                  ? Scaffold(
                      appBar: SSHAppBar(),
                      body: _widgetOptions.elementAt(selectedIndex),
                      bottomNavigationBar: BotNavBar(
                        selectedIndex: selectedIndex,
                        onPageChange: onPageChange,
                      ),
                    )
                  : LoginPage()),
        ));
  }
}
