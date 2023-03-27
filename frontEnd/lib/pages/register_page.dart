import 'dart:convert';
import 'package:http/http.dart';

import 'package:flutter/material.dart';
import 'package:ruligames/components/button.dart';
import 'package:ruligames/components/text_field.dart';
import 'package:ruligames/models/user.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final username = TextEditingController();
  final password = TextEditingController();

  Future<bool> signUpMethod() async {
    Map<String, dynamic> jsonMap = {
      'username': username.text,
      'password': password.text,
      'balance': 0.0,
      'admin': 0,
    };
    if (!(username.text.contains('@') == true && (username.text.contains('.com') == true || username.text.contains('.ro') == true))) {
      return false;
    }
    else {
      String url = "http://10.0.2.2:8080/homepage/signup";
      final Client client = Client();
      final Response response = await client.post(Uri.parse(url),
          body: json.encode(jsonMap),
          headers: {"Accept": "application/json",
            "content-type": "application/json"});
      return response.statusCode == 200;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),

              TextArea(controller: username, width: 325, height: 100, hintText: 'E-mail', obscureText: false),

              SizedBox(height: 25),

              TextArea(controller: password, width: 325, height: 100, hintText: 'Password', obscureText: true),

              SizedBox(height: 25),

              Button(
                onTap: () async {
                  bool isDataOk = await signUpMethod();
                  if (isDataOk) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Account was created")));
                    Navigator.pushNamed(context, "LoginPage");
                  }
                  else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("The account could not be created because of wrong data input")));
                  }
                },
                message: 'Sign up',
                width: 300,
              ),
            ],
          ),
        )
      ),
    );
  }
}
