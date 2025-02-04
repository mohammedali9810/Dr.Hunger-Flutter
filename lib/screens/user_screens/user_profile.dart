import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../widgets/profile_sheet.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final endColor = Color(0xFFe46792);
  final startColor = Color(0xFFaa7ce4);
  final titleColor = Color(0xff444444);
  final textColor = Color(0xFFa9a9a9);
  final shadowColor = Color(0xffe9e9f4);
  final newColor = Color(0xfffbb448);
  final newColor2 = Color(0xffe46b10);
  String username, age, height, weight;

  @override
  void initState() {
    _getUserData().catchError(() {
      username = 'test user';
      age = '25';
      height = '175';
      weight = '70';
    });

    super.initState();
  }

  Future<void> _getUserData() async {
    FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();
    DocumentSnapshot userInfo = await Firestore.instance
        .collection('Users_Info')
        .document(currentUser.uid)
        .get();
    DocumentSnapshot user = await Firestore.instance
        .collection('Users')
        .document(currentUser.uid)
        .get();
    username = userInfo.data['name'].toString();
    age = user.data['age'].toString();
    height = user.data['height'].toString();
    weight = user.data['weight'].toString();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xffeaa448),
            Color(0xffe46b10),
            Color(0xffdd4400),
          ],
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: 140,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xffeaa448),
                            Color(0xffe46b10),
                            Color(0xffdd4400),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 20,
                                left: 20,
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.keyboard_backspace,
                                  color: Colors.white,
                                ),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text(
                                'DR.HUNGER',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 20,
                                right: 20,
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Transform.translate(
                  offset: Offset(0, -35),
                  child: Container(
                    height: 440,
                    width: 285,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: shadowColor,
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 55,
                            backgroundImage:
                                AssetImage('assets/images/user.png'),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          username,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: titleColor,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(
                                '$age Years',
                                style: TextStyle(
                                  color: newColor2,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '$height cm',
                                style: TextStyle(
                                  color: newColor2,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '$weight Kg',
                                style: TextStyle(
                                  color: newColor2,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 250,
                          height: 125,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: newColor2,
                                spreadRadius: 5,
                                blurRadius: 1,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 30,
                            right: 30,
                          ),
                          child: Divider(
                            color: Colors.grey,
                            thickness: 1,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(
                                    Icons.settings,
                                    size: 30,
                                    color: Colors.black54,
                                  ),
                                  onPressed: () {},
                                ),
                                Text(
                                  'SETTINGS',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(
                                    Icons.local_phone,
                                    size: 30,
                                    color: Colors.black54,
                                  ),
                                  onPressed: () {},
                                ),
                                Text(
                                  'CALL US',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () => showModalBottomSheet(
                    context: context,
                    builder: (_) => ClipRRect(
                      child: ProfileSheet(),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                    ),
                    backgroundColor: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                    ),
                  ),
                  color: Colors.amber,
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 15,
                  ),
                  child: Text(
                    'Show my Inventory',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
