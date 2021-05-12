import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ssh_mobile/Screen/order.dart';
import 'package:ssh_mobile/transitions/fade_transition.dart';
import '../providers/auth.dart';
import '../widgets/appbar.dart';
import '../widgets/bottomNavigationBar.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  static const routeName = '/profile';

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Map profile;
  bool isLoaded = false;

  @override
  void initState() {
    Provider.of<Auth>(context, listen: false).getUserProfile().then((value) {
      setState(() {
        profile = value;
        isLoaded = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    @override
    var _mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: SSHAppBar(),
      body: isLoaded
          ? Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      height: _mediaQuery.size.height * 0.3,
                      width: _mediaQuery.size.width * 0.5,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: profile['picture'] == null
                          ? Align(
                              alignment: Alignment.center,
                              child: Text('No Profile Picture',
                                  style: GoogleFonts.montserrat()))
                          : Image.memory(
                              Uint8List.fromList(profile['picture'].toList()))),
                  SizedBox(height: 10),
                  Text("${profile['firstName']} ${profile['lastName']}",
                      style: GoogleFonts.montserrat().copyWith(
                        color: Colors.black,
                        fontSize: 30,
                      )),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${profile['phone_num']}",
                          style: GoogleFonts.montserrat().copyWith(
                            color: Colors.black,
                            fontSize: 20,
                          )),
                      Text("${profile['email']}",
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
                          Text(
                              "${profile['address']}, ${profile['sub_district']}, ${profile['district']}, ${profile['province']}, ${profile['country']}, ${profile['zip_code']}",
                              style: GoogleFonts.montserrat().copyWith(
                                color: Colors.black,
                                fontSize: 20,
                              ))
                        ],
                      )),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context, FadeRoute(page: Order()));
                      },
                      child: Text('see order'))
                ],
              ))
          : Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                        alignment: Alignment.center,
                        child: Text('Loading Profile',
                            style: GoogleFonts.montserrat().copyWith(
                                fontSize: 45, fontWeight: FontWeight.bold)))
                  ]),
            ),
      bottomNavigationBar: BotNavBar(selectedIndex: 3),
    );
  }
}
