import 'package:flutter/material.dart';

class FaceBookButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 300,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff1959a9),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    topLeft: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: Text('f',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w400)),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff2872ba),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5),
                    topRight: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: Text('Login with Facebook',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400)),
            ),
          ),
        ],
      ),
    );
  }
}
//Widget _facebookButton() {
//  return Container(
//    height: 50,
//    width: 300,
//    margin: EdgeInsets.symmetric(vertical: 10),
//    decoration: BoxDecoration(
//      borderRadius: BorderRadius.all(Radius.circular(50)),
//    ),
//    child: Row(
//      children: <Widget>[
//        Expanded(
//          flex: 1,
//          child: Container(
//            decoration: BoxDecoration(
//              color: Color(0xff1959a9),
//              borderRadius: BorderRadius.only(
//                  bottomLeft: Radius.circular(5),
//                  topLeft: Radius.circular(5)),
//            ),
//            alignment: Alignment.center,
//            child: Text('f',
//                style: TextStyle(
//                    color: Colors.white,
//                    fontSize: 25,
//                    fontWeight: FontWeight.w400)),
//          ),
//        ),
//        Expanded(
//          flex: 5,
//          child: Container(
//            decoration: BoxDecoration(
//              color: Color(0xff2872ba),
//              borderRadius: BorderRadius.only(
//                  bottomRight: Radius.circular(5),
//                  topRight: Radius.circular(5)),
//            ),
//            alignment: Alignment.center,
//            child: Text('Login with Facebook',
//                style: TextStyle(
//                    color: Colors.white,
//                    fontSize: 18,
//                    fontWeight: FontWeight.w400)),
//          ),
//        ),
//      ],
//    ),
//  );
//}
//
//Widget _gmailButton() {
//  return Container(
//    height: 50,
//    width: 300,
//    margin: EdgeInsets.symmetric(vertical: 10),
//    decoration: BoxDecoration(
//      borderRadius: BorderRadius.all(Radius.circular(10)),
//    ),
//    child: Row(
//      children: <Widget>[
//        Expanded(
//          flex: 1,
//          child: Container(
//            decoration: BoxDecoration(
//              color: Colors.white,
//              borderRadius: BorderRadius.only(
//                  bottomLeft: Radius.circular(5),
//                  topLeft: Radius.circular(5)),
//            ),
//            alignment: Alignment.center,
//            child: Text('G',
//                style: TextStyle(
//                    color: Colors.red,
//                    fontSize: 25,
//                    fontWeight: FontWeight.w400)),
//          ),
//        ),
//        Expanded(
//          flex: 5,
//          child: Container(
//            decoration: BoxDecoration(
//              color: Colors.red,
//              borderRadius: BorderRadius.only(
//                  bottomRight: Radius.circular(5),
//                  topRight: Radius.circular(5)),
//            ),
//            alignment: Alignment.center,
//            child: Text('Login with Gmail',
//                style: TextStyle(
//                    color: Colors.white,
//                    fontSize: 18,
//                    fontWeight: FontWeight.w400)),
//          ),
//        ),
//      ],
//    ),
//  );
//}