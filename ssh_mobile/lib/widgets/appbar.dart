import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';
import 'package:ssh_mobile/screen/login_Screen.dart';

class SSHAppBar extends StatefulWidget implements PreferredSizeWidget {
  Size get preferredSize => const Size.fromHeight(65);

  SSHAppBar({Key key, this.page}) : super(key: key);

  final page;

  @override
  _SSHAppBarState createState() => _SSHAppBarState();
}

class _SSHAppBarState extends State<SSHAppBar> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Auth>(context);

    return AppBar(
      backgroundColor: Color(0xFFFEC10E),
      // shadowColor: ,
      textTheme: TextTheme(headline6: TextStyle(color: Colors.black)),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(17))),
      title: Text(
        "SSH",
        style: GoogleFonts.montserrat().copyWith(
            fontWeight: FontWeight.bold, fontSize: 50, letterSpacing: 10),
      ),
      elevation: 8,
      actions: <Widget>[
        Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                user.logout().then((_) => Navigator.pushReplacementNamed(
                    context, LoginPage.routeName));
              },
              child: Icon(Icons.logout),
            )),
      ],
      actionsIconTheme:
          IconThemeData(size: 30.0, color: Colors.black, opacity: 10.0),
    );
  }
}
