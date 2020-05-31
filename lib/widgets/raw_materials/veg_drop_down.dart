import 'package:flutter/material.dart';

class VegDropDown extends StatefulWidget {

  @override
  _VegDropDownState createState() => _VegDropDownState();
}
class _VegDropDownState extends State<VegDropDown> {

   List <String> veg=  ['Meat','Potatos','Chicks','Rice','Tomatoes','Pepper'];
   String selectedVeg = 'Tomatoes';

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
        items: veg.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
