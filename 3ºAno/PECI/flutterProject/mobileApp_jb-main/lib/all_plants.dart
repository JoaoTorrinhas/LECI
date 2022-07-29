import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:teste/main_plant.dart';

import 'drawer_bar.dart';


class AllPlants extends StatefulWidget {
  //MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _AllPlants createState() => _AllPlants();
}

class _AllPlants extends State<AllPlants> {
  StreamSubscription _locationSubscription;
  final Location _locationTracker = Location();
  Marker marker;
  //final Set<Marker> markers = {};
  Circle circle;
  GoogleMapController _controller;
  Set<Marker> markers = new Set();

  

  static final CameraPosition initialLocation =  CameraPosition(
    target: LatLng(40.631375, -8.659969),
    zoom: 19,
  );

  Future<Uint8List> getMarker() async {
    ByteData byteData =
        await DefaultAssetBundle.of(context).load("assets/pessoa.png");
    return byteData.buffer.asUint8List();
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      getCurrentLocation();
    });
  }

  void updateMarkerAndCircle(LocationData newLocalData, Uint8List imageData) {
    LatLng latlng = LatLng(newLocalData.latitude, newLocalData.longitude);
    setState(() {
      marker = Marker(
          markerId: MarkerId("home"),
          position: latlng,
          rotation: newLocalData.heading,
          draggable: false,
          zIndex: 2,
          flat: true,
          anchor: const Offset(0.5, 0.5),
          icon: BitmapDescriptor.fromBytes(imageData));
      circle = Circle(
          circleId: CircleId("pessoa"),
          radius: 25,
          zIndex: 1,
          strokeColor: Colors.blue.withAlpha(100),
          center: latlng,
          fillColor: Colors.blue.withAlpha(50));
    });
    markers.add(marker);
  }

  void getCurrentLocation() async {
    try {
      //LocationAccuracy accuracy = LocationAccuracy.HIGH;
      Uint8List imageData = await getMarker();
      var location = await _locationTracker.getLocation();
      
      updateMarkerAndCircle(location, imageData);

      if (_locationSubscription != null) {
        _locationSubscription.cancel();
      }
      
      _locationSubscription =
          // ignore: void_checks
          _locationTracker.onLocationChanged().listen((newLocalData) async {
        if (_controller != null) {
          _controller.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                  bearing: 0,
                  target: LatLng(newLocalData.latitude, newLocalData.longitude),
                  tilt: 0,
                  zoom: 19.2
                  )));
          updateMarkerAndCircle(newLocalData, imageData);

          var x1 = newLocalData.longitude.toStringAsFixed(10);
          var x2 = newLocalData.latitude.toStringAsFixed(10);
          markers = {};
          String primeira = "http://164.92.154.30/?X=";
          String segunda = "&Y=";
          String terceira = "&radius=10000000000";
          String linkapi = primeira + x1 + segunda + x2 + terceira;
          //print(linkapi);

          final response = await http.get(Uri.parse(linkapi));

          //print(response.body);

          List data = jsonDecode(response.body);
          //print(data);

          data.forEach((element) {
            Map obj = element;
            String xcor = obj['X'];
            String ycor = obj['Y'];
            String especie = obj['Especie'];
            String nome = obj['Nome'];
            //print(xcor);
            //print(ycor);
            //print(especie);

            var xcor2 = double.tryParse(xcor);
            var ycor2 = double.tryParse(ycor);

            if (data != []) {
              setState(() {
                markers.add(Marker(
                  //add first marker
                  markerId: MarkerId(ycor),
                  position: LatLng(ycor2, xcor2), //position of marker
                  infoWindow: InfoWindow(
                    //popup info
                    title: nome,
                  ),
                  icon: BitmapDescriptor.defaultMarker, //Icon for Marker
                ));
              });
            }
          });
          //markers = {};
          //print(markers);
          //print(data.length);
        }
        //markers = {};
      });
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint("Permission Denied");
      }
    }
  }

  @override
  void dispose() {
    if (_locationSubscription != null) {
      _locationSubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
        child: DrawerBar(),
      ),
      appBar: AppBar(
        title: const Text('Mapa'),
        titleTextStyle: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 38.0,
            fontWeight: FontWeight.w500),
        backgroundColor: Color(0xFF00796B),
      ),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: initialLocation,
        zoomControlsEnabled: false,
        compassEnabled: true,
        markers: markers,

        circles: Set.of((circle != null) ? [circle] : []),

        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
          child: Icon(Icons.location_searching),
          onPressed: () {
            getCurrentLocation();
          },
          heroTag: Null,
          backgroundColor: Color(0xFF00796B)
        ),
        SizedBox(
          height: 50,
        ),
        FloatingActionButton(
          child: Icon(Icons.eco_rounded),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => MyApp()));
          },
          backgroundColor: Color(0xFF00796B),
        )
      ]),
    );
  }
}

class Plant {
  final String especie, nome, x, y;
  Plant(this.especie, this.nome, this.x, this.y);
}

