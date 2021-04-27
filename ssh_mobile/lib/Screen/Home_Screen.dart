import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ssh_mobile/widgets/body.dart';
import 'package:ssh_mobile/widgets/bottomNavigationBar.dart';

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
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "SSH",
              style: GoogleFonts.montserrat()
                  .copyWith(fontWeight: FontWeight.w900, fontSize: 36),
            ),
          ],
        )));
  }
}
