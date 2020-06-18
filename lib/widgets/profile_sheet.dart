import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../providers/ingredients_provider.dart';

class ProfileSheet extends StatefulWidget {
  @override
  _ProfileSheetState createState() => _ProfileSheetState();
}

class _ProfileSheetState extends State<ProfileSheet>
    with TickerProviderStateMixin {
  Ingredients ingredient;
  Map<String, int> ingredients;
  Map<String, bool> items = Map<String, bool>();
  TextStyle _style = TextStyle();
  @override
  Widget build(BuildContext context) {
    ingredient = Provider.of<Ingredients>(context);
    ingredients = ingredient.ingredients;
    items.clear();
    items.addAll(ingredient.vegetables);
    items.addAll(ingredient.fruits);
    items.removeWhere((key, value) => value);
    _style = Theme.of(context).textTheme.subtitle1.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        );
    return LiveList(
      padding: EdgeInsets.all(20),
      shrinkWrap: true,
      itemCount: ingredients.length + 1,
      itemBuilder: (context, index, animation) {
        if (index == ingredients.length) return _addButton();
        AnimationController controller = AnimationController(
          vsync: this,
          duration: Duration(milliseconds: 500),
        );
        Animation<double> heightAnimation = Tween<double>(
          begin: 56,
          end: 0,
        ).animate(controller);
        Animation<double> opacityAnimation = Tween<double>(
          begin: 1,
          end: 0,
        ).animate(controller);
        String item = ingredients.keys.toList()[index];
        int value = ingredients.values.toList()[index];
        return FadeTransition(
          opacity: Tween<double>(begin: 0, end: 1).animate(animation),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset(0, -0.1),
              end: Offset.zero,
            ).animate(animation),
            child: AnimatedBuilder(
              animation: opacityAnimation,
              builder: (context, child) => Opacity(
                opacity: opacityAnimation.value,
                child: AnimatedBuilder(
                  animation: heightAnimation,
                  builder: (context, _) => Container(
                    height: heightAnimation.value,
                    child: ScaleTransition(
                      scale: opacityAnimation,
                      child: child,
                    ),
                  ),
                ),
              ),
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(item),
                    Text('$value'),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                      onPressed: () => showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (_) => _editDialog(item),
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
                        builder: (_) => _removeDialog(item, controller),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _editDialog(String item) {
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
            ingredient.updateMap(item, newValue);
            Navigator.of(context).pop();
          },
          child: Text(
            'Save',
            style: _style,
          ),
        ),
        _cancelButton(),
      ],
    );
  }

  Widget _removeDialog(String item, AnimationController controller) {
    return AlertDialog(
      backgroundColor: Colors.amber,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(80),
      ),
      content: Text(
        'Are you sure you want to remove this item?',
        style: _style,
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
            controller.forward().then((value) {
              ingredient.removeFromMap(item);
              ingredient.toggleItem(item);
            });
          },
          child: Text(
            'Remove',
            style: _style,
          ),
        ),
        _cancelButton(),
      ],
    );
  }

  Widget _addDialog() {
    String newItem;
    int newValue = 0;
    return StatefulBuilder(
      builder: (context, setState) => AlertDialog(
        backgroundColor: Colors.amber,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(80),
        ),
        content: Row(
          children: <Widget>[
            Expanded(
              child: DropdownButton<String>(
                dropdownColor: Colors.amber,
                style: _style,
                underline: SizedBox.shrink(),
                isExpanded: true,
                value: newItem,
                onChanged: (item) => setState(() => newItem = item),
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
            SizedBox(width: 20),
            Expanded(
              child: TextField(
                enabled: newItem != null,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly,
                ],
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: _style,
                decoration: InputDecoration(hintText: 'Amount'),
                onChanged: (value) => newValue = int.tryParse(value),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                ingredient.toggleItem(newItem);
                ingredient.addToMap(newItem, newValue);
              });
            },
            child: Text(
              'Add',
              style: _style,
            ),
          ),
          _cancelButton(),
        ],
      ),
    );
  }

  Widget _addButton() {
    return Center(
      heightFactor: 1.5,
      child: RaisedButton(
        elevation: 5,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Icon(Icons.add_circle_outline),
        color: Colors.amber,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        onPressed: () => showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) => _addDialog(),
        ),
      ),
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
