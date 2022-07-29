import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';


class Shearch extends StatefulWidget {
  //MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _Shearch createState() => _Shearch();
}

class _Shearch extends State<Shearch> {
  TextEditingController searchController = TextEditingController();
  String resultSearchBar = "";

  StreamSubscription _locationSubscription;
  final Location _locationTracker = Location();
  Marker marker;
  //final Set<Marker> markers = {};
  Circle circle;
  GoogleMapController _controller;
  Set<Marker> markers = {};
  String linkapiUpdate;
  BitmapDescriptor customIcon;
  List plants = [];

  //Position = _currentPosition; Não funciona não sei porquê

  void getResultSearchBar() {
    resultSearchBar = searchController.text;
    //return resultSearchBar;
  }


  void setCustomMarker() async {
    customIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 2.5), 'assets/leaf.png');
  }

  static const CameraPosition initialLocation = CameraPosition(
    target: LatLng(41.1535, -8.6421),
    zoom: 19,
  );

  @override
  void initState() {
    super.initState();
    setCustomMarker();
    // setState(() {
    //   getPlantsSearched();
    // });
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
          radius: 7,
          zIndex: 1,
          strokeColor: Colors.blue.withAlpha(100),
          center: latlng,
          fillColor: Colors.blue.withAlpha(50));
    });
    markers.add(marker);
  }

  void getPlantsSearched() async {
    try {
      //LocationAccuracy accuracy = LocationAccuracy.HIGH;
      //getResultSearchBar();
      //plants = [];
      resultSearchBar = searchController.text;

      var location = await _locationTracker.getLocation();

      if (_locationSubscription != null) {
        _locationSubscription.cancel();
      }

      _locationSubscription =
          // ignore: void_checks
          _locationTracker.onLocationChanged().listen((newLocalData) async {
        if (_controller != null) {
          //String url = "";
          String aux2 = resultSearchBar.toString();
          String aux1 =
              "http://gardentec.co/api/v1/plant/specimen/search?q="; //url da api
          String url = aux1 + aux2;
          markers = {};
          //http request para o url
          //print("cheguei aqui e vou ter o url");
          //print(url);
          final response = await http.get(Uri.parse(url));
          plants = jsonDecode(response.body)['data']['result'];
          //print(plants);
          if (plants != []) {
            for (var element in plants) {
              Map obj = element;
              String xcor =
                  obj['coordenada']['ETRS89_Coordenadas_Geograficas_x'];
              String ycor =
                  obj['coordenada']['ETRS89_Coordenadas_Geograficas_y'];
              String especie = obj['generico']['taxonomia']['especie']['nome'];
              String nome = obj['generico']['nome_comum'];

              var xcor2 = double.tryParse(xcor);
              var ycor2 = double.tryParse(ycor);
              //if (plants != []) {
              setState(() {
                markers.add(Marker(
                  markerId: MarkerId(ycor),
                  position: LatLng(ycor2, xcor2),
                  infoWindow: InfoWindow(
                    //popup info
                    title: nome,
                  ),
                  icon: customIcon,
                ));
              });
              //}
            }
          } else {
            markers = {};
          }
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
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF52796F),
          title: const Text("Mapa de pesquisa"),
          //leading: Icon(Icons.add_alert)
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            //getResultSearchBar();
                            getPlantsSearched();
                            //print(resultSearchBar);
                          });
                        },
                        child: const Icon(Icons.search, color: Colors.black),
                      ),
                      hintText: "Pesquisa por...",
                      hintStyle: const TextStyle(color: Colors.black),
                      border: InputBorder.none),
                ))
              ],
            ),
            Expanded(
              child: GoogleMap(
                mapType: MapType.hybrid,
                initialCameraPosition: initialLocation,
                zoomControlsEnabled: false,
                compassEnabled: true,
                markers: markers,
                //circles: Set.of((circle != null) ? [circle] : []),
                onMapCreated: (GoogleMapController controller) {
                  _controller = controller;
                },
              ),
            )
          ],
        ),
        floatingActionButton:
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          FloatingActionButton(
              //child: const Icon(Icons.location_searching),
              child: Text("UA"),
              onPressed: () {
                //getCurrentLocation();
              },
              heroTag: Null,
              backgroundColor: const Color(0xFF00796B)),
          const SizedBox(
            height: 50,
          ),
          FloatingActionButton(
            //child: const Icon(Icons.eco_rounded),
            child: Text("JB"),
            onPressed: () {
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (context) => MyApp()));
            },
            backgroundColor: const Color(0xFF00796B),
          )
        ])
        );
  }
}
