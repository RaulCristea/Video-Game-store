/*
This app represents a video game store that sells digital key video games.
Ruli Games Co. is a small company, founded by an ambitious young man, with a goal in mind. Making games as easy to buy
at the lowest possible price.
He won't stop there, his true goal is to make games as well, Ruli Games Co. will be a video game developer company in the future
because, everybody needs a little bit of fun in their lifes.

SPECS:
-The front end was coded in flutter to allow me to code an Android app easier. After a little bit of research I considered that
flutter is the way I want to go because I wanted to learn something more ambitious and oh boy, I regreted it
instanly :)
I didnt understand anything at first, but after lots of hours I started to get some footing on how
flutter works.
-The backend was coded in Java Spring Boot, and that was a little bit easier to learn because I was kind of
familiar with how the structure should of looked like because I worked with similar tasks before.

In the end I want to say that I really enjoyed developing my first ever application from head to toe and I consider
this project to be the most useful one that I did since I started UTCN, because it pushed me to learn a lot
and I really felt rewarded for each piece of research that i made.
 */

import 'package:flutter/material.dart';
import 'package:ruligames/components/sign_up_button.dart';
import 'package:ruligames/pages/home_page.dart';
import 'package:ruligames/pages/login_page.dart';
import 'package:ruligames/pages/register_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ruli Games',
      home:  LoginPage(),
      routes: {
        "LoginPage" : (BuildContext context) => LoginPage(),
        "RegisterPage" :(BuildContext context) => RegisterPage(),

      },
    );
  }
}


