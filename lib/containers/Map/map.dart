import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

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
    zoom: 14.4746,
  );

  @override
  void initState() {
    super.initState();
    checkLocationPermission();
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
                  return Container(
                    height: 200,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
                    foregroundDecoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(6.0)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text('connection',
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 14,
                          ),
                        ),
                        Text(record.data['name'],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        Text(record.data['position'],
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 15, 0, 0)
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
                        ),
                      ],
                    )
                  );
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

  checkLocationPermission() async {
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.location);
    if (permission != PermissionStatus.granted) {
      await PermissionHandler().requestPermissions([
        PermissionGroup.location,
        PermissionGroup.locationAlways,
        PermissionGroup.locationWhenInUse
      ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.blue,
    ));
    return new Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black87
        ),
        title: Text('LPS Connections',
          style: TextStyle(
            color: Colors.black
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kLPSWellington,
        myLocationEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _controllerCompleter.complete(controller);
          _controller = controller;
        },
        markers: _markers,
      ),
    );
  }
}
