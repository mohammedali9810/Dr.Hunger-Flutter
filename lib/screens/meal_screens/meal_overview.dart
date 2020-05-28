import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/meals_provider.dart';
import 'meal_detail_screen.dart';

class MealOverView extends StatefulWidget {
  @override
  _MealOverViewState createState() => _MealOverViewState();
}

class _MealOverViewState extends State<MealOverView> {
  bool isSingleView = false;

  @override
  Widget build(BuildContext context) {
    final meals = Provider.of<Meals>(context).meals;

    return SafeArea(
      child: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(
                isSingleView ? Icons.view_module : Icons.view_day,
              ),
              onPressed: () => setState(() => isSingleView = !isSingleView),
            ),
          ],
          title: Text(
            'Meals',
          ),
        ),
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 700),
          child: GridView.builder(
            key: ValueKey(isSingleView),
            padding: EdgeInsets.all(10),
            itemCount: meals.length,
            itemBuilder: (context, index) => ChangeNotifierProvider.value(
              value: meals[index],
              child: GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MealDetailScreen(
                      imageUrl: meals[index].imageUrl,
                      description: meals[index].description,
                      title: meals[index].name,
                    ),
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      // todo: wrap in a Hero widget
                      child: Image.asset(
                        meals[index].imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    LayoutBuilder(
                      builder: (context, constraints) => constraints.maxWidth >
                              MediaQuery.of(context).size.width / 2
                          ? Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                margin: EdgeInsets.only(bottom: 30),
                                height: 80,
                                width: 250,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white70,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'BREAKFAST',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Enjoy With Your Time',
                                      style: TextStyle(
                                        fontFamily: 'Pacifico',
                                        color: Colors.grey.shade800,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container(),
                    ),
                  ],
                ),
              ),
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isSingleView ? 1 : 2,
              //  crossAxisCount: (MediaQuery.of(context).size.width > 350)? 2 : 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 2,
              childAspectRatio: 3 / 2,
            ),
          ),
        ),
      ),
    );
  }
}
