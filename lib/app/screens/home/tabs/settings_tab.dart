import 'package:flutter/material.dart';
import 'package:flutter_http_course/app/services/api.dart';

import 'package:flutter_http_course/app/services/state.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({Key? key}) : super(key: key);

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  final DioClient _client = DioClient();

  Map _user = {};

  void updateUser(BuildContext context) {
    var res = _client.getUser(Provider.of<AppState>(context, listen: true).getId);
    
    res.then((result) {
      if (result.statusCode == 200) {
        var data = result.data;
        Provider.of<AppState>(context, listen: false).setUser(data);
        setState(() => _user = data);
      }
    });
  }

  final TextEditingController _name = TextEditingController();
  final TextEditingController _bio = TextEditingController();

  Future<void> _update(BuildContext context) async {
    Map data = {
      "uid": _user["_id"],
      "data": {
        "name": _name.text,
        "bio": _bio.text,
      }
    };

    var res = _client.updateUser(data);

    res.then((result) {
      if (result.statusCode == 200) {
        print("Data updated");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    updateUser(context);
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
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Name"),
                hintText: "Enter name",
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _bio,
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