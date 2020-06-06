import 'package:firebase_auth/firebase_auth.dart';

class FireAuth {
  final _auth = FirebaseAuth.instance;

  Future<AuthResult> signUp (String email , String password,String name) async{
    var result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    return result;
  }

  Future<AuthResult> logIn (String email , String password) async{
    var result = await _auth.signInWithEmailAndPassword(email: email, password: password);
    return result;
  }
}