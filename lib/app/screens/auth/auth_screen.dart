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

  bool login = true;
  bool btnLoading = false;

  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  Future<void> _auth(BuildContext context) async {
    setState(() => btnLoading = true);

    var res = login ? _client.login(_username.text, _password.text) : _client.register(_username.text, _password.text);

    res.then((result) {
      setState(() => btnLoading = false);
      
      if (result.statusCode == 200) {
        var data = result.data;
        Provider.of<AppState>(context, listen: false).loginAuth(data);
      } else {
        var error = result.data;

        return showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Sorry, an error occurred"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(error['message']),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Close'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          }
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Authenticate"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: Text(
                "Contrinue to app",
                style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _username,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Username"),
                hintText: "Enter username",
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _password,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Password"),
                hintText: "Enter password",
              ),
            ),
            const SizedBox(height: 10),
            Container(
              child: ElevatedButton(
                onPressed: btnLoading ? null : () => _auth(context),
                child: Text(login ? "Login" : "Register"),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                ),
              ),
              height: 35,
            ),
            const SizedBox(height: 10),
            Container(
              child: OutlinedButton(
                onPressed: () => setState(() => login = !login),
                child: Text(login ? "I don't have account" : "I have account"),
              ),
              height: 35,
            ),
          ],
        ),
      ),
    );
  }
}