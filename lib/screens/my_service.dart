import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kingz_shopping/screens/home.dart';
import 'package:kingz_shopping/screens/page1.dart';
import 'package:kingz_shopping/screens/page2.dart';
import 'package:kingz_shopping/screens/page3.dart';

class myService extends StatefulWidget {
  @override
  _myServiceState createState() => _myServiceState();
}

class _myServiceState extends State<myService> {
// Explicit
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String displayNameString = '';
  Widget myWidget = Page1();

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
      child: Text(''),
    );
  }

  Widget showBottomTitle() {
    return Container(
      alignment: Alignment.center,
      child: Text(
        'Login by  $displayNameString',
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
          showPage1(),
          showPage2(),
          showPage3(),
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

  Widget showPage1() {
    return ListTile(
      leading: Icon(Icons.home),
      title: Text('Page 1'),
      onTap: () {
        setState(() {
          myWidget = Page1();
          Navigator.of(context).pop();
        });
      },
    );
  }

  Widget showPage2() {
    return ListTile(
      leading: Icon(Icons.android),
      title: Text('Page 2'),
      onTap: () {
        setState(() {
          myWidget = Page2();
          Navigator.of(context).pop();
        });
      },
    );
  }

  Widget showPage3() {
    return ListTile(
      leading: Icon(Icons.account_box),
      title: Text('Page 3'),
      onTap: () {
        setState(() {
          myWidget = Page3();
          Navigator.of(context).pop();
        });
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
      body: myWidget,
      drawer: myDrawerMenu(),
    );
  }
}
