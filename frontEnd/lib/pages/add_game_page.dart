import 'dart:convert';
import 'package:http/http.dart';

import 'package:flutter/material.dart';
import 'package:ruligames/components/button.dart';
import 'package:ruligames/components/text_field.dart';
import 'package:ruligames/models/user.dart';

import 'admin_home_page.dart';
import 'home_page.dart';

User user = new User();

class AddGamePage extends StatefulWidget {
  final User userGlobal;
  const AddGamePage({super.key, required this.userGlobal});

  @override
  State<AddGamePage> createState() => _AddGamePageState();
}

class _AddGamePageState extends State<AddGamePage> {

  final newNameController = TextEditingController();
  final newPriceController = TextEditingController();
  final newPublisherIdController = TextEditingController();
  final newGenreController = TextEditingController();
  Future<bool> addGameMethod() async {
    Map<String, dynamic> jsonMap = {
      'name': newNameController.text,
      'price': double.parse(newPriceController.text),
      'publisherId': int.parse(newPublisherIdController.text),
      'genre': newGenreController.text,
    };
    String url = "http://10.0.2.2:8080/homepage/gameregister";
    final Client client = Client();
    final Response response = await client.post(Uri.parse(url),
        body: json.encode(jsonMap),
        headers: {"Accept": "application/json",
          "content-type": "application/json"});
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
          ]
      ),
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextArea(controller: newNameController, width: 325, height: 50, hintText: "Name", obscureText: false),
              SizedBox(height: 20),
              TextArea(controller: newPriceController, width: 325, height: 50, hintText: "Price", obscureText: false),
              SizedBox(height: 20),
              TextArea(controller: newGenreController, width: 325, height: 50, hintText: "Genre", obscureText: false),
              SizedBox(height: 20),
              TextArea(controller: newPublisherIdController, width: 325, height: 50, hintText: "Publisher Id", obscureText: false),
              SizedBox(height: 20),
              Button(onTap: () async{
                bool isDataOk = await addGameMethod();
                if (isDataOk) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Game added")));
                }
                else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Game could not be added")));
                }
              },
                  message: "Add Game",
                  width: 100),
              SizedBox(height: 20),
              Button(onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Game list updated")));
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AdminHomePage(userGlobal: user)));
                },
                  message: "Exit",
                  width: 100),
            ],
          ),
        ),
      ),
    );
  }
}