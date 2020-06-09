import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/ingredients_provider.dart';

class IngredientRow extends StatefulWidget {
  IngredientRow({this.isFruit = false, this.animate = false});
  final bool isFruit;
  final bool animate;

  @override
  _IngredientRowState createState() => _IngredientRowState();
}

class _IngredientRowState extends State<IngredientRow> {
  String _selectedItem, _oldItem;
  double _numberValue;
  FocusNode _node = FocusNode();
  bool startAnimation = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() => startAnimation = true);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Ingredients ingredients = Provider.of<Ingredients>(context);
    bool isFruit = widget.isFruit;
    bool animate = widget.animate;
    Map<String, bool> items =
        isFruit ? ingredients.fruits : ingredients.vegetables;
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      height: animate ? startAnimation ? 65 : 0 : 65,
      child: Row(
        children: <Widget>[
          Expanded(
            child: DropdownButton<String>(
              isExpanded: true,
              dropdownColor: Colors.grey[900],
              underline: SizedBox.shrink(),
              value: _selectedItem,
              onChanged: (value) {
                if (items[value]) {
                  Scaffold.of(context).hideCurrentSnackBar();
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text(
                      'You can\'t choose an item more than once!',
                      style: Theme.of(context).textTheme.subtitle1,
                      textAlign: TextAlign.center,
                    ),
                  ));
                } else {
                  _oldItem = _selectedItem;
                  _selectedItem = value;
                  ingredients.toggleItem(_selectedItem, isFruit);
                  if (_oldItem != null) {
                    ingredients.toggleItem(_oldItem, isFruit);
                    ingredients.removeFromMap(_oldItem);
                  }
                  ingredients.addToMap(_selectedItem, _numberValue);
                  FocusScope.of(context).requestFocus(_node);
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
              focusNode: _node,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Amount',
                hintStyle: TextStyle(color: Colors.white30),
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
              onChanged: (value) {
                _numberValue = double.tryParse(value);
                ingredients.updateMap(_selectedItem, _numberValue);
              },
            ),
          ),
        ],
      ),
    );
  }
}
