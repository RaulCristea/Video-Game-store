import 'package:flutter/material.dart';

class TextArea extends StatelessWidget {

  final controller;
  final double width;
  final double height;
  final String hintText;
  final bool obscureText;


  const TextArea({
    super.key,
    required this.controller,
    required this.width,
    required this.height,
    required this.hintText,
    required this.obscureText}
      );

  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        constraints: BoxConstraints(
            minWidth: 5,
            maxWidth: width,
            minHeight: 5,
            maxHeight: height
        ),
        enabledBorder:  OutlineInputBorder(
          borderSide: BorderSide(color: Colors.purple[800]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.purple[800]!),
        ),
        fillColor: Colors.amber[100],
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.purple[100], fontStyle: FontStyle.italic),
      ),
      style:  TextStyle(
        color: Colors.purple[800]!,
      ),
    );
  }
}
