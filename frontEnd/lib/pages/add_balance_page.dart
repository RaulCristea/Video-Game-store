import 'dart:convert';
import 'package:http/http.dart';

import 'package:flutter/material.dart';
import 'package:ruligames/components/button.dart';
import 'package:ruligames/components/text_field.dart';
import 'package:ruligames/models/user.dart';

import 'home_page.dart';

User user = new User();

class AddBalancePage extends StatefulWidget {
  final User userGlobal;
  const AddBalancePage({super.key, required this.userGlobal});

  @override
  State<AddBalancePage> createState() => _AddBalancePageState();
}

class _AddBalancePageState extends State<AddBalancePage> {

  final newBalanceController = TextEditingController();
  Future<bool> addBalanceMethod() async {
    double balance = (widget.userGlobal.balance! + double.parse(newBalanceController.text));
    Map<String, dynamic> jsonMap = {
      'username': widget.userGlobal.username,
      'password': widget.userGlobal.password,
      'balance': balance,
      'admin': 0,
    };
    String url = "http://10.0.2.2:8080/homepage/signup";
    final Client client = Client();
    final Response response = await client.post(Uri.parse(url),
        body: json.encode(jsonMap),
        headers: {"Accept": "application/json",
          "content-type": "application/json"});
    return response.statusCode == 200;
    }

  Future<bool> getUpdatedUser() async {
    String url = 'http://10.0.2.2:8080/homepage/getUser/${widget.userGlobal.username}';
    final client = Client();
    final Response response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      user = User.fromJson(jsonDecode(response.body));
    }
    return response.statusCode == 200;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
          backgroundColor: Colors.purple[800],
          title: Text('Ruli Games',style: TextStyle(color: Colors.amber[100])),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Initial balance: ${widget.userGlobal.balance}'+" \$", style: TextStyle(color: Colors.amber[100], fontWeight: FontWeight.bold, fontSize: 17)),
                    ],
                  ),
                )
            ),
          ]
      ),
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextArea(controller: newBalanceController, width: 325, height: 50, hintText: "Sum that you want to add", obscureText: false),
              SizedBox(height: 20),
              Button(onTap: () async{
                bool isDataOk = await addBalanceMethod();
                if (isDataOk) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Balance updated")));
                }
                else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Balance could not be updated")));
                }
              },
                  message: "Add Money",
                  width: 100),
              SizedBox(height: 20),
              Button(onTap: () async{
                bool isDataOk = await getUpdatedUser();
                if (isDataOk) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Your account has been updated")));
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(userGlobal: user)));
                }
                else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Something went wrong")));
                }
              },
                  message: "Reload",
                  width: 100),
            ],
          ),
        ),
      ),
    );
  }
}