import 'package:flutter/material.dart';
import 'package:flutter_http_course/app/screens/landing.dart';
import 'package:flutter_http_course/app/services/state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: AppState(),
        )
      ],
      child: MaterialApp(
        title: 'Learning APIs in Flutter',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: const Landing(),
      ),
    );
  }
}