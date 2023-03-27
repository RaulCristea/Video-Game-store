import 'dart:convert';
import 'package:http/http.dart';

import 'package:flutter/material.dart';
import 'package:ruligames/components/button.dart';
import 'package:ruligames/components/sign_up_button.dart';
import 'package:ruligames/components/text_field.dart';
import 'package:ruligames/models/user.dart';
import 'package:ruligames/pages/home_page.dart';

import 'admin_home_page.dart';

User user = new User();

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<String?> getLogin() async {
    String url = 'http://10.0.2.2:8080/homepage/getUser/${usernameController.text}';
    String? validate = 'error';
    final client = Client();
    final Response response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      user = User.fromJson(jsonDecode(response.body));
      if (user.username == usernameController.text && user.password == passwordController.text) {
        if (user.admin == true) {
          validate = 'admin';
        }
        else {
          validate = 'client';
        }
      }
      return validate;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        title: Text(
            'Ruli Games',
            style: TextStyle(color: Colors.amber[100]),),
      ),
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.account_circle_outlined,
                color: Colors.purple[800],
                size: 120,
              ),
              const SizedBox(height: 25),
              TextArea(controller: usernameController, width: 325, height: 50, hintText: "E-mail", obscureText: false),
              SizedBox(height: 10),
              TextArea(controller: passwordController, width: 325, height: 50, hintText: "Password", obscureText: true),
              SizedBox(height: 10),
              Button(onTap: () async{
                String? validator = await getLogin();
                if(validator == 'admin'){
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Valid credentials")));
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AdminHomePage(userGlobal: user)));
                }
                else if(validator == 'client'){
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Valid credentials")));
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(userGlobal: user)));
                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Invalid credentials")));
                }
              },
                  message: "Log me in!",
                  width: 100,
              ),
              const SizedBox(height: 25),
              Align(
                alignment: Alignment.center,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Need an account?',
                        style: TextStyle(color: Colors.purple[800]),
                      ),
                      SizedBox(width: 10),
                      SignUp(
                        onTap: (){ Navigator.pushNamed(context, "RegisterPage");},
                      )
                    ],
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
