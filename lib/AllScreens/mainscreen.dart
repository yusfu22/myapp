import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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

 GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
 Position currentPosition;
 var geoLocator = Geolocator();

 void locatePosition() async {

   Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
   currentPosition = position;
   LatLng latLatPosition = LatLng(position.latitude,position.longitude);


 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Screen"),
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller){

              _controllerGoogleMap.complete(controller);
              newGoogleMapController = controller;

            },


          ),
        ],
      ),
    );
  }
}
