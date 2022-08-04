import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  bool _auth = true;
  Map _user = { "_id": "50", "name": "amir" };
  String _id = "50";

  bool get getAuth {
    return _auth;
  }
  String get getId {
    return _id;
  }
  Map get getUser {
    return _user;
  }
  
  void loginAuth(Map user) {
    _auth = true;
    _id = user["_id"];
    _user = user;
    notifyListeners();
  }
  void logoutAuth() {
    _auth = false;
    _id = "";
    _user = {};
    notifyListeners();
  }
}