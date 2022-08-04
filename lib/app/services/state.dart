import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  var _auth = false;
  var _id;

  bool get getAuth {
    return _auth;
  }

  String get getId {
    return _id;
  }
  
  void loginAuth(String id) {
    _auth = true;
    _id = id;
    notifyListeners();
  }
  void logoutAuth() {
    _auth = false;
    notifyListeners();
  }
}