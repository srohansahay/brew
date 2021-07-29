import 'package:flutter/material.dart';
import 'package:ninja_brew_crew/services/auth.dart';

class Home extends StatelessWidget {
  // const Home({Key key}) : super(key: key);

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        backgroundColor: Colors.brown[500],
        title: Text('Ninja Brew Crew'),
        elevation: 0.0,
        actions: <Widget>[
          TextButton.icon(
              onPressed: () async {
                await _auth.signout();
              },
              icon: Icon(Icons.person, color: Colors.white),
              label: Text(
                'Sign out',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
