import 'package:flutter/material.dart';
import 'styles.dart';
import 'loginAnimation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/animation.dart';
import 'dart:async';
import '../../components/SignUpLink.dart';
import '../../components/Form.dart';
import '../../components/SignInButton.dart';
import '../../components/WhiteTick.dart';
import '../../utils/colors.dart';
import 'package:mytime_mobile/components/InputFields.dart';
import 'package:mytime_mobile/containers/Login/processLogin.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);
  @override
  LoginPageState createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with TickerProviderStateMixin {
  AnimationController _loginButtonController;
  var animationStatus = 0;

  TextEditingController _usernameController = TextEditingController(text: 'timothy.santiago@lps.co.nz');
  TextEditingController _passwordController = TextEditingController(text: 'Frostie28');
  TextEditingController _securityCodeController = TextEditingController(text: '3O06DiTatWXXQ9HPOjldYdQGC');

  @override
  void initState() {
    super.initState();
    _loginButtonController = AnimationController(
        duration: Duration(milliseconds: 1500), vsync: this);
  }

  @override
  void dispose() {
    _loginButtonController.dispose();
    super.dispose();
  }

  Future<Null> _playAnimation() async {
    try {
      await _loginButtonController.forward();
      Navigator.push(context, MaterialPageRoute(builder: (context) =>
        ProcessLoginPage(
          username: _usernameController.text,
          password: _passwordController.text,
          securityCode: _securityCodeController.text,
        )));
      await _loginButtonController.reverse();
    } on TickerCanceled {}
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
    return (new WillPopScope(
        onWillPop: _onWillPop,
        child: new Scaffold(
          body: new Container(
              child: new Container(
                  decoration: new BoxDecoration(
                      gradient: new LinearGradient(
                    colors: <Color>[
                      HexColor('#243B55'),
                      HexColor('#141E30'),
                    ],
                    stops: [0.2, 1.0],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(0.0, 1.0),
                  )),
                  child: new ListView(
                    padding: const EdgeInsets.all(0.0),
                    children: <Widget>[
                      new Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: <Widget>[
                          new Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(100, 60, 100, 40),
                                child: Tick(image: logo),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text('GET STARTED',
                                      style: new TextStyle(
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.75,
                                        color: Colors.white30,
                                        fontSize: 12.0),
                                    ),
                                    Text('log in',
                                      style: new TextStyle(
                                          fontFamily: 'Raleway',
                                          fontWeight: FontWeight.w800,
                                          letterSpacing: 1,
                                          color: Colors.white,
                                          fontSize: 30.0),
                                    ),
                                  ],
                                ),
                              ),
                              new Container(
                                margin: new EdgeInsets.fromLTRB(20, 20, 20, 0),
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    new Form(
                                        child: new Column(
                                          mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            new InputFieldArea(
                                              hint: "Username or E-mail address",
                                              obscure: false,
                                              icon: Icons.person_outline,
                                              controller: _usernameController,
                                            ),
                                            new InputFieldArea(
                                              hint: "Password",
                                              obscure: true,
                                              icon: Icons.lock_outline,
                                              controller: _passwordController
                                            ),
                                            new InputFieldArea(
                                              hint: "Security Code",
                                              obscure: true,
                                              icon: Icons.fingerprint,
                                              controller: _securityCodeController,
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                              new SignUp()
                            ],
                          ),
                          animationStatus == 0
                              ? new Padding(
                                  padding: const EdgeInsets.only(bottom: 50.0),
                                  child: new InkWell(
                                      onTap: () {
                                        setState(() {
                                          animationStatus = 1;
                                        });
                                        _playAnimation();
                                      },
                                      child: new SignIn()),
                                )
                              : new StaggerAnimation(
                                  buttonController:
                                      _loginButtonController.view),
                        ],
                      ),
                    ],
                  ))),
        )));
  }
}
