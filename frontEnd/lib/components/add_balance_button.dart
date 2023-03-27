import 'package:flutter/material.dart';

class AddBalance extends StatelessWidget {

  final Function() onTap;

  const AddBalance({
    super.key,
    required this.onTap});



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.all(2.0),
          height: 25,
          decoration: BoxDecoration(
            color: Colors.amber[100],
            borderRadius: BorderRadius.circular(8.0),

          ),
          child: Center(
              child: Text(
                'Add',
                style: TextStyle(color: Colors.purple[800], fontWeight: FontWeight.bold),
              )
          )
      ),
    );
  }
}