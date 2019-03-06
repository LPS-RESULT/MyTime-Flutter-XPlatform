import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

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
    Firestore.instance.collection('Location')
      .getDocuments()
      .then((snapshot) {
        print(snapshot);
//        _markers.add(Marker(markerId: ))
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
    return new Scaffold(
      appBar: AppBar(title: Text('LPS Connections')),
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
