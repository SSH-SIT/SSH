import 'package:flutter/material.dart';
import 'package:ssh_mobile/Component/Body.dart';
import 'package:ssh_mobile/Component/BotNavBar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: buildAppBar(),
        body: Center(child: Body()),
        bottomNavigationBar: BotNavBar(),
      ),
    );
  }

  AppBar buildAppBar() {
    return (AppBar(
      backgroundColor: Color(0xFFFEC10E),
      textTheme: TextTheme(headline6: TextStyle(color: Colors.black)),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () {},
      ),
      title: Text(
        "SSH",
        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 36),
      ),
      centerTitle: true,
    ));
  }
}
