import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../providers/ingredients_provider.dart';
import '../widgets/ingredient_tile.dart';

class ProfileSheet extends StatefulWidget {
  @override
  _ProfileSheetState createState() => _ProfileSheetState();
}

class _ProfileSheetState extends State<ProfileSheet>
    with TickerProviderStateMixin {
  Ingredients ingredient;
  Map<String, int> ingredients;
  TextStyle style = TextStyle();
  final Map<String, bool> availableItems = Map<String, bool>();
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadItems());
    super.initState();
  }

  Future<void> _loadItems() async {
    ingredients.clear();
    try {
      for (int index = 0; index <= ingredient.ingredients.length; index++) {
        if (index == ingredient.ingredients.length)
          return listKey.currentState.insertItem(
            index,
            duration: Duration(seconds: 1),
          );
        final item = ingredient.ingredients.entries.toList()[index];
        ingredients.putIfAbsent(item.key, () => item.value);
        listKey.currentState.insertItem(
          index,
          duration: Duration(seconds: 1),
        );
        await Future.delayed(Duration(milliseconds: 250));
      }
    } on NoSuchMethodError {}
  }

  @override
  Widget build(BuildContext context) {
    ingredient = Provider.of<Ingredients>(context);
    ingredients = ingredient.ingredients;
    availableItems.clear();
    availableItems.addAll(ingredient.vegetables);
    availableItems.addAll(ingredient.fruits);
    availableItems.removeWhere((key, value) => value);
    style = Theme.of(context).textTheme.subtitle1.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        );
    return AnimatedList(
      controller: scrollController,
      key: listKey,
      padding: EdgeInsets.only(top: 10, left: 20, right: 20),
      shrinkWrap: true,
      itemBuilder: (context, index, animation) {
        return index == ingredients.length
            ? _addButton(animation)
            : IngredientTile(
                animation: animation,
                index: index,
                listKey: listKey,
              );
      },
    );
  }

  Widget _addButton(Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: FadeTransition(
        opacity: animation,
        child: ScaleTransition(
          scale: animation,
          child: Container(
            padding: EdgeInsets.only(bottom: 20),
            child: Center(
              child: RaisedButton(
                elevation: 5,
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  'Add',
                  style: style,
                ),
                color: Colors.amber,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                onPressed: () {
                  if (availableItems.isNotEmpty)
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (context) => _addDialog(),
                    );
                },
              ),
            ),
          ),
        ),
      ),
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
                style: style,
                underline: SizedBox.shrink(),
                isExpanded: true,
                value: newItem,
                onChanged: (item) => setState(() => newItem = item),
                items: availableItems.keys
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
                maxLength: 6,
                textAlign: TextAlign.center,
                style: style,
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
              if (newItem != null) {
                ingredient.toggleItem(newItem);
                ingredient.addToMap(newItem, newValue);
                listKey.currentState.insertItem(
                  ingredients.length,
                  duration: Duration(milliseconds: 500),
                );
                scrollController.animateTo(
                  scrollController.position.maxScrollExtent + 300,
                  duration: Duration(seconds: 3),
                  curve: Curves.easeInOut,
                );
              }
            },
            child: Text(
              'Add',
              style: style,
            ),
          ),
          FlatButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
