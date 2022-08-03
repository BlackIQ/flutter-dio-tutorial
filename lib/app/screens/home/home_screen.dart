import 'package:flutter/material.dart';
import 'package:flutter_http_course/app/services/api.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Welcome")
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => test(),
          child: const Text("Test API")
        ),
      ),
    );
  }
}