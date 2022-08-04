import 'package:flutter/material.dart';

import 'package:flutter_http_course/app/screens/home/tabs/home_tab.dart';
import 'package:flutter_http_course/app/screens/home/tabs/search_tab.dart';
import 'package:flutter_http_course/app/screens/home/tabs/settings_tab.dart';

import 'package:flutter_http_course/app/services/state.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _logout(BuildContext context) {
    Provider.of<AppState>(context, listen: false).logoutAuth();
  }
  
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> items = [
      {
        "title": "Home",
        "icon": const Icon(Icons.home),
        "widget": HomeTab(),
      },
      {
        "title": "Search",
        "icon": const Icon(Icons.search),
        "widget": SearchTab(),
      },
      {
        "title": "Settings",
        "icon": const Icon(Icons.settings),
        "widget": SettingsTab(),
      }
    ];

    return DefaultTabController(
      length: items.length,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text("Welcome"),
          // centerTitle: true,
          actions: [
            IconButton(
              onPressed: () => _logout(context),
              icon: const Icon(Icons.logout),
            ),
          ],
          bottom: TabBar(
            tabs: items.map((item) {
              return Tab(
                text: item["title"],
                // icon: item["icon"],
              );
            }).toList(),
          ),
        ),
        body: TabBarView(
          children: items.map((item) {
              return Container(child: item["widget"]);
            }).toList(),
        ),
      ),
    );
  }
}