import 'package:flutter/material.dart';

class IngredientRow extends StatefulWidget {
  IngredientRow(
      {this.isFruit = false,
      @required this.selectDataFun,
      @required this.selectedItem,
      @required this.numberFun,});

  final bool isFruit;
  final Function selectDataFun;
  final String selectedItem;
  final Function numberFun;

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
  FocusNode _node = new FocusNode();

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
              isExpanded: true,
              dropdownColor: Colors.grey[900],
              underline: SizedBox.shrink(),
              value: widget.selectedItem,
              onChanged: widget.selectDataFun,
              items: (isFruit ? _fruits : _vegetables)
                  .map(
                    (String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Center(
                        child: Text(
                          value
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          SizedBox(width: 30),
          Expanded(
            child: TextField(
              focusNode: _node,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Amount',
                hintStyle: TextStyle(color: Colors.white30),
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
              onChanged:widget.numberFun,
            ),
          ),
        ],
      ),
    );
  }
}
