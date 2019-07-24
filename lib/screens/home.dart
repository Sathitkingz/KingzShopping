import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
// explicit

// Method

  Widget showAppName() {
    return Text('Kingz Shopping');
  }

  Widget signInBtn() {
    return RaisedButton(
      child: Text('Sign In'),
      onPressed: () {},
    );
  }

  Widget signUpBtn() {
    return RaisedButton(
      child: Text('Sign Up'),
      onPressed: (){},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            showAppName(),
            signInBtn(),
            signUpBtn(),
          ],
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
