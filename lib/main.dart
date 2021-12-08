import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payments/home.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Razor Pay Payment Demo',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}



