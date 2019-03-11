import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mytime_mobile/models/auth.dart';
import 'package:mytime_mobile/models/user.dart';
import 'package:mytime_mobile/services/api.dart';
import 'package:mytime_mobile/services/prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProcessLoginPage extends StatefulWidget {
  final String username;
  final String password;
  final String securityCode;
  ProcessLoginPage({Key key, @required this.username,
    @required this.password, @required this.securityCode}) : super(key: key);

  @override
  ProcessLoginPageState createState() => new ProcessLoginPageState();
}

class ProcessLoginPageState extends State<ProcessLoginPage>{

  int _loginStep = 0;
  UserProfile _userProfile;

  @override
  void initState() {
    super.initState();

    login();
  }

  @override
  void dispose() {
    super.dispose();
  }

  login() async {
    SfAuthResponse response = await loginWithSFToken(username: widget.username, password: widget.password,
        securityCode: widget.securityCode);
    if (response != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(PREFS_ACCESS_TOKEN, response.accessToken);
      prefs.setString(PREFS_INSTANCE_URL, response.instanceUrl);
      prefs.setString(PREFS_AUTH_ID, response.id);
      prefs.setString(PREFS_AUTH_SIGNATURE, response.signature);
      prefs.setString(PREFS_USERNAME, widget.username);
      setState(() {
        _loginStep = 1;
      });
      _userProfile = await getUserDetails();
      setState(() {
        _loginStep = 2;
      });
      await Future.delayed(const Duration(seconds: 1));
      Navigator.pushNamed(context, '/home');
    } else {
      Navigator.pop(context);
    }
  }

  Widget statusText() {
    String status = '';
    switch (_loginStep) {
      case 0:
        status = 'Signing in as \n${widget.username}';
        break;
      case 1:
        status = 'Getting user details for \n${widget.username}';
        break;
      case 2:
        status = 'Welcome ${_userProfile.firstName} ${_userProfile.lastName}!';
        break;
      default:
        break;
    }
    return Text(status,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 17,
      ),
    );
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
                  child: _loginStep < 2 ? CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),

                  )
                      :
                  Icon(Icons.check_circle, color: Colors.white, size: 50,),
                ),
                Padding(padding: EdgeInsets.fromLTRB(0, 14, 0, 0)),
                statusText(),
              ]
            )
          ),
        )
      )
    );
  }
}
