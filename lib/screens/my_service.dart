import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kingz_shopping/screens/home.dart';

class myService extends StatefulWidget {
  @override
  _myServiceState createState() => _myServiceState();
}

class _myServiceState extends State<myService> {
// Explicit
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String displayNameString = '';

// Method
  @override
  void initState() {
    super.initState();
    findDisplayName();
  }

  Future<void> findDisplayName() async {
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    setState(() {
      displayNameString = firebaseUser.displayName;
    });
    print('Name = $displayNameString');
  }

  Widget showTitle() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[showTopTile(), showBottomTitle()],
    );
  }

  Widget showTopTile() {
    return Container(
      alignment: Alignment.center,
      child: Text('Login by'),
    );
  }

  Widget showBottomTitle() {
    return Container(
      alignment: Alignment.center,
      child: Text(
        '$displayNameString',
        style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic),
      ),
    );
  }

  Widget myDrawerMenu() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          headDrawer(),
          mySignOut(),
        ],
      ),
    );
  }

  Widget headDrawer() {
    return DrawerHeader(
      decoration: BoxDecoration(
          gradient: RadialGradient(
        colors: [Colors.white, Colors.orange[100]],
        center: Alignment.topLeft,
        radius: 2.0,
      )),
      child: Column(
        children: <Widget>[
          showLogo(),
          showTopTile(),
          showBottomTitle(),
        ],
      ),
    );
  }

  Widget mySignOut() {
    return ListTile(
      leading: Icon(Icons.exit_to_app),
      title: Text('Signout'),
      onTap: () {
        processSignOut();
      },
    );
  }

  Widget showLogo() {
    return Container(
      alignment: Alignment.center,
      height: 80.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Future<void> processSignOut() async {
    await firebaseAuth.signOut().then((response) {
      var homeRoute =
          MaterialPageRoute(builder: (BuildContext context) => Home());
      Navigator.of(context)
          .pushAndRemoveUntil(homeRoute, (Route<dynamic> route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        title: showTitle(),
      ),
      body: Text('body'),
      drawer: myDrawerMenu(),
    );
  }
}
