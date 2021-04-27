import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return AppBar(
        backgroundColor: Color(0xFFFEC10E),
        textTheme: TextTheme(headline6: TextStyle(color: Colors.black)),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "SSH",
              style: GoogleFonts.montserrat()
                  .copyWith(fontWeight: FontWeight.w900, fontSize: 36),
            ),
          ],
        ));
  }
}
