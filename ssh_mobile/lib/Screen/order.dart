import 'package:flutter/material.dart';
import '../widgets/appbar.dart';
import '../widgets/bottomNavigationBar.dart';

class Order extends StatelessWidget {
  static const routeName = '/order';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SSHAppBar(),
      body: Container(),
      bottomNavigationBar: BotNavBar(),
    );
  }
}
