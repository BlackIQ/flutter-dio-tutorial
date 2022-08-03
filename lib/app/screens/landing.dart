import 'package:flutter/material.dart';

import 'package:flutter_http_course/app/screens/auth/auth_screen.dart';
import 'package:flutter_http_course/app/screens/home/home_screen.dart';

import 'package:flutter_http_course/app/services/state.dart';

import 'package:provider/provider.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    var auth = Provider.of<AppState>(context, listen: false).getAuth;
    
    return auth ? const HomeScreen() : const AuthScreen();
  }
}