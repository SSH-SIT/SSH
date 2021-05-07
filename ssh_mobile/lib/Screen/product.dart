import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import '../widgets/Itemcard.dart';
import '../constant.dart';
import '../widgets/appbar.dart';
import '../widgets/bottomNavigationBar.dart';

import '../widgets/categories_slider.dart';
import '../models/product.dart';

import 'package:provider/provider.dart';
import '../providers/products.dart';

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
    Provider.of<Products>(context, listen: false).fetchProducts().then((_) {
      print(Provider.of<Products>(context, listen: false).products);
    });
    super.initState();
  }

  void onCatChange(int index) {
    setState(() {
      productIndex = index;
    });
  }

  List<Product> getProduct(int productIndex) {
    if (productIndex == 0)
      return products;
    else if (productIndex == 1)
      return critoral;
    else if (productIndex == 2)
      return clit;
    else if (productIndex == 3) return dildos;

    return [];
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context).products;

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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: kDefaultPaddin,
                  crossAxisSpacing: kDefaultPaddin,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => Itemcard(
                  product: products[index],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BotNavBar(selectedIndex: 0),
    );
  }
}
