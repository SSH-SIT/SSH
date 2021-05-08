import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(
        'Loading',
        style: GoogleFonts.montserrat()
            .copyWith(fontSize: 45, fontWeight: FontWeight.bold),
      ),
    ));
  }
}
