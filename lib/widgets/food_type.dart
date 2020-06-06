import 'package:flutter/material.dart';

class FoodTypeCard extends StatelessWidget {
  const FoodTypeCard({this.image, this.title, this.isSelected, this.onPress});

  final String image;
  final String title;
  final bool isSelected;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.amber : Colors.black45,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              right: 10.0,
              top: 10.0,
              child: isSelected
                  ? Icon(
                      Icons.check_circle,
                      color: Colors.black54,
                    )
                  : SizedBox.shrink(),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image(
                    image: AssetImage(
                      image,
                    ),
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      color: isSelected ? Colors.black : Colors.white60,
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
