import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../widgets/appbar.dart';
import '../widgets/bottomNavigationBar.dart';

import '../providers/cart.dart';

import '../widgets/cart_item.dart';

class Cart extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    Map<int, CartProduct> items = cart.items;

    return Scaffold(
        appBar: SSHAppBar(),
        body: Column(children: <Widget>[
          Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.all(30),
                  itemCount: cart.productCount,
                  itemBuilder: (context, index) =>
                      CartItem(product: items.values.toList()[index]))),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0, 1))
                ]),
            height: 100,
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                    flex: 6,
                    child: Container(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Total',
                            style: GoogleFonts.montserrat()
                                .copyWith(fontSize: 20)),
                        Text(
                            '${cart.totalPrice.toStringAsFixed(2) == '0.00' ? '0' : cart.totalPrice.toStringAsFixed(2)} ฿',
                            style:
                                GoogleFonts.montserrat().copyWith(fontSize: 30))
                      ],
                    ))),
                Expanded(
                    flex: 3,
                    child: FloatingActionButton.extended(
                      backgroundColor: Color(0xFFFEC10E),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      onPressed: () {
                        print('Hi There!');
                      },
                      label: Text(
                        'Buy Now',
                        style: GoogleFonts.montserrat().copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    )),
                Expanded(flex: 1, child: Container())
              ],
            ),
          )
        ]),
        bottomNavigationBar: BotNavBar(selectedIndex: 1));
  }
}
