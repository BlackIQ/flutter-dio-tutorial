import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  var _auth = false;

  bool get getAuth {
    return _auth;
  }
  
  void loginAuth() {
    _auth = true;
    notifyListeners();
  }
  void logooutAuth() {
    _auth = false;
    notifyListeners();
  }
}