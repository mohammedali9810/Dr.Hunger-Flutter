import 'package:flutter/material.dart';

class FruitsDropDown extends StatefulWidget {

  @override
  _FruitsDropDownState createState() => _FruitsDropDownState();
}
class _FruitsDropDownState extends State<FruitsDropDown> {

  List <String> Fruits=  ['Apple','Orange','Peache','Apricot'];
  String selectedVeg = 'Apple';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: DropdownButton<String>(
        isExpanded: true,
        underline: SizedBox.shrink(),
        value:  selectedVeg ,
        style: TextStyle(
          color: Colors.grey[500],
          fontWeight: FontWeight.bold,
          fontSize: 15.0,
        ),
        onChanged: (value) =>
            setState(() => selectedVeg = value),
        items: Fruits.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}