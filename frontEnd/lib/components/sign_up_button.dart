import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {

  final Function() onTap;

  const SignUp({
    super.key,
    required this.onTap});



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.all(4.0),
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: Colors.purple[800],
            borderRadius: BorderRadius.circular(8.0),

          ),
          child: Center(
              child: Text(
                ' Sign up here!',
                style: TextStyle(color: Colors.amber[100]),
              )
          )
      ),
    );
  }
}