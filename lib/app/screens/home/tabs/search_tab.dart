import 'package:flutter/material.dart';
import 'package:flutter_http_course/app/services/api.dart';

import 'package:flutter_http_course/app/services/state.dart';
import 'package:provider/provider.dart';

class SearchTab extends StatefulWidget {
  SearchTab({Key? key}) : super(key: key);

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  final DioClient _client = DioClient();

  List users = [];

  void getUsers() {
    var res = _client.getUsers();

    res.then((result) {
      if (result.statusCode == 200) {
        var data = result.data;
        setState(() => users = data);
      }
    });
  }

  final TextEditingController _username = TextEditingController();

  @override
  Widget build(BuildContext context) {
    getUsers();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text("Search the username"),
              const SizedBox(height: 20),
              TextField(
                controller: _username,
                obscureText: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Username"),
                  hintText: "Search username",
                ),
              ),
            ],
          ),
        ),
        const Divider(),
        users.isNotEmpty
        ?
        Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(users[index]["name"].toString()),
                  subtitle: Text(users[index]["username"]),
                  onTap: () {},
                );
              },
            ),
          )
        :
        const Center(child: CircularProgressIndicator()),
      ],
    );
  }
}