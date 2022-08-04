import 'package:flutter/material.dart';

import 'package:flutter_http_course/app/services/state.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: const [
          Text("Home Screen"),
        ],
      ),
    );
  }
}