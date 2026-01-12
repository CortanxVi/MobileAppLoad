import 'package:flutter/material.dart';
import 'package:flutterapp/testscreens/profile.dart';
// import 'package:flutterapp/screens/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Profile Jaa', home: Profile());
  }
}
