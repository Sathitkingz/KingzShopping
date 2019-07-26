import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kingz_shopping/screens/home.dart';
import 'package:kingz_shopping/screens/sign_in.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(debugShowCheckedModeBanner: false,
      //home: SignIn(),
       home: Home(),
    );
  }
}
