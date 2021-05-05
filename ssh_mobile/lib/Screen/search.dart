import 'package:flutter/material.dart';
import 'package:ssh_mobile/widgets/appbar.dart';
import 'package:ssh_mobile/widgets/bottomNavigationBar.dart';

import 'package:google_fonts/google_fonts.dart';

class Search extends StatelessWidget {
  static const routeName = '/search';

  final _searchContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SSHAppBar(),
      body: Theme(
          data: Theme.of(context).copyWith(
            primaryColor: Color(0xFFFEC10E),
          ),
          child: Container(
            padding: EdgeInsets.all(30),
            child: Column(children: [
              TextField(
                style: GoogleFonts.montserrat().copyWith(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    fillColor: Colors.grey[200],
                    filled: true,
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Search",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(color: Color(0xffFEC10E)))),
                controller: _searchContoller,
              ),
              Expanded(
                  child: ListView.builder(
                      // itemCount: 0,
                      itemBuilder: (context, index) => Container()))
            ]),
          )),
      bottomNavigationBar: BotNavBar(selectedIndex: 2),
    );
  }
}
