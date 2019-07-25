import 'package:flutter/material.dart';

class myService extends StatefulWidget {
  @override
  _myServiceState createState() => _myServiceState();
}

class _myServiceState extends State<myService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Service'),
      ),body: Text('body'),
    );
  }
}
