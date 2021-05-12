import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screen/order_details.dart';
import '../transitions/fade_transition.dart';

class OrderItem extends StatelessWidget {
  OrderItem({Key key, this.orderKey, this.orderID, this.price})
      : super(key: key);

  final orderKey;
  final orderID;
  final price;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              FadeRoute(
                  page: OrderDetails(
                orderID: orderID,
              )));
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 15),
          width: double.infinity,
          padding: EdgeInsets.all(30),
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
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Order #$orderKey',
                      style: GoogleFonts.montserrat()
                          .copyWith(fontSize: 30, fontWeight: FontWeight.bold),
                    )),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Total Price: ${price.toStringAsFixed(2)} ฿',
                      style: GoogleFonts.montserrat().copyWith(
                        fontSize: 22,
                      ),
                    )),
              ),
            ],
          ),
        ));
  }
}
