import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class ProcessLoginPage extends StatefulWidget {
  const ProcessLoginPage({Key key}) : super(key: key);
  @override
  ProcessLoginPageState createState() => new ProcessLoginPageState();
}

class ProcessLoginPageState extends State<ProcessLoginPage>{

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return (Scaffold(
      backgroundColor: Colors.black,
      body: Container(
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(8))
          ),
          padding: EdgeInsets.fromLTRB(20, 60, 20, 0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
              ]
            )
          ),
        )
      )
    );
  }
}
