import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ssh_mobile/providers/products.dart';
import '../widgets/appbar.dart';

import 'package:provider/provider.dart';

import '../providers/cart.dart';
import '../providers/product.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({Key key}) : super(key: key);

  static const routeName = '/product-details';

  @override
  Widget build(BuildContext context) {
    Map args = ModalRoute.of(context).settings.arguments;
    Product product = Provider.of<Products>(context).findById(args['pid']);

    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: SSHAppBar(),
      body: Container(
          child: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.all(36),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                            padding: EdgeInsets.all(30),
                            height: 240,
                            width: 250,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Color(0xFFB388CA)),
                            child: Image.asset(product.image),
                          )),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(product.pname,
                                  style: GoogleFonts.montserrat().copyWith(
                                      fontSize: 25, letterSpacing: 1.2)))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(product.price.toString() + ' ฿',
                                  style: GoogleFonts.montserrat().copyWith(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.5)))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(product.description,
                                  style: GoogleFonts.montserrat().copyWith(
                                      fontSize: 20, letterSpacing: 1.5)))),
                      SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          FloatingActionButton.extended(
                              heroTag: 'AddToCart',
                              backgroundColor: Color(0xFFFFF7EC),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17)),
                              onPressed: () {
                                cart.addItem(product.pid, product.price);
                                Navigator.pop(context);
                              },
                              label: Text('Add to Cart',
                                  style: GoogleFonts.montserrat().copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))),
                          FloatingActionButton.extended(
                              heroTag: 'BuyNow',
                              backgroundColor: Color(0xFFFEC10E),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17)),
                              onPressed: () {},
                              label: Text('Buy Now',
                                  style: GoogleFonts.montserrat().copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)))
                        ],
                      )
                    ],
                  )))),
    );
  }
}
