import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kingz_shopping/screens/home.dart';

main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //SystemChrome.setPreferredOrientations(orientations)
    return MaterialApp(
      home: Home(),
    );
  }
}
