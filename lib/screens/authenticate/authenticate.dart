import 'package:flutter/material.dart';
import 'package:ninja_brew_crew/screens/authenticate/register.dart';
import 'package:ninja_brew_crew/screens/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  //const Authenticate({Key key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      print(showSignIn);
      return Sign_in(toggleView: toggleView);
    } else {
      print(showSignIn);
      return Register(toggleView: toggleView);
    }
  }
}
