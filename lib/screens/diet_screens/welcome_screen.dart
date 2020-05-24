// import './diet_generator_screen.dart';
// import 'package:flutter/material.dart';

// class WelcomeScreen extends StatelessWidget {
//   const WelcomeScreen({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/images/background.jpg'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: SafeArea(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
//             child: Stack(
//               children: <Widget>[
//                 Column(
//                   children: <Widget>[
//                     Text(
//                       'Ready 4 change?',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Colors.blueGrey[700],
//                         fontSize: 32.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 20.0),
//                     Text(
//                       'Create your meal plan right here in seconds.',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Colors.blueGrey[700],
//                         fontSize: 24.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 12.0),
//                     Text(
//                       'Reach your diet and nutritional goals with our calorie calculator, weekly meal plans, grocery lists and more.',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Colors.blueGrey[700],
//                         fontSize: 15.0,
//                         fontWeight: FontWeight.w300,
//                       ),
//                     )
//                   ],
//                 ),
//                 Positioned(
//                   bottom: 0.0,
//                   left: 0.0,
//                   right: 0.0,
//                   child: InkWell(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (BuildContext context) => DietGeneratorScreen(),
//                         ),
//                       );
//                     },
//                     child: Container(
//                       width: MediaQuery.of(context).size.width,
//                       padding: EdgeInsets.symmetric(vertical: 13),
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(5)),
//                         border: Border.all(color: Colors.white, width: 2),
//                       ),
//                       child: Text(
//                         'let me in.LET ME In!!',
//                         style: TextStyle(color: Colors.white, fontSize: 20),
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// FlatButton(

//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (_) => DietGeneratorScreen(),
//                         ),
//                       );
//                     },

//                     color: Colors.blueGrey[800],
//                     padding: EdgeInsets.symmetric(vertical: 15.0),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     child: Text(
//                       'Let me In ,Let me in!!!',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16.0,
//                       ),
//                     ),
//                   ),
