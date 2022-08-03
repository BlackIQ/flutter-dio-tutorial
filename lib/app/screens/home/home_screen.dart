import 'package:flutter/material.dart';
import 'package:flutter_http_course/app/services/api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DioClient _client = DioClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Welcome")
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => {
            _client.register({
              "username": "username",
              "password": "password",
            })
          },
          child: const Text("Test API")
        ),
      ),
    );
  }
}