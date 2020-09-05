import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../providers/ingredients_provider.dart';

class IngredientTile extends StatefulWidget {
  IngredientTile({
    @required this.item,
    @required this.value,
    @required this.index,
    @required this.animation,
    @required this.listKey,
  });
  final String item;
  final int value, index;
  final Animation<double> animation;
  final GlobalKey<AnimatedListState> listKey;
  @override
  _IngredientTileState createState() => _IngredientTileState();
}

class _IngredientTileState extends State<IngredientTile> {
  Ingredients ingredient;
  String item;
  int value;
  TextStyle style = TextStyle();
  @override
  Widget build(BuildContext context) {
    ingredient = Provider.of<Ingredients>(context);
    item = widget.item;
    value = widget.value;
    style = Theme.of(context).textTheme.subtitle1.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        );
    return SizeTransition(
      sizeFactor: widget.animation,
      child: FadeTransition(
        opacity: widget.animation,
        child: ScaleTransition(
          scale: widget.animation,
          child: ListTile(
            title: Row(
              children: <Widget>[
                Expanded(
                  child: Text(item),
                ),
                // Text('$value'),
                // SizedBox(width: 20),
                Expanded(
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 1000),
                    transitionBuilder: (child, animation) => ScaleTransition(
                      scale: animation,
                      child: FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                    ),
                    child: Text(
                      '$value',
                      key: ValueKey(value),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  onPressed: () => showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (_) => _editDialog(),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  onPressed: () => showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (_) => _removeDialog(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _editDialog() {
    int newValue;
    return AlertDialog(
      backgroundColor: Colors.amber,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(80),
      ),
      content: TextField(
        inputFormatters: <TextInputFormatter>[
          WhitelistingTextInputFormatter.digitsOnly,
        ],
        keyboardType: TextInputType.number,
        maxLength: 6,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: 'New Value',
          hintStyle: TextStyle(color: Colors.black45),
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
        ),
        style: TextStyle(color: Colors.black),
        onChanged: (value) => newValue = int.tryParse(value),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            if (newValue != null) ingredient.updateMap(item, newValue);
            Navigator.of(context).pop();
          },
          child: Text(
            'Save',
            style: style,
          ),
        ),
        _cancelButton(),
      ],
    );
  }

  Widget _removeDialog() {
    return AlertDialog(
      backgroundColor: Colors.amber,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(80),
      ),
      content: Text(
        'Are you sure you want to remove this item?',
        style: style,
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
            widget.listKey.currentState.removeItem(
              widget.index,
              (context, animation) => IngredientTile(
                index: widget.index,
                item: item,
                value: value,
                animation: animation,
                listKey: widget.listKey,
              ),
              duration: Duration(milliseconds: 500),
            );
            ingredient.toggleItem(item);
            ingredient.removeFromMap(item);
          },
          child: Text(
            'Remove',
            style: style,
          ),
        ),
        _cancelButton(),
      ],
    );
  }

  Widget _cancelButton() {
    return FlatButton(
      onPressed: () => Navigator.of(context).pop(),
      child: Text(
        'Cancel',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
