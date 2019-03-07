import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mytime_mobile/utils/colors.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key key}) : super(key: key);
  @override
  MapPageState createState() => new MapPageState();
}

class MapPageState extends State<MapPage> {

  Completer<GoogleMapController> _controllerCompleter = Completer();
  GoogleMapController _controller;
  Set<Marker> _markers = Set<Marker>();

  static final CameraPosition _kLPSWellington = CameraPosition(
    target: LatLng(-41.286461, 174.776230),
    zoom: 15.9746,
  );

  @override
  void initState() {
    super.initState();
    refreshMarkers();
  }

  refreshMarkers() {
    Firestore.instance.collection('Location')
      .getDocuments()
      .then((snapshot) {
        _markers.clear();
        Set<Marker> markers = Set();
        snapshot.documents.forEach((record) {
          GeoPoint location = record.data['location'];
          markers.add(Marker(
            icon: BitmapDescriptor.fromAsset('assets/images/people_pin.png'),
            markerId: MarkerId(record.documentID),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (ctx) {
                  return Card(
                    margin: EdgeInsets.all(0),
                    elevation: 2,
                    child: Container(
                    height: 280,
                    foregroundDecoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(6.0)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: new BoxDecoration(
                            gradient: new LinearGradient(
                              colors: <Color>[
                                HexColor('#0072ff'),
                                HexColor('#00c6ff'),
                              ],
                              stops: [0.0, 1.0],
                              begin: const FractionalOffset(0.5, 0.5),
                              end: const FractionalOffset(0.9, 1.0),
                            )
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text('connection',
                                style: TextStyle(
                                  color: Colors.white24,
                                  letterSpacing: 1.3,
                                  fontSize: 14,
                                ),
                              ),
                              Text(record.data['name'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              Text(record.data['position'],
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(Icons.email, color: Colors.black54,),
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(8, 0, 0, 0)
                                  ),
                                  InkWell(
                                    child: Text(record.data['email'],
                                      style: TextStyle(
                                        color: Colors.lightBlue,
                                        fontSize: 20,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                    onTap: () => launch(
                                        'mailto:${record.data['email']}'),
                                  ),
                                ],
                              ),
                              Padding(padding: EdgeInsets.fromLTRB(0, 6, 0, 0)),
                              Row(
                                children: <Widget>[
                                Icon(
                                  Icons.phone_android,
                                  color: Colors.black54
                                ),
                                Padding(
                                    padding: EdgeInsets.fromLTRB(8, 0, 0, 0)
                                ),
                                InkWell(
                                child: Text(record.data['phone'],
                                  style: TextStyle(
                                    color: Colors.lightBlue,
                                    fontSize: 20,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                onTap: () => launch(
                                    'tel:${record.data['phone']}'),
                                )
                                ]
                              ),
                              Padding(padding: EdgeInsets.fromLTRB(0, 6, 0, 0)),
                              Row(
                                  children: <Widget>[
                                    RaisedButton(
                                      onPressed: () => launch(
                                          'http://maps.apple.com/?q=${location.latitude.toString()},${location.longitude.toString()}'),
                                      color: Colors.green,
                                      child: Row(
                                        children: <Widget>[
                                        Icon(
                                            Icons.navigation,
                                            color: Colors.white
                                        ),
                                        Padding(
                                            padding: EdgeInsets.fromLTRB(8, 0, 0, 0)
                                        ),
                                        Text('Navigate',
                                          style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500
                                          ),
                                        ),
                                      ],
                                    )
                                  )
                                ]
                              ),
                            ],
                          )
                        ),
                      ],
                    )
                  ));
                }
              );
            },
            position: LatLng(location.latitude, location.longitude))
          );
        });
        setState(() {
          _markers = markers;
        });
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.blue,
    ));
    return new Scaffold(
//      appBar: AppBar(
//        iconTheme: IconThemeData(
//          color: Colors.black87
//        ),
//        title: Text('LPS Connections',
//          style: TextStyle(
//            color: Colors.black
//          ),
//        ),
//        bottomOpacity: 0,
//        backgroundColor: Colors.transparent,
//        elevation: 0,
//        toolbarOpacity: 0,
//
//      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kLPSWellington,
            myLocationEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              _controllerCompleter.complete(controller);
              _controller = controller;
            },
            markers: _markers,
          ),
          Container(
            height: 120,
            decoration: BoxDecoration(gradient: LinearGradient(
              colors: <Color>[
                HexColor('#000000'),
                HexColor('#00000000'),
              ],
              stops: [0.1, 1.0],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.0, 1.0),
              )
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 45, 20, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: InkWell(child:
                    Icon(Icons.arrow_back_ios, color: Colors.white),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  )
                ),
                Text('LPS Connections',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    shadows: [
                      Shadow(blurRadius: 2,color: Colors.black12)
                    ]
                  ),
                ),
              ],
            )
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 47),
            alignment: AlignmentDirectional.bottomCenter,
            child: RaisedButton(
              onPressed: () {},
              shape: new RoundedRectangleBorder(borderRadius:
                new BorderRadius.circular(30.0)
              ),
              color: Colors.white,
              child: Text('Tap on a marker to view connection',
                style: TextStyle(
                  color: Colors.black87
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}
