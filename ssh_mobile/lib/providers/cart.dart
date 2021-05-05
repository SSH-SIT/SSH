import 'package:flutter/foundation.dart';

class CartProduct {
  final int id;
  final int quantity;
  final double price;

  CartProduct({
    @required this.id,
    @required this.quantity,
    @required this.price
  });
}

class CartProvider with ChangeNotifier {
  Map<int, CartProduct> _items = {};
  
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
    
    if(_items.containsKey(id)) {
      _items.update(id, (existedItem) => 
        CartProduct(
          id: existedItem.id,
          quantity: existedItem.quantity + 1,
          price: existedItem.price
        )
      );
    } else {
      _items.putIfAbsent(id, () => CartProduct(id: id, quantity: 1, price: price));
    }
    print(price);
    notifyListeners();
  }

  void removeItem(int id) {
    _items.remove(id);
    notifyListeners();
  }

  void removeSingleItems(int id) {
    if(!_items.containsKey(id)) return;

    if(_items[id].quantity > 1) {
      _items.update(id, (item) => CartProduct(id: item.id, quantity: item.quantity - 1, price: item.price));
    }
    else {
      _items.remove(id);
    }
    notifyListeners();
  }

  void clearCart() {
    _items = {};
    notifyListeners();
  }

}



