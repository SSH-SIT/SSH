import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import '../providers/orders.dart';

import '../widgets/appbar.dart';
import '../widgets/order_item.dart';

class Order extends StatefulWidget {
  Order({Key key}) : super(key: key);

  static const routeName = '/order';

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  bool isHasOrder = false;

  @override
  void initState() {
    Provider.of<Orders>(context, listen: false).fetchOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final order = Provider.of<Orders>(context).orders;

    if (order.length != 0) isHasOrder = true;

    return Scaffold(
      appBar: SSHAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Orders',
                style: GoogleFonts.montserrat()
                    .copyWith(fontSize: 45, fontWeight: FontWeight.bold),
              )),
          isHasOrder
              ? Expanded(
                  child: Container(
                      child: ListView.builder(
                          padding: EdgeInsets.all(30),
                          itemCount: order.length,
                          itemBuilder: (context, index) => OrderItem(
                                orderKey: index + 1,
                                orderID: order[index].orderID,
                                price: order[index].amount,
                              ))))
              : Expanded(
                  child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(30),
                      child: Text('No Order',
                          style: GoogleFonts.montserrat().copyWith(
                              fontSize: 30, fontWeight: FontWeight.bold))))
        ],
      ),
    );
  }
}
