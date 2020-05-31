import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RawMaterials extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        title: Text(
          'Raw Materials You Own ..',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text('VEGETABLES'),
            Row(
              children: <Widget>[

              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        child: Padding(
          padding: EdgeInsets.only(right: 30.0, left: 30.0, bottom: 20.0),
          child: FlatButton(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
            color: Color(0xfff7892b),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RawMaterials()));
            },
            child: Text(
              'Generate',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
