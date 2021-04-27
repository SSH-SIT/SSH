import 'package:flutter/material.dart';

class Auth with ChangeNotifier {
  String _token;
  String _userID;

  bool get isAuth {
    return _token != null;
  }

  String get token {
    return _token;
  }

  String get userID {
    return _userID;
  }

  login() {
    _token = 'Login Success';
    notifyListeners();
  }
}
