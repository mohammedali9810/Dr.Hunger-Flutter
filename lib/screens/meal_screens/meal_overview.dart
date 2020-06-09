import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../providers/meals_provider.dart';
import '../user_screens/user_profile.dart';
import 'meal_detail_screen.dart';

class MealOverview extends StatefulWidget {
  @override
  _MealOverviewState createState() => _MealOverviewState();
}

class _MealOverviewState extends State<MealOverview> {
  bool isSingleView = false;

  @override
  Widget build(BuildContext context) {
    final meals = Provider.of<Meals>(context).meals;

    return Scaffold(
      drawer: Drawer(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffeaa448),
                Color(0xffe46b10),
                Color(0xffdd4400),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              Icon(
                Icons.fastfood,
                size: 50,
                color: Colors.white,
              ),
              Shimmer.fromColors(
                child: Text(
                  "Dr.Hunger",
                  style: TextStyle(
                    fontSize: 35,
                    fontFamily: "Pacifico",
                    shadows: <Shadow>[
                      Shadow(
                        blurRadius: 20,
                        color: Colors.black45,
                        offset: Offset.fromDirection(
                          120,
                          12,
                        ),
                      )
                    ],
                  ),
                ),
                baseColor: Colors.amber,
                highlightColor: Colors.black45,
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  "AI meal Planner",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Divider(
                  height: 1,
                  thickness: 2,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserProfile(),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(
                      Icons.perm_identity,
                      size: 40,
                    ),
                    Text(
                      'Profile',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          fontFamily: 'Anton'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: GradientAppBar(
        gradient: LinearGradient(
          colors: [
            Color(0xffeaa448),
            Color(0xffe46b10),
            Color(0xffdd4400),
          ],
        ),
        actions: <Widget>[
          LiveIconButton(
            icon: AnimatedIcons.list_view,
            onPressed: () => setState(() => isSingleView = !isSingleView),
          ),
        ],
        title: Text(
          'Meals',
        ),
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffeaa448),
              Color(0xffe46b10),
              Color(0xffdd4400),
            ],
          ),
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 700),
          child: LiveGrid(
            reAnimateOnVisibility: true,
            key: ValueKey(isSingleView),
            padding: EdgeInsets.all(10),
            itemCount: meals.length,
            itemBuilder: (context, index, animation) => FadeTransition(
              opacity: Tween<double>(begin: 0, end: 1).animate(animation),
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(0, -0.1),
                  end: Offset.zero,
                ).animate(animation),
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
                        builder: (context, constraints) => constraints
                                    .maxWidth >
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
                            : SizedBox.shrink(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isSingleView ? 1 : 2,
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
