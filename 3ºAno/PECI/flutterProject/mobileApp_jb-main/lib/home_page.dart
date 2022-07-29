// ignore_for_file: prefer_const_constructors

import 'dart:async';
//import 'dart:html';

import 'package:flutter/material.dart';
//import 'package:geolocator/geolocator.dart';
// import 'package:flutter_maps/flutter_maps.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

// class _HomePageState extends State<HomePage> {

//   Completer<GoogleMapController> _controllerGoogleMap = Completer();
//   late GoogleMapController newGoogleMapController;
  
//   double? latitude;
//   double? longitude;

//   late Position currentPosition;
//   var geoLocator = Geolocator();

//   static final CameraPosition _kGooglePlex = CameraPosition
//   (
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.4746,
//   );

//   @override
//   Widget build(BuildContext context) 
//   {
//     return Scaffold(
//       body: Stack(
//         children: [
//           GoogleMap(
//             mapType: MapType.normal,
//             myLocationButtonEnabled: true,
//             initialCameraPosition: _kGooglePlex,
//             onMapCreated: (GoogleMapController controller)
//             {
//               _controllerGoogleMap.complete(controller);
//               newGoogleMapController = controller;

//               getPosition();
//             },
//           )
//         ],
        
//       ),
//     );
//   }


//   void getPosition() async {
//     Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//     currentPosition = position;

//     LatLng latLatPosition = LatLng(position.latitude, position.longitude);

//     CameraPosition cameraPosition = new CameraPosition(target: latLatPosition, zoom: 14);
//     newGoogleMapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition)); 
//   }

// }

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('O Nosso Jardim',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        actions: [
          Center(
            child: Text('X'),
          ),
          Center(
            child: Text('X'),
          ),
        ],
      ),
      drawer: Drawer(),

      body: Center(child: Text('Text')),
    );
  }


}