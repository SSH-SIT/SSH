import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:ssh_mobile/widgets/Itemcard.dart';
import 'package:ssh_mobile/constant.dart';

import '../constant.dart';
import '../widgets/categories_slider.dart';
import 'package:ssh_mobile/models/product.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int productIndex = 0;

  void onCatChange(int index) {
    setState(() {
      productIndex = index;
    });
  }

  List<Product> getProduct(int productIndex) {
    if (productIndex == 0)
      return products;
    else if (productIndex == 1)
      return critoral;
    else if (productIndex == 2)
      return clit;
    else if (productIndex == 3) return dildos;

    return [];
  }

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
        CategoriesSlider(
          productIndex: productIndex,
          onPageChange: onCatChange,
        ),
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
                  Itemcard(product: getProduct(productIndex)[index]),
            ),
          ),
        ),
      ],
    );
  }
}
