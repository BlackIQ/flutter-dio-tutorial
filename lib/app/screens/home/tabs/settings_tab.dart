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
    var _user = Provider.of<AppState>(context).getUser;

    print(_user);
    
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const CircleAvatar(
            child: Icon(
              Icons.person,
              size: 30,
            ),
            radius: 30,
          ),
          const SizedBox(height: 20),
          Text(
            "Name: ${_user['name']}",
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            "Account ID: ${_user['_id']}",
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
          SizedBox(height: 20),
          Divider(color: Colors.indigo),
        ],
      ),
    );
  }
}