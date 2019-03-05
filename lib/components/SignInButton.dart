import 'package:flutter/material.dart';
import 'package:mytime_mobile/utils/colors.dart';

class SignIn extends StatelessWidget {
  SignIn();
  @override
  Widget build(BuildContext context) {
    return (InkWell(
      child: Container(
        width: 320.0,
        height: 50.0,
        alignment: FractionalOffset.center,
        decoration: new BoxDecoration(
          color: Colors.blue,
          borderRadius: new BorderRadius.all(const Radius.circular(4.0)),
          gradient: new LinearGradient(
            colors: <Color>[
              HexColor('#00c6ff'),
              HexColor('#0072ff'),
            ],
            stops: [0, 1.0],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.0, 1.0),
          ),
        ),
        child: new Text(
          "SIGN IN",
          style: new TextStyle(
            color: Colors.white,
            fontSize: 17.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.3,
          ),
        ),
      ),
    ));
  }
}
