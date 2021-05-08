import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  String _token;
  int _uid;
  var publicAPI = 'http://34.101.230.129:80/api/';

  bool get isAuth {
    return _token != null;
  }

  String get token {
    return _token;
  }

  int get uid {
    return _uid;
  }

  Future<Map> getUserProfile() async {
    var endpoint = publicAPI + 'users/$_uid';

    try {
      final res = await http.get(Uri.parse(endpoint));
      final data = jsonDecode(res.body);

      if (data == null) return Map();

      Map profile = {
        'firstName': data[0]['firstName'],
        'lastName': data[0]['lastName'],
        'phone_num': data[0]['phone_num'],
        'email': data[0]['email'],
        'picture': data[0]['picture'],
        'address': data[0]['address'],
        'sub_district': data[0]['sub_district'],
        'district': data[0]['district'],
        'province': data[0]['province'],
        'country': data[0]['country'],
        'zip_code': data[0]['zip_code'],
      };
      return profile;
    } catch (err) {
      return throw (err);
    }
  }

  Future<void> signup(String firstName, String lastName, String email,
      String phoneNum, String password) async {
    var endpoint = publicAPI + 'users/signup';

    try {
      final res = await http.post(Uri.parse(endpoint), body: {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'phoneNum': phoneNum,
        'password': password
      });
      final data = jsonDecode(res.body);

      if (data == null) return;

      if (res.statusCode == 201) {
        _token = data['token'];
        _uid = data['uid'];
      } else if (res.statusCode == 400) {
        print('Something went wrong. Please Try Again');
      }

      notifyListeners();
    } catch (err) {
      return throw (err);
    }
  }

  Future<bool> login(String email, String password) async {
    var endpoint = publicAPI + 'users/login';

    try {
      final res = await http.post(Uri.parse(endpoint),
          body: {"email": email, "password": password});
      final data = jsonDecode(res.body);

      if (res.statusCode == 400) return false;

      _token = data['token'];
      _uid = data['uid'];

      final prefs = await SharedPreferences.getInstance();
      final user = json.encode({'token': _token, 'uid': _uid});
      prefs.setString('user', user);

      notifyListeners();

      return true;
    } catch (err) {
      return throw (err);
    }
  }

  Future<bool> autoLogin() async {
    final prefs = await SharedPreferences.getInstance();

    if (!prefs.containsKey('user')) return false;

    final user = json.decode(prefs.getString('user'));
    _token = user['token'];
    _uid = user['uid'];
    notifyListeners();

    return true;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    _token = null;
    _uid = null;
    prefs.clear();
    notifyListeners();
  }
}
