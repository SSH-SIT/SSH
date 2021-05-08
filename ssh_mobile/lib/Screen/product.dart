import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import '../widgets/Itemcard.dart';
import '../constant.dart';
import '../widgets/appbar.dart';
import '../widgets/bottomNavigationBar.dart';

import '../widgets/categories_slider.dart';

import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../providers/product.dart';

class ProductPage extends StatefulWidget {
  static const routeName = '/products';
  final onPageChange;
  final selectedIndex;

  ProductPage({Key key, this.selectedIndex, this.onPageChange})
      : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int productIndex = 0;

  @override
  void initState() {
    Provider.of<Products>(context, listen: false).fetchProducts();
    super.initState();
  }

  void onCatChange(int index) {
    setState(() {
      productIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context).products;
    List<Product> belongToPage = [];
    bool isInit = false;

    products.forEach((product) {
      if (productIndex + 1 == product.typeID) belongToPage.add(product);
    });

    if (products.length != 0)
      setState(() {
        isInit = true;
      });

    return Scaffold(
      appBar: SSHAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Text(
                  "Categories",
                  style: GoogleFonts.montserrat()
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
            ],
          ),
          CategoriesSlider(
            productIndex: productIndex,
            onPageChange: onCatChange,
          ),
          isInit
              ? Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                    child: GridView.builder(
                      itemCount: belongToPage.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: kDefaultPaddin,
                        crossAxisSpacing: kDefaultPaddin,
                        childAspectRatio: 0.75,
                      ),
                      itemBuilder: (context, index) => Itemcard(
                        product: belongToPage.elementAt(index),
                      ),
                    ),
                  ),
                )
              : Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                            alignment: Alignment.center,
                            child: Text('Loading Products',
                                style: GoogleFonts.montserrat().copyWith(
                                    fontSize: 25, fontWeight: FontWeight.bold)))
                      ]),
                ),
        ],
      ),
      bottomNavigationBar: BotNavBar(selectedIndex: 0),
    );
  }
}
