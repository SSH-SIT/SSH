import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderProduct {
  final List<Product> products;
  final double amount;

  OrderProduct({this.amount, this.products});
}

class Orders extends ChangeNotifier {
  List<OrderProduct> _orders = [];
  var publicAPI = 'http://34.101.230.129:80/api/';

  List<OrderProduct> get orders {
    return [..._orders];
  }

  double totalPrice(int index) {
    return _orders[index].amount;
  }

  Future<void> fetchOrders() async {
    final prefs = await SharedPreferences.getInstance();
    final user = json.decode(prefs.getString('user'));

    var endpoint = publicAPI + 'orders/users/${user["uid"]}';
    try {
      final res = await http.get(Uri.parse(endpoint));
      final data = jsonDecode(res.body);

      if (data == null) return;

      final List<OrderProduct> fetchedOrders = [];
      Map<String, int> count = {};
      data.forEach((value) {
        // var comments = <OrderProduct>[...];
        // var count = comments.where((c) => c['order_id'] == [order_id]).toList().length;

        count['$value'] = count.containsKey('$value') ? count['$value'] + 1 : 1;

        print(count);

        fetchedOrders.add(OrderProduct(
          products: value['products'],
          amount: value['amount'].toDouble(),
        ));
      });
      _orders = fetchedOrders;
      notifyListeners();
    } catch (err) {
      return throw (err);
    }
  }
}
