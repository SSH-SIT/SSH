import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CartProduct {
  final int id;
  final int quantity;
  final double price;

  CartProduct(
      {@required this.id, @required this.quantity, @required this.price});
}

class CartProvider with ChangeNotifier {
  Map<int, CartProduct> _items = {};
  var publicAPI = 'http://34.101.230.129/api/';

  Map<int, CartProduct> get items {
    return {..._items};
  }

  int get productCount {
    return _items.length;
  }

  double get totalPrice {
    var total = 0.0;
    _items.forEach((key, item) {
      total += item.price * item.quantity;
    });
    return total;
  }

  void addItem(int id, double price) {
    if (_items.containsKey(id)) {
      _items.update(
          id,
          (existedItem) => CartProduct(
              id: existedItem.id,
              quantity: existedItem.quantity + 1,
              price: existedItem.price));
    } else {
      _items.putIfAbsent(
          id, () => CartProduct(id: id, quantity: 1, price: price));
    }

    notifyListeners();
  }

  void removeItem(int id) {
    _items.remove(id);
    notifyListeners();
  }

  void removeSingleItems(int id) {
    if (!_items.containsKey(id)) return;

    if (_items[id].quantity > 1) {
      _items.update(
          id,
          (item) => CartProduct(
              id: item.id, quantity: item.quantity - 1, price: item.price));
    } else {
      _items.remove(id);
    }
    notifyListeners();
  }

  void clearCart() {
    _items = {};
    notifyListeners();
  }

  Future<bool> buyItem() async {
    var endpoint = publicAPI + '/users/buy';
    final prefs = await SharedPreferences.getInstance();
    final user = json.decode(prefs.getString('user'));
    final uid = user['uid'];

    try {
      List _products = [];
      _items.forEach((key, value) {
        _products
            .add({"pid": value.id, "amount": value.price * value.quantity});
      });

      Map<String, dynamic> args = {
        "products": _products,
        "uid": uid.toString()
      };

      final res = await http.post(Uri.parse(endpoint),
          body: json.encode(args),
          headers: {'Content-type': 'application/json'});

      if (res.statusCode == 201) {
        _items = {};
      } else if (res.statusCode == 400) return false;

      notifyListeners();
      return true;
    } catch (err) {
      return throw (err);
    }
  }
}
