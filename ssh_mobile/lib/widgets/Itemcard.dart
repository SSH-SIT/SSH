import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:ssh_mobile/transitions/fade_transition.dart';
import '../screen/product_details.dart';

import '../providers/product.dart';

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
              Navigator.push(context, FadeRoute(page: ProductDetails(pid: product.pid,)));
            },
            child: Container(
                padding: EdgeInsets.all(kDefaultPaddin),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child:
                    Image.memory(Uint8List.fromList(product.picture.toList()))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
          child: Text(
            product.pname,
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
