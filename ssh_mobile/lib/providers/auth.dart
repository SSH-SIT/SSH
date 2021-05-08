import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String _token;
  String _userID;
  var publicAPI = 'http://34.101.230.129:80/api/';

  bool get isAuth {
    return _token != null;
  }

  String get token {
    return _token;
  }

  String get userID {
    return _userID;
  }

  Future<void> signup(String firstName, String lastName, String email,
      String phoneNum, String password) async {
    var endpoint = publicAPI + 'users/signup';

    try {
      final res = await http.post(Uri.parse(endpoint),
          body: {firstName, lastName, email, phoneNum, password});
      final data = jsonDecode(res.body);

      if (data == null) return;

      if (res.statusCode == 201) {
        _token = data.token;
        _userID = data.uid;
      } else if (res.statusCode == 400) {
        print('Something went wrong. Please Try Again');
      }

      notifyListeners();
    } catch (err) {
      return throw (err);
    }
  }

  Future<void> login(String email, String password) async {
    var endpoint = publicAPI + 'users/login';

    try {
      final res = await http.post(Uri.parse(endpoint));
      final data = jsonDecode(res.body);

      if (data == null) return;

      _token = data.token;
      _userID = data.uid;
      notifyListeners();
    } catch (err) {
      return throw (err);
    }
  }
}
