import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:ssh_mobile/constant.dart';

import '../constant.dart';
import '../constant.dart';
import '../constant.dart';
import '../constant.dart';
import '../constant.dart';
import '../constant.dart';
import './categories_slider.dart';
import 'package:ssh_mobile/models/product.dart';

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
        CategoriesSlider(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: GridView.builder(
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: kDefaultPaddin,
                crossAxisSpacing: kDefaultPaddin,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) =>
                  Itemcard(product: products[index]),
            ),
          ),
        ),
      ],
    );
  }
}

class Itemcard extends StatelessWidget {
  final Product product;
  final Function press;
  const Itemcard({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(kDefaultPaddin),

          // height: 180,
          // width: 160,
          decoration: BoxDecoration(
            color: product.color,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Image.asset(product.image),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
          child: Text(
            product.name,
            style: TextStyle(color: kTextLightColor),
          ),
        ),
        Text(
          "\$111",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
