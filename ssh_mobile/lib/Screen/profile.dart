import 'package:flutter/material.dart';
import 'package:ssh_mobile/widgets/appbar.dart';
import 'package:ssh_mobile/widgets/bottomNavigationBar.dart';

class Profile extends StatelessWidget {
  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SSHAppBar(),
      body: Container(),
      bottomNavigationBar: BotNavBar(selectedIndex: 3),
    );
  }
}
