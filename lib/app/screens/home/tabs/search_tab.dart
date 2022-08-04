import 'package:flutter/material.dart';

import 'package:flutter_http_course/app/services/state.dart';
import 'package:provider/provider.dart';

class SearchTab extends StatefulWidget {
  SearchTab({Key? key}) : super(key: key);

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: const [
          Text("Search Screen"),
        ],
      ),
    );
  }
}