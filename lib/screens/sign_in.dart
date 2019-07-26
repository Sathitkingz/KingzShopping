import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kingz_shopping/screens/my_service.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // Explicit
  double myPadding = 20.0;
  String emailString, passwordString;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  String myEmail, myPass;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Widget showAppName() {
    return Container(
      margin: EdgeInsets.only(bottom: 8.0),
      child: Text(
        'KINGz Shopping',
        style: TextStyle(
          fontSize: 30.0,
          color: Colors.blue[500],
          fontWeight: FontWeight.bold,
          fontFamily: 'Pacifico',
        ),
      ),
    );
  }

  Widget emailText() {
    return Container(
      padding: EdgeInsets.only(left: myPadding, right: myPadding),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: 'Email :',
          hintText: 'you@mail.com', // อยู่ในช่องที่กรอก
          icon: Icon(
            Icons.email,
            size: 40.0,
          ),
          helperText: 'you@mail.com', // อยู่ใต้ช่องที่กรอก
          helperStyle: TextStyle(color: Colors.red),
        ),
        onSaved: (String value) {
          myEmail = value;
        },
      ),
    );
  }

  Widget passwordText() {
    return Container(
      padding: EdgeInsets.only(left: myPadding, right: myPadding),
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password :',
          helperText: 'More 6 charactor',
          icon: Icon(
            Icons.lock,
            size: 40.0,
          ),
        ),
        onSaved: (String value) {
          myPass = value;
        },
      ),
    );
  }

  Widget signInButton() {
    return Container(
      child: FlatButton(
        color: Colors.orange[400],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Text(
          'Sign In',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          print('You Click SignIn');
          formKey.currentState.save();
          checkAuthen();

          var signInRoute =
              MaterialPageRoute(builder: (BuildContext context) => SignIn());
          Navigator.of(context).push(signInRoute);
        },
      ),
    );
  }

  Future<void> checkAuthen() async {
    await firebaseAuth
        .signInWithEmailAndPassword(
            email: myEmail, password: myPass)
        .then((response) {
      var homeRoute =
          MaterialPageRoute(builder: (BuildContext context) => myService());
      Navigator.of(context)
          .pushAndRemoveUntil(homeRoute, (Route<dynamic> route) => false);
    }).catchError((respone) {
      String errorString = respone.message;
      mySnackBar(errorString);
    });
  }

  void mySnackBar(String messageString) {
    SnackBar snackBar = SnackBar(
      content: Text(messageString),
    );
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Sign In'),
        backgroundColor: Colors.orange[400],
      ),
      body: Form(
        key: formKey,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              showAppName(),
              emailText(),
              passwordText(),
              signInButton(),
            ],
          ),
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
