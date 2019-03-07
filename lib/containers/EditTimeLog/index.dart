import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:mytime_mobile/components/InputFields.dart';
import 'package:intl/intl.dart';

class EditTimeLogPage extends StatefulWidget {
  const EditTimeLogPage({Key key}) : super(key: key);
  @override
  EditTimeLogPageState createState() => new EditTimeLogPageState();
}

class EditTimeLogPageState extends State<EditTimeLogPage>{

  DropdownMenuItem _project = DropdownMenuItem(
      child: Text('LPS New Zealand - LPS NZ Perm')
  );
  List<DropdownMenuItem> _projectItems = [
    DropdownMenuItem(child: Text('LPS New Zealand - LPS NZ Perm')),
  ];

  List<DropdownMenuItem> _codeItems = [
    DropdownMenuItem(child: Text('--None--')),
  ];

  String _currentDate = '';

  @override
  void initState() {
    super.initState();
    var now = new DateTime.now();
    var formatter = new DateFormat('EEEE, MMM d, yyyy');
    setState(() {
      _currentDate = formatter.format(now);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      child: new AlertDialog(
        title: new Text('Are you sure?'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          new FlatButton(
            onPressed: () {},
            child: new Text('Yes'),
          ),
        ],
      ),
    ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 0.4;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return (Scaffold(
      body: Container(
          padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    child: Icon(Icons.arrow_back_ios),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(6, 0, 0, 0),),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("timesheet log",
                        style: new TextStyle(
                            fontSize: 14.0,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w300,
                            color: Colors.black38),
                      ),
                      Text(_currentDate,
                        style: new TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ],
                  )
                ],
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Form(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("project",
                          style: new TextStyle(
                              fontSize: 14.0,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w300,
                              color: Colors.black38),
                        ),
                        DropdownButton(
                          items: _projectItems,
                          onChanged: (item){
                            setState((){
                              _project = item;
                            });
                          },
                        ),
                        Text("project code",
                          style: new TextStyle(
                              fontSize: 14.0,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w300,
                              color: Colors.black38),
                        ),
                        DropdownButton(
                          items: _codeItems,
                          onChanged: (item){
                          },
                        ),
                        new DarkInputFieldArea(
                          hint: "Description",
                          icon: Icons.question_answer,
                        ),
                        new DarkInputFieldArea(
                          hint: "Hours",
                          icon: Icons.alarm,
                          inputType: TextInputType.number,
                        ),
                        MaterialButton(
                          child: Text('Set Mood',
                            style: TextStyle(
                              color: Colors.blueAccent,
                            )
                          ),
                          onPressed: (){
                            Navigator.of(context).pushNamed('/moodMeter');
                          },
                        ),
                        RaisedButton(
                          color: Colors.blue,
                          child: Text('Submit',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: (){
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    )),
              )
            ],
          )
      ),
    )
    );
  }
}
