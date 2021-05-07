import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  CartItem({Key key, this.product}) : super(key: key);

  final CartProduct product;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Color(0xFFFFF7EC),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 2,
                blurRadius: 10,
                offset: Offset(0, 1))
          ]),
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.purple[200],
                        borderRadius: BorderRadius.circular(30)),
                    child: Image.asset('assets/images/Clitoral.png'),
                  ))),
          Expanded(
              flex: 7,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 20, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Product's Name",
                        style: GoogleFonts.montserrat().copyWith(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    SizedBox(height: 10),
                    Text('${product.price.toStringAsFixed(2)} ฿ / item',
                        style: GoogleFonts.montserrat().copyWith(fontSize: 18)),
                    SizedBox(height: 10),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Color(0xFFF6D796))),
                              onPressed: () {
                                cart.removeSingleItems(product.id);
                              },
                              child: Text('-',
                                  style: GoogleFonts.montserrat().copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30))),
                          Text('${product.quantity.toString()}',
                              style: GoogleFonts.montserrat().copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Color(0xFFF6D796))),
                              onPressed: () {
                                cart.addItem(product.id, product.price);
                              },
                              child: Text('+',
                                  style: GoogleFonts.montserrat().copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30)))
                        ])
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
