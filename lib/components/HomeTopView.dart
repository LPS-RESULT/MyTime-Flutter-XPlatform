import 'package:flutter/material.dart';
import 'MonthView.dart';
import 'Profile_Notification.dart';
import 'package:mytime_mobile/utils/colors.dart';

class ImageBackground extends StatelessWidget {
  final DecorationImage backgroundImage;
  final DecorationImage profileImage;
  final VoidCallback selectbackward;
  final VoidCallback selectforward;
  final String month;
  final Animation<double> containerGrowAnimation;
  ImageBackground(
      {this.backgroundImage,
      this.containerGrowAnimation,
      this.profileImage,
      this.month,
      this.selectbackward,
      this.selectforward});
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return (new Container(
        width: screenSize.width,
        height: screenSize.height / 2.5,
        decoration: new BoxDecoration(image: backgroundImage),
        child: new Container(
          decoration: new BoxDecoration(
              gradient: new LinearGradient(
            colors: <Color>[
              HexColor('#348F50'),
              HexColor('#56B4D3'),
            ],
            stops: [0.2, 1.0],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.0, 1.0),
          )),
          child: new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 40, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("good afternoon",
                                style: new TextStyle(
                                    fontSize: 14.0,
                                    letterSpacing: 1.2,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white54),
                              ),
                              Text("Timothy Santiago",
                                style: new TextStyle(
                                    fontSize: 25.0,
                                    letterSpacing: 1.2,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          FlatButton(
                            onPressed: (){
                              Navigator.of(context).pushNamed('/map');
                            },
                            child: Icon(
                              Icons.my_location,
                              color: Colors.white,
                            )
                          )
                        ],
                      )
                    ),
                    new ProfileNotification(
                      containerGrowAnimation: containerGrowAnimation,
                      profileImage: profileImage,
                    ),
                    new MonthView(
                      month: month,
                      selectbackward: selectbackward,
                      selectforward: selectforward,
                    )
                  ],
                ),
        )));
  }
}
