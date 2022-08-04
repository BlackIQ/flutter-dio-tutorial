import 'package:flutter/material.dart';

import 'package:flutter_http_course/app/services/state.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  SettingsTab({Key? key}) : super(key: key);

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _bio = TextEditingController();

  Future<void> _update(BuildContext context) async {
    print("update");
  }

  @override
  Widget build(BuildContext context) {
    var _user = Provider.of<AppState>(context).getUser;

    print(_user);
    
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CircleAvatar(
                child: Icon(
                  Icons.person,
                  size: 20,
                ),
                radius: 25,
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _user['name'] != "" ? _user['name'] : "Name is not set",
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    _user['bio'] != "" ? _user['bio'] : "Bio is not set",
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(color: Colors.indigo),
          const SizedBox(height: 10),
          TextField(
              controller: _name,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Name"),
                hintText: "Enter name",
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _bio,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Bio"),
                hintText: "Enter bio",
              ),
            ),
            const SizedBox(height: 10),
            Container(
              child: ElevatedButton(
                onPressed: () => _update(context),
                child: Text("Update data"),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                ),
              ),
              height: 35,
            ),
        ],
      ),
    );
  }
}