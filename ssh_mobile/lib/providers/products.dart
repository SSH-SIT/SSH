import 'dart:convert';
import 'package:flutter/material.dart';
import './product.dart';

import 'package:http/http.dart' as http;

class Products extends ChangeNotifier {
  List<Product> _products = [];
  var publicAPI = 'http://34.101.230.129:80/api/';

  List<Product> get products {
    return [..._products];
  }

  Product findById(int pid) {
    return _products.firstWhere((prod) => prod.pid == pid);
  }

  Future<void> fetchProducts() async {
    var endpoint = publicAPI + 'product';

    try {
      final res = await http.get(Uri.parse(endpoint));
      final data = jsonDecode(res.body);

      if (data == null) return;

      final List<Product> fetchedProducts = [];
      data.forEach((value) {
        fetchedProducts.add(Product(
            pid: value['pid'],
            pname: value['pname'],
            description: value['description'],
            price: value['price'].toDouble(),
            type: value['type_name'],
            typeID: value['type_id'],
            picture: value['picture']['data'].cast<int>(),
            color: value['color']));
      });
      _products = fetchedProducts;
      notifyListeners();
    } catch (err) {
      return throw (err);
    }
  }

  Future<List<Product>> searchProducts(String evidence) async {
    var endpoint = publicAPI + 'product/search';

    try {
      final res =
          await http.post(Uri.parse(endpoint), body: {"evidence": evidence});
      final data = jsonDecode(res.body);

      if (data == null) return [];

      final List<Product> searchedProducts = [];
      data.forEach((value) {
        searchedProducts.add(Product(
            pid: value['pid'],
            pname: value['pname'],
            description: value['description'],
            price: value['price'].toDouble(),
            type: value['type_name'],
            typeID: value['type_id'],
            picture: value['picture']['data'].cast<int>(),
            color: value['color']));
      });

      return searchedProducts;
    } catch (err) {
      return throw (err);
    }
  }
}
