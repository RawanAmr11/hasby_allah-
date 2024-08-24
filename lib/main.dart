import 'package:flutter/material.dart';
import 'package:test3/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //remove debug
      home: Register(),
    );
  }
}
