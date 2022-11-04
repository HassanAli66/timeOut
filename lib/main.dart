
import 'package:flutter/material.dart';
import 'package:timeOut/select.dart';
import 'package:timeOut/homePage.dart';
import 'package:timeOut/timer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.grey[600]),
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => MyHomePage(),
          "/select": (context) => SelectMode(),
          "/timer": (context) => TimerPage(),
        });
  }
}
