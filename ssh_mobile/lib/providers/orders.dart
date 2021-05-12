import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

import './product.dart';

class OrderProduct {
  List<Product> products;
  double amount;
  int orderID;

  OrderProduct({this.amount, this.products, this.orderID});
}

class Orders extends ChangeNotifier {
  List<OrderProduct> _orders = [];
  var publicAPI = 'http://34.101.230.129:80/api/';

  List<OrderProduct> get orders {
    return [..._orders];
  }

  int get amountOfOrders {
    return _orders.length;
  }

  OrderProduct orderProducts(int orderID) {
    return _orders.firstWhere((element) => element.orderID == orderID);
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
      data.forEach((value) {
        final checkListed = fetchedOrders
            .where((element) => element.orderID == value['order_id']);

        OrderProduct tempOrder;
        if (checkListed.isEmpty) {
          List<Product> _listTemp = [];
          _listTemp.add(Product(
              pid: value['pid'],
              pname: value['pname'],
              price: value['price'].toDouble(),
              description: value['description'],
              typeID: value['type_id'],
              picture: value['picture']['data'].cast<int>()));
          tempOrder = OrderProduct(
              orderID: value['order_id'],
              amount: value['amount'].toDouble(),
              products: _listTemp);
        } else {
          tempOrder = fetchedOrders
              .firstWhere((element) => element.orderID == value['order_id']);
          tempOrder.products.add(Product(
              pid: value['pid'],
              pname: value['pname'],
              price: value['price'].toDouble(),
              description: value['description'],
              typeID: value['type_id'],
              picture: value['picture']['data'].cast<int>()));
          tempOrder.amount += value['amount'].toDouble();
        }

        fetchedOrders.add(tempOrder);
      });
      _orders = fetchedOrders;
      notifyListeners();
    } catch (err) {
      return throw (err);
    }
  }
}
