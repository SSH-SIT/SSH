import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import 'package:ssh_mobile/providers/orders.dart';

import '../widgets/appbar.dart';

class OrderDetails extends StatefulWidget {
  OrderDetails({Key key, this.orderID}) : super(key: key);

  final orderID;

  static const routeName = '/order-details';

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  void initState() {
    Provider.of<Orders>(context, listen: false).fetchOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final order = Provider.of<Orders>(context).orderProducts(widget.orderID);

    return Scaffold(
        appBar: SSHAppBar(),
        body: Container(
            padding: EdgeInsets.all(30),
            child: Column(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(15),
                    child: Text('Order Information',
                        style: GoogleFonts.montserrat().copyWith(
                          fontSize: 22,
                        ))),
                Expanded(
                    child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
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
                  child: Expanded(
                      child: Column(
                    children: <Widget>[
                      Expanded(
                          child: Container(
                              child: ListView.builder(
                                  padding: EdgeInsets.all(30),
                                  itemCount: order.products.length,
                                  itemBuilder: (context, index) => Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Expanded(
                                              child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 25),
                                                  height: 60,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
                                                  child: Image.memory(
                                                      Uint8List.fromList(order
                                                          .products[index]
                                                          .picture
                                                          .toList())))),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(order.products[0].pname,
                                                  style:
                                                      GoogleFonts.montserrat()
                                                          .copyWith(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                              Text(
                                                  'Price: ' +
                                                      order
                                                          .products[index].price
                                                          .toStringAsFixed(2),
                                                  style:
                                                      GoogleFonts.montserrat()
                                                          .copyWith(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold))
                                            ],
                                          )
                                        ],
                                      )))),
                    ],
                  )),
                )),
                Container(
                  padding: EdgeInsets.all(35),
                  alignment: Alignment.centerRight,
                  child: Text('Total Price: ${order.amount.toStringAsFixed(2)}',
                      style: GoogleFonts.montserrat()
                          .copyWith(fontSize: 22, fontWeight: FontWeight.bold)),
                )
              ],
            )));
  }
}
