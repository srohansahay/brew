import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ninja_brew_crew/services/auth.dart';
import 'package:ninja_brew_crew/screens/authenticate/authenticate.dart';
import 'package:ninja_brew_crew/shared/constants.dart';
import 'package:ninja_brew_crew/shared/loading.dart';

class Sign_in extends StatefulWidget {
  //const Sign_in({Key key}) : super(key: key);

  final Function toggleView;
  Sign_in({this.toggleView});

  @override
  _Sign_inState createState() => _Sign_inState();
}

class _Sign_inState extends State<Sign_in> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  String error = '';
  bool loading = false;

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              title: Text('Sign in Brew Crew'),
              elevation: 0.0,
              actions: <Widget>[
                TextButton.icon(
                    onPressed: () => widget.toggleView(),
                    icon: Icon(Icons.person, color: Colors.white),
                    label: Text(
                      'Register',
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
                      decoration:
                          decoration.copyWith(hintText: 'Registered email'),
                      validator: (val) => val.isEmpty ? 'Enter an email' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration: decoration.copyWith(hintText: 'Password'),
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
                        /* onPrimary: Colors.white,
                    onSurface: Colors.grey,*/
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'Sign In',
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                      ),
                      onPressed: () async {
                        if (_formkey.currentState.validate()) {
                          setState(() => loading = true);
                          dynamic result = await _auth
                              .signInwithEmailandPassword(email, password);

                          if (result == null) {
                            setState(() {
                              loading = false;
                              error =
                                  'Check your email and password once again';
                            });
                          }
                        }
                      },
                    ),
                    SizedBox(height: 12.0),
                    Text(error, style: TextStyle(color: Colors.red)),
                  ],
                ),
              ),
            ),
          );
  }
}
