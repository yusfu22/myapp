import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_google_maps/flutter_google_maps.dart';

class MainScreen extends StatefulWidget {

  static const String idScreen = "main";


  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController newGoogleMapController;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Screen"),
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.none,
            myLocationButtonEnabled: true,
            initialPosition: _kGooglePlex;
            onMapCreated: (GoogleMapController controller){
              _controllerGoogleMap.complete(controller);
              newGoogleMapController = controller;
    }
          ),
        ],
      ),
    );
  }
}
