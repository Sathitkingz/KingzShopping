import 'package:flutter/material.dart';
import 'package:kingz_shopping/screens/sign_in.dart';
import 'package:kingz_shopping/screens/sign_up.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
// explicit
  double myWidth = 200.0;
// Method

  Widget showAppName() {
    return Container(
      margin: EdgeInsets.only(bottom: 8.0),
      child: Text(
        'Kingz Shopping',
        style: TextStyle(
          fontSize: 32.0,
          color: Colors.red[900],
          fontWeight: FontWeight.bold,
          fontFamily: 'Pacifico',
        ),
      ),
    );
  }

  Widget signInBtn() {
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
          print('You Click');

          var signInRoute =
              MaterialPageRoute(builder: (BuildContext context) => SignIn());
          Navigator.of(context).push(signInRoute);
        },
      ),
    );
  }

  Widget signUpBtn() {
    return Container(
      child: OutlineButton(
        borderSide: BorderSide(
          color: Colors.orange[400],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Text('Sign Up'),
        onPressed: () {
          var signUpRoute =
              MaterialPageRoute(builder: (BuildContext context) => SignUp());
          Navigator.of(context).push(signUpRoute);
        },
      ),
    );
  }

  Widget showBtn() {
    return Container(
      width: 250.0,
      child: Row(
        children: <Widget>[
          Expanded(
            child: signInBtn(),
          ),
          Expanded(
            child: signUpBtn(),
          ),
          //signUpBtn(),
        ],
      ),
    );
  }

  Widget showLogo() {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      width: 200.0,
      height: 300.0,
      child: Image.asset('images/logo.png'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.white, Colors.blue],
            radius: 1.0,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            showLogo(),
            showAppName(),
            //signInBtn(),
            //signUpBtn(),
            showBtn(),
          ],
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
