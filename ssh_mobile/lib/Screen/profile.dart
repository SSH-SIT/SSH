import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/appbar.dart';
import '../widgets/bottomNavigationBar.dart';

class Profile extends StatelessWidget {
  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: SSHAppBar(),
      body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          child: Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: _mediaQuery.size.height * 0.3,
                  width: _mediaQuery.size.width * 0.5,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(80),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/Clitoral.png')))),
              SizedBox(height: 10),
              Text('Name',
                  style: GoogleFonts.montserrat().copyWith(
                    color: Colors.black,
                    fontSize: 30,
                  )),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('012-345-6789',
                      style: GoogleFonts.montserrat().copyWith(
                        color: Colors.black,
                        fontSize: 20,
                      )),
                  Text('mail@mail.com',
                      style: GoogleFonts.montserrat().copyWith(
                        color: Colors.black,
                        fontSize: 20,
                      )),
                ],
              ),
              SizedBox(height: 30),
              Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Address',
                          style: GoogleFonts.montserrat().copyWith(
                            decoration: TextDecoration.underline,
                            color: Colors.black,
                            fontSize: 25,
                          )),
                      SizedBox(height: 25),
                      Text('Address Info',
                          style: GoogleFonts.montserrat().copyWith(
                            color: Colors.black,
                            fontSize: 20,
                          ))
                    ],
                  ))
            ],
          ))),
      bottomNavigationBar: BotNavBar(selectedIndex: 3),
    );
  }
}
