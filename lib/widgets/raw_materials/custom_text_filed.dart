import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final Function getValue;

  CustomTextField({@required this.getValue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: TextField(
          decoration: InputDecoration(
            hintText: 'Amount',
            fillColor: Colors.white70,
            filled: true,
          ),
          onChanged: getValue,
      ),
    );
  }
}
