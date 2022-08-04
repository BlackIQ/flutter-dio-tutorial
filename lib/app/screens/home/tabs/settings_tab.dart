import 'package:flutter/material.dart';

import 'package:flutter_http_course/app/services/state.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  SettingsTab({Key? key}) : super(key: key);

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: const [
          Text("Settings Screen"),
        ],
      ),
    );
  }
}