import 'package:flutter/material.dart';

class IngredientRow extends StatefulWidget {
  IngredientRow({this.isFruit = false});
  final bool isFruit;

  @override
  _IngredientRowState createState() => _IngredientRowState();
}

class _IngredientRowState extends State<IngredientRow> {
  final List<String> _vegetables = [
    'Meat',
    'Potatoes',
    'Chickens',
    'Rice',
    'Tomatoes',
    'Pepper',
  ];
  final List<String> _fruits = [
    'Apple',
    'Orange',
    'Peach',
    'Apricot',
  ];
  String selectedItem;

  @override
  Widget build(BuildContext context) {
    bool isFruit = widget.isFruit;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 5,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: DropdownButton<String>(
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .apply(color: Colors.white),
              isExpanded: true,
              dropdownColor: Colors.grey[900],
              underline: SizedBox.shrink(),
              value: selectedItem,
              onChanged: (value) {
                setState(() => selectedItem = value);
                Focus(
                  child: SizedBox(),
                );
              },
              items: (isFruit ? _fruits : _vegetables)
                  .map(
                    (String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ),
                  )
                  .toList(),
            ),
          ),
          SizedBox(width: 30),
          Expanded(
            child: TextField(
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .apply(color: Colors.white),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Amount',
                hintStyle: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .apply(color: Colors.white38),
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }
}
