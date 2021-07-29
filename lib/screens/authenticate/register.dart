import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ninja_brew_crew/services/auth.dart';
import 'package:ninja_brew_crew/shared/constants.dart';

class Register extends StatefulWidget {
  //const Register({ Key? key }) : super(key: key);

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formkey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text('Sign up Brew Crew'),
        elevation: 0.0,
        actions: <Widget>[
          TextButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(Icons.person, color: Colors.white),
              label: Text(
                'Sign-in',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: decoration.copyWith(hintText: 'Your Email'),
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: decoration.copyWith(hintText: 'New Password'),
                validator: (val) => val.length < 6
                    ? 'Enter a password with more than 6 characters'
                    : null,
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 40.0),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink,

                    /*onPrimary: Colors.white,
                    onSurface: Colors.grey,*/
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                  onPressed: () async {
                    if (_formkey.currentState.validate()) {
                      dynamic result = await _auth.registerwithEmailandPassword(
                          email, password);
                      if (result == null) {
                        setState(() => error = 'Please enter a valid email :(');
                      }
                    }
                  }),
              SizedBox(height: 12.0),
              Text(error, style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
      ),
    );
  }
}
