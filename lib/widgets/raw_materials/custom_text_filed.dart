import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final Function getValue;

  CustomTextField({@required this.getValue});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Amount',
        fillColor: Colors.white70,
        filled: true,
      ),
      onChanged: getValue,
    );
  }
}
