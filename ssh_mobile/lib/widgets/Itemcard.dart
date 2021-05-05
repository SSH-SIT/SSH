import 'package:flutter/material.dart';
import 'package:ssh_mobile/models/product.dart';
import 'package:ssh_mobile/screen/product_details.dart';

import '../constant.dart';

class Itemcard extends StatelessWidget {
  final Product product;
  final Function press;

  const Itemcard({Key key, this.product, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(ProductDetails.routeName, arguments: {
                  'id': product.id,
                });
              },
              child: Container(
                padding: EdgeInsets.all(kDefaultPaddin),
                decoration: BoxDecoration(
                  color: product.color,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image.asset(product.image),
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
          child: Text(
            product.name,
            style: TextStyle(color: kTextLightColor),
          ),
        ),
        Text(
          "${product.price.toStringAsFixed(2)}",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
