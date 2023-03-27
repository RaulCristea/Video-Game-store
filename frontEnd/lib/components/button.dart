import 'package:flutter/material.dart';

class Button extends StatelessWidget {

  final Function()? onTap;
  final String message;
  final double width;

  const Button({
    super.key,
    required this.onTap,
    required this.message,
    required this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.all(8.0),
          margin: EdgeInsets.symmetric(horizontal: 5),
          width: width,
          decoration: BoxDecoration(
            color: Colors.purple[800],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
              child: Text(
                message,
                style: TextStyle(color: Colors.amber[100]),
              )
          )
      ),
    );
  }
}
