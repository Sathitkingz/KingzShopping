import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kingz_shopping/screens/my_service.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
// Explicit
  double myPadding = 20.0;
  String nameString, mailString, passwordString;

  final formKey = GlobalKey<FormState>();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

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
        validator: (String values) {
          if (values.isEmpty) {
            return 'Please fill name in blank';
          }
        },
        onSaved: (String values) {
          nameString = values;
        },
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
          ),
        ),
        validator: (String values) {
          if (!((values.contains('@')) && (values.contains('.')))) {
            return 'Data is invalid.';
          }
        },
        onSaved: (String values) {
          mailString = values;
        },
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
        validator: (String values) {
          if (values.length < 6) {
            return 'More 6 charector';
          }
        },
        onSaved: (String values) {
          passwordString = values;
        },
      ),
    );
  }

  Widget upLoadBtn() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        print('Click Cloud...');

        if (formKey.currentState.validate()) {
          formKey.currentState.save();

          print('Name = $nameString,Mail = $mailString,Pass=$passwordString');
          registerUser();
        }
      },
    );
  }

  Future<void> registerUser() async {
    await firebaseAuth
        .createUserWithEmailAndPassword(
            email: mailString, password: passwordString)
        .then((response) {
      print('Register Success');
      setupDisplayName();
    }).catchError((respone) {
      print('Error : ${respone.toString()}');
      String titleString = respone.code;
      String messageString = respone.message;
      myAlert(titleString, messageString);
    });
  }

  Future<void> setupDisplayName() async {
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    UserUpdateInfo userUpdateInfo = UserUpdateInfo();
    userUpdateInfo.displayName = nameString;
    firebaseUser.updateProfile(userUpdateInfo);

    var myServiceRoute =
        MaterialPageRoute(builder: (BuildContext context) => myService());
    Navigator.of(context)
        .pushAndRemoveUntil(myServiceRoute, (Route<dynamic> route) => false);
// FirebaseUser firebaseUser2 = await firebaseAuth.currentUser();
// String testName = firebaseUser2.displayName;
// print('testName = $testName');
  }

  void myAlert(String titleString, String messageString) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: ListTile(
              leading: Icon(
                Icons.error,
                size: 48.0,
                color: Colors.red,
              ),
              title: Text(titleString),
            ),
            content: Text(messageString),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

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
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            showHeader(),
            nameText(),
            emailext(),
            passwordText(),
          ],
        ),
      ),
    );
  }
}
