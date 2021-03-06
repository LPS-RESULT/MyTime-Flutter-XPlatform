import 'package:flutter/material.dart';
import 'containers/Login/index.dart';
import 'containers/Home/index.dart';
import 'containers/EditTimeLog/index.dart';
import 'package:mytime_mobile/containers/Login/processLogin.dart';
import 'package:mytime_mobile/containers/Map/map.dart';
import 'package:mytime_mobile/utils/mood_meter/main.dart';

class MTApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyTime Mobile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Quicksand'
      ),
      home: LoginPage(),
      routes:  <String, WidgetBuilder>{
        '/login': (BuildContext context) => LoginPage(),
        '/processLogin': (BuildContext context) => ProcessLoginPage(),
        '/home': (BuildContext context) => HomePage(),
        '/editTimeLog': (BuildContext context) => EditTimeLogPage(),
        '/moodMeter': (BuildContext context) => MyReviewPage(),
        '/map': (BuildContext context) => MapPage(),
      },
    );
  }
}

void main() => runApp(MTApp());