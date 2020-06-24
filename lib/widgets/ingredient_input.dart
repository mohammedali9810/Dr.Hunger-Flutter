import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../providers/ingredients_provider.dart';

class IngredientInput extends StatefulWidget {
  IngredientInput({this.isFruit = false});
  final bool isFruit;

  @override
  _IngredientInputState createState() => _IngredientInputState();
}

class _IngredientInputState extends State<IngredientInput> {
  String _selectedItem, _oldItem;
  int _numberValue = 0;
  FocusNode _node = FocusNode();

  @override
  Widget build(BuildContext context) {
    Ingredients ingredients = Provider.of<Ingredients>(context);
    bool isFruit = widget.isFruit;
    Map<String, bool> items =
        isFruit ? ingredients.fruits : ingredients.vegetables;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: DropdownButton<String>(
              onTap: () => FocusScope.of(context).requestFocus(_node),
              focusNode: _node,
              isExpanded: true,
              dropdownColor: Colors.grey[900],
              underline: SizedBox.shrink(),
              value: _selectedItem,
              onChanged: (value) {
                if (items[value]) {
                  Scaffold.of(context).hideCurrentSnackBar();
                  Scaffold.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.amber,
                    content: Text(
                      'You can\'t choose an item more than once!',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ));
                } else {
                  _oldItem = _selectedItem;
                  _selectedItem = value;
                  ingredients.toggleItem(_selectedItem);
                  if (_oldItem != null) {
                    ingredients.toggleItem(_oldItem);
                    ingredients.removeFromMap(_oldItem);
                  }
                  ingredients.addToMap(_selectedItem, _numberValue);
                }
              },
              items: items.keys
                  .map((value) => DropdownMenuItem<String>(
                        value: value,
                        child: Center(
                          child: Text(value),
                        ),
                      ))
                  .toList(),
            ),
          ),
          SizedBox(width: 30),
          Expanded(
            child: TextField(
              enabled: _selectedItem != null,
              inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter.digitsOnly,
              ],
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Amount',
                hintStyle: TextStyle(color: Colors.white30),
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
              onChanged: (value) {
                _numberValue = int.tryParse(value);
                ingredients.updateMap(_selectedItem, _numberValue);
              },
            ),
          ),
        ],
      ),
    );
  }
}
