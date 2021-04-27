import 'package:flutter/material.dart';

class Auth with ChangeNotifier {
  String _token;
  String _userID;

  bool get isAuth {
    return false;
  }

  String get token {
    return _token;
  }

  String get userID {
    return _userID;
  }
}
