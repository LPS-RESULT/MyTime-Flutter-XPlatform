import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mytime_mobile/models/auth.dart';
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
      await getUserDetails();
      Navigator.pushNamed(context, '/home');
    } else {
      Navigator.pop(context);
    }
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
