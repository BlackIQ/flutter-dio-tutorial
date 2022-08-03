import 'dart:convert';
import 'package:http/http.dart' as http;

void login(String username, String password) {
  Map data = {
    "username": username,
    "password": password
  };

  var url = Uri.parse('http://192.168.1.5:8000/api/user/login');
  var response = http.post(url, body: data);

  print(response);
}

void test() async {
  var url = Uri.parse('http://192.168.1.5:8000/api/user/test');
  var response = await http.get(url);

  var data = jsonDecode(response.body);

  print("hello");
}