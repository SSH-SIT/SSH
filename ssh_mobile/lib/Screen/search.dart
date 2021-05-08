import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssh_mobile/widgets/Itemcard.dart';
import '../constant.dart';
import '../providers/product.dart';
import '../providers/products.dart';
import '../widgets/appbar.dart';
import '../widgets/bottomNavigationBar.dart';

import 'package:google_fonts/google_fonts.dart';

class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);
  static const routeName = '/search';

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final _searchContoller = TextEditingController();
  bool isLoadingSearch = false;
  String loadingText = '...';
  List<Product> searched = [];

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);

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
              SizedBox(height: 20),
              ConstrainedBox(
                  constraints: BoxConstraints.tightFor(
                      width: MediaQuery.of(context).size.width * 0.6),
                  child: ElevatedButton(
                    onPressed: () {
                      searched.clear();
                      setState(() {
                        isLoadingSearch = !isLoadingSearch;
                        loadingText = 'Loading Product...';
                      });
                      products
                          .searchProducts(_searchContoller.text.toString())
                          .then((value) {
                        value.forEach((product) {
                          setState(() {
                            searched.add(product);
                            isLoadingSearch = !isLoadingSearch;
                            loadingText = '';
                          });
                        });
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 8,
                        primary: Color(0xffF6D796),
                        padding: EdgeInsets.all(12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32))),
                    child: Text('Search',
                        style: GoogleFonts.montserrat().copyWith(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                  )),
              SizedBox(height: 20),
              !isLoadingSearch
                  ? Text(loadingText)
                  : (Expanded(
                      child: GridView.builder(
                        itemCount: searched == [] ? 0 : searched.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: kDefaultPaddin,
                          crossAxisSpacing: kDefaultPaddin,
                          childAspectRatio: 0.75,
                        ),
                        itemBuilder: (context, index) {
                          return new Itemcard(
                            product: searched.elementAt(index),
                          );
                        },
                      ),
                    )),
            ]),
          )),
      bottomNavigationBar: BotNavBar(selectedIndex: 2),
    );
  }
}
