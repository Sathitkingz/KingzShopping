import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

// Explicit
double myPadding = 20.0;

// Method

Widget showHeader() {
  return Container(
    alignment: Alignment.centerLeft,
    padding: EdgeInsets.only(left: myPadding),
    child: Text(
      'Register >>',
      style: TextStyle(
        fontSize: 48.0,
        fontWeight: FontWeight.bold,
        color: Colors.green[700],
      ),
    ),
  );
}

Widget nameText() {
  return Container(
    padding: EdgeInsets.only(
      left: myPadding,
      right: myPadding,
    ),
    child: TextFormField(
      decoration: InputDecoration(
          labelText: 'Name : ',
          icon: Icon(
            Icons.face,
            size: 36.0,
          )),
    ),
  );
}

Widget emailext() {
  return Container(
    padding: EdgeInsets.only(
      left: myPadding,
      right: myPadding,
    ),
    child: TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: 'Mail : ',
          icon: Icon(
            Icons.mail,
            size: 36.0,
          )),
    ),
  );
}

Widget passwordText() {
  return Container(
    padding: EdgeInsets.only(
      left: myPadding,
      right: myPadding,
    ),
    child: TextFormField(
      //keyboardType: TextInputType.text,
      decoration: InputDecoration(
          labelText: 'Password : ',
          icon: Icon(
            Icons.lock,
            size: 36.0,
          )),
    ),
  );
}

Widget upLoadBtn() {
  return IconButton(
    icon: Icon(Icons.cloud_upload),
    onPressed: () {},
  );
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        backgroundColor: Colors.orange[600],
        actions: <Widget>[
          upLoadBtn(),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          showHeader(),
          nameText(),
          emailext(),
          passwordText(),
        ],
      ),
    );
  }
}
