import 'package:flutter/material.dart';
import 'package:flutter_http_course/app/services/api.dart';
import 'package:flutter_http_course/app/services/state.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final DioClient _client = DioClient();

  bool btnLoading = false;

  void _login(BuildContext context) {
    setState(() => btnLoading = true);

    var res = _client.login("amir", "ali");

    res.then((result) {
      setState(() => btnLoading = false);
      
      if (result.statusCode == 200) {
        var data = result.data;
        Provider.of<AppState>(context, listen: false).loginAuth(data["_id"]);
      } else {
        print("error");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Authenticate")
      ),
      body: Center(
        child:ElevatedButton(
          onPressed: btnLoading ? null : () => _login(context),
          child: const Text("Test API")
        ),
      ),
    );
  }
}