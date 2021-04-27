import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ssh_mobile/constant.dart';


import './categories_slider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              child: Text(
                "Categories",
                style: GoogleFonts.montserrat()
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
          ],
        ),
        CategoriesSlider()
      ],
    );
  }
}
