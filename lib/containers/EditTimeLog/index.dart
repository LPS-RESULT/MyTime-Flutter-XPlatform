import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:mytime_mobile/components/InputFields.dart';

class EditTimeLogPage extends StatefulWidget {
  const EditTimeLogPage({Key key}) : super(key: key);
  @override
  EditTimeLogPageState createState() => new EditTimeLogPageState();
}

class EditTimeLogPageState extends State<EditTimeLogPage>{

  String _billable = 'Non-billable';
  List<DropdownMenuItem> _billableItems = [
    DropdownMenuItem(child: Text('Non-billable')),
    DropdownMenuItem(child: Text('Billable'))];

  @override
  void initState() {
    super.initState();
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
          padding: EdgeInsets.fromLTRB(20, 60, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("new time log",
                style: new TextStyle(
                    fontSize: 14.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w300,
                    color: Colors.black38),
              ),
              Text("Details:",
                style: new TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Form(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        DropdownButton(
                          items: _billableItems,
                          onChanged: (item){
                            setState((){
                              _billable = item;
                            });
                          },
                        ),
                        new DarkInputFieldArea(
                          hint: "Project Name",
                          obscure: false,
                          icon: Icons.assessment,
                        ),
                        new DarkInputFieldArea(
                          hint: "Description",
                          icon: Icons.question_answer,
                        ),
                        new DarkInputFieldArea(
                          hint: "Hours",
                          icon: Icons.alarm,
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
