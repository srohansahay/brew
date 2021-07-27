import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ninja_brew_crew/services/auth.dart';

class Sign_in extends StatefulWidget {
  //const Sign_in({Key key}) : super(key: key);



  @override
  _Sign_inState createState() => _Sign_inState();
}

class _Sign_inState extends State<Sign_in> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text('Sign in Brew Crew'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        child: ElevatedButton(
          onPressed: () async {
            dynamic result = await  _auth.signinanon();
            if (result == null) {
              print('error signing in');
            }
            else{
              print('signed in');
              print(result);
            }

          },
          child: Text('Sign-in anon'),

        ),
      ),
    );
  }
}
