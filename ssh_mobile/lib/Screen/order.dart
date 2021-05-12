import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ssh_mobile/providers/orders.dart';

import '../widgets/appbar.dart';
import 'package:provider/provider.dart';

class Order extends StatefulWidget {
  Order({Key key}) : super(key: key);

  static const routeName = '/order';

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  void initState() {
    Provider.of<Orders>(context, listen: false).fetchOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final order = Provider.of<Orders>(context);

    //Map<int, OrderProduct> items = order.items;

    return Scaffold(
      appBar: SSHAppBar(),
    );
  }
}
