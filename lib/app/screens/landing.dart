import 'package:flutter/material.dart';

import 'package:flutter_http_course/app/screens/auth/auth_screen.dart';
import 'package:flutter_http_course/app/screens/home/home_screen.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  bool auth = true;

  @override
  Widget build(BuildContext context) {
    return auth ? const HomeScreen() : const AuthScreen();
  }
}