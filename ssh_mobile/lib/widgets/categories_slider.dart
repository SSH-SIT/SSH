import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constant.dart';

class CategoriesSlider extends StatefulWidget {
  CategoriesSlider({Key key, this.productIndex, this.onPageChange})
      : super(key: key);
  final productIndex;
  final onPageChange;
  @override
  _CategoriesSliderState createState() => _CategoriesSliderState();
}

class _CategoriesSliderState extends State<CategoriesSlider> {
  List<String> categories = [
    "Wand Vibrators",
    "Clitoral Vibrator",
    "Clit Suction Toys",
    "Dildos",
    "Butt Plugs",
    "G-spot Toys",
    "A-spot Toys",
    "Rabbit Vibrators",
    "Prostate Toys",
    "Anal Beads",
    "Cock Rings",
    "Glass and Metal Wands",
    "Condom",
    "Lubricating Gel"
  ];

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) =>
                buildCategory(index, widget.onPageChange)),
      ),
    );
  }

  Widget buildCategory(int index1, final onCatChange) {
    return GestureDetector(
      onTap: () {
        onCatChange(index1);
        setState(() {
          selectedIndex = index1;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              categories[index1],
              style: GoogleFonts.montserrat().copyWith(
                fontWeight: FontWeight.bold,
                color: selectedIndex == index1 ? kTextColor : kTextLightColor,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: kDefaultPaddin / 4), // top padding
              height: 2,
              width: 30,
              color:
                  selectedIndex == index1 ? Colors.black : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
