// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:teste/plantdetail.dart';
//import 'package:flutter_compass/flutter_compass.dart';

class MyHomePageMaps extends StatefulWidget {
  //MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePageMaps> {
  StreamSubscription _locationSubscription;
  final Location _locationTracker = Location();
  Marker marker;
  //final Set<Marker> markers = {};
  Circle circle;
  GoogleMapController _controller;
  Set<Marker> markers = {};
  List<Plant> plants = [];
  String linkapiUpdate;
  BitmapDescriptor customIcon;

  void setCustomMarker() async {
    customIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 2.5), 'assets/leaf.png');
  }

  static const CameraPosition initialLocation = CameraPosition(
    target: LatLng(41.1535, -8.6421),
    zoom: 50,
  );

  Future<Uint8List> getMarker() async {
    ByteData byteData =
        await DefaultAssetBundle.of(context).load("assets/pessoa.png");
    return byteData.buffer.asUint8List();
  }

  @override
  void initState() {
    super.initState();
    setCustomMarker();
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
          radius: 7,
          zIndex: 1,
          strokeColor: Colors.blue.withAlpha(100),
          center: latlng,
          fillColor: Colors.blue.withAlpha(50));
    });
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
                  zoom: 25)));
          updateMarkerAndCircle(newLocalData, imageData);

          var x1 = newLocalData.longitude.toStringAsFixed(10);
          var x2 = newLocalData.latitude.toStringAsFixed(10);
          //markers = {};
          String primeira =
              "http://gardentec.co/api/v1/plant/location?latitude=";
          String segunda = "&longitude=";
          String terceira = "&radius=7";
          String linkapi = primeira + x1 + segunda + x2 + terceira;
          //print(linkapi);

          final response = await http.get(Uri.parse(linkapi));

          List data = jsonDecode(response.body)['data']['result'];
          //print(data);

          Set<Marker> markersaux = {};

          for (var element in data) {
            Map obj = element;
            String xcor = obj['coordenada']['ETRS89_Coordenadas_Geograficas_x'];
            String ycor = obj['coordenada']['ETRS89_Coordenadas_Geograficas_y'];
            int plantid = obj['id'];
            String especie = obj['generico']['taxonomia']['especie']['nome'];
            String nome = obj['generico']['nome_comum'];
            //print(xcor);
            //print(ycor);
            //print(especie);
            var xcor2 = double.tryParse(xcor);
            var ycor2 = double.tryParse(ycor);
            if (data != []) {
              setState(() {
                markersaux.add(Marker(
                  //add first marker
                  markerId: MarkerId(plantid.toString()),
                  position: LatLng(ycor2, xcor2), //position of marker
                  infoWindow: InfoWindow(
                    //popup info
                    title: nome,
                  ),
                  icon: customIcon, //Icon for Marker
                ));
              });
            }
          }
          Set<Marker> markersCopy = new Set.from(markers);
          markersCopy.forEach((element) {
            if (!markersaux.contains(element)) {
              markers.remove(element);
            }
          });

          markersaux.forEach((element) {
            markers.add(element);
          });
          //se andar isto vai fazer mal para já, vai andar e adicionar sempre. Para ficar bem tem de se eliminar o if e deixar o markers=markersaux ou mexer no markeraux.add para marker.add e descomentar o markers = {}
          // if (markers != markersaux) {
          //   Set<Marker> aux = markersaux.difference(markers);
          //   aux.forEach((element) {
          //     markers.add(element);
          //   });
          //   //eliminar do set original caso o set auxiliar tenha elementos que desapareçeram

          //   //markers = markersaux;
          // }
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

  Future<String> getCurrentURL() async {
    //var location = await _locationTracker.getLocation();
    //LocationData newLocalData;
    _locationSubscription =
        // ignore: void_checks
        _locationTracker.onLocationChanged().listen((newLocalData) async {
      var x1 = newLocalData.longitude.toStringAsFixed(10);
      var x2 = newLocalData.latitude.toStringAsFixed(10);

      String primeira = "http://gardentec.co/api/v1/plant/location?latitude=";
      String segunda = "&longitude=";
      String terceira = "&radius=7";
      //String quarta = "&brief";
      //String linkapi = primeira + x1 + segunda + x2 + terceira;
      setState(() {
        linkapiUpdate = primeira + x1 + segunda + x2 + terceira;
      });
      //print("link:");
      //print(linkapiUpdate);
    });
  }

  Future<List<Plant>> getPlantsData() async {
    var aux =
        await getCurrentURL(); //é passada uma instância da string em vez de ser a string
    //print(aux);
    print(linkapiUpdate);
    String url = aux.toString();
    final response = await http.get(Uri.parse(linkapiUpdate));
    //final response = await http.get(Uri.parse("http://164.92.154.30/?X=-8.6585420000&Y=40.6298508000&radius=50"));
    plants = [];
    //print("antes");
    if (response.statusCode == 200) {
      //print("depois");
      var jsonData = jsonDecode(response.body)['data']['result'];
      //print(jsonData);
      for (var u in jsonData) {
        //print(u['generico']['taxonomia']['especie']['nome']);
        //print(u['generico']['autor']['nome']);
        //print(u['generico']['sigla']);
        var dimensao2 = u['dimensao'];
        String altura,
            copa,
            distribuicaoGeografica,
            perenidade,
            habitat,
            morfologia,
            tipoDeOrigem,
            autor;
        var habitat2 = u['generico']['habitat'];
        var distribuicaoGeografica2 = u['generico']['distribuicao_geografica'];
        var perenidade2 = u['generico']['perenidade'];
        var morfologia2 = u['generico']['morfologia'];
        var tipoDeOrigem2 = u['generico']['tipo_de_origem'];
        var autor2 = u['generico']['autor'];

        if (dimensao2 != null) {
          //print(dimensao2["altura"].runtimeType);
          altura = dimensao2['altura'].toString();
          //print("teste");
          copa = dimensao2['copa'].toString();
        }
        if (habitat2 != null) {
          habitat = habitat2['texto'];
        }
        if (distribuicaoGeografica2 != null) {
          distribuicaoGeografica = distribuicaoGeografica2['texto'];
        }
        if (perenidade2 != null) {
          perenidade = perenidade2['nome'];
        }

        if (morfologia2 != null) {
          morfologia = morfologia2['nome'];
        }

        if (tipoDeOrigem2 != null) {
          tipoDeOrigem = tipoDeOrigem2['nome'];
        }
        if (autor2 != null) {
          autor = autor2['nome'];
        }
        //print("if realizados");

        Plant plant = Plant(
            u['generico']['taxonomia']['especie']['nome'],
            u['generico']['nome_comum'],
            u['coordenada']['ETRS89_Coordenadas_Geograficas_x'],
            u['coordenada']['ETRS89_Coordenadas_Geograficas_y'],
            altura,
            copa,
            u['seccao']['nome'],
            u['generico']['sigla'],
            u['generico']['taxonomia']['familia']['nome'],
            u['generico']['taxonomia']['genero']['nome'],
            u['generico']['taxonomia']['cultivar'],
            habitat,
            distribuicaoGeografica,
            perenidade,
            morfologia,
            tipoDeOrigem,
            autor);
        //print(plant);
        plants.add(plant);
      }
      //print(plants);
    }
    return plants;
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
    final panelHeightClosed = MediaQuery.of(context).size.height * 0.07;
    final panelHeightOpen = MediaQuery.of(context).size.height * 0.8;

    BorderRadiusGeometry radius = const BorderRadius.only(
      bottomLeft: Radius.circular(24.0),
      bottomRight: Radius.circular(24.0),
    );

    return Scaffold(
      body: SlidingUpPanel(
        minHeight: panelHeightClosed,
        maxHeight: panelHeightOpen,
        parallaxEnabled: true,
        parallaxOffset: .4,
        body: Scaffold(
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
        ),
        collapsed: Container(
          decoration: const BoxDecoration(
              color:
                  Colors.white), // Color(0xFF00796B)), //, borderRadius: radius
          child: const Center(
            child: Text(
              "Nas proximidades",
              style: TextStyle(
                  color: Color(0xFF52796F), //Colors.white,
                  fontSize: 25.0,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        panel: Scaffold(
            body: Container(
          decoration: BoxDecoration(borderRadius: radius),
          child: Card(
            //Antes estava Card
            color: Colors.white,
            child: FutureBuilder(
              future: getPlantsData(),
              //BuildContext context
              builder: (context, AsyncSnapshot snapshot) {
                //print(snapshot.data);
                if (snapshot.data == null) {
                  return Container(
                    child: const Center(
                      child: Text('Loading...'),
                    ),
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, i) {
                        if (snapshot.data[i].especie != null &&
                            snapshot.data[i].nome == null &&
                            snapshot.data[i].genero != null &&
                            snapshot.data[i].cultivar != null &&
                            snapshot.data[i].autor == null) {
                          return ListTile(
                            title: Text(
                                'Nome científico: ${snapshot.data[i].genero} ${snapshot.data[i].especie} "${snapshot.data[i].cultivar}"'),
                            dense: true,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PlantDetail(
                                            snapshot.data[i].especie,
                                            snapshot.data[i].nome,
                                            snapshot.data[i].x,
                                            snapshot.data[i].y,
                                            snapshot.data[i].altura,
                                            snapshot.data[i].copa,
                                            snapshot.data[i].seccao,
                                            snapshot.data[i].sigla,
                                            snapshot.data[i].familia,
                                            snapshot.data[i].genero,
                                            snapshot.data[i].cultivar,
                                            snapshot.data[i].habitat,
                                            snapshot.data[i].distGeografica,
                                            snapshot.data[i].perenidade,
                                            snapshot.data[i].morfologia,
                                            snapshot.data[i].tipoOrigem,
                                            snapshot.data[i].autor,
                                          )));
                              //Navigator.of(context).push(MaterialPageRoute(
                              //builder: (context) => PlantDetail()));
                            },
                            trailing: Wrap(
                              children: const <Widget>[
                                Icon(Icons.info_outline,
                                    color: Color(0xFFA5D6A7), size: 30.0),
                              ],
                            ),
                          );
                        } else if (snapshot.data[i].especie != null &&
                            snapshot.data[i].nome == null &&
                            snapshot.data[i].genero != null &&
                            snapshot.data[i].cultivar == null &&
                            snapshot.data[i].autor != null) {
                          return ListTile(
                            title: Text(
                                'Nome científico: ${snapshot.data[i].genero} ${snapshot.data[i].especie} ${snapshot.data[i].autor}'),
                            dense: true,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PlantDetail(
                                            snapshot.data[i].especie,
                                            snapshot.data[i].nome,
                                            snapshot.data[i].x,
                                            snapshot.data[i].y,
                                            snapshot.data[i].altura,
                                            snapshot.data[i].copa,
                                            snapshot.data[i].seccao,
                                            snapshot.data[i].sigla,
                                            snapshot.data[i].familia,
                                            snapshot.data[i].genero,
                                            snapshot.data[i].cultivar,
                                            snapshot.data[i].habitat,
                                            snapshot.data[i].distGeografica,
                                            snapshot.data[i].perenidade,
                                            snapshot.data[i].morfologia,
                                            snapshot.data[i].tipoOrigem,
                                            snapshot.data[i].autor,
                                          )));
                              //Navigator.of(context).push(MaterialPageRoute(
                              //builder: (context) => PlantDetail()));
                            },
                            trailing: Wrap(
                              children: const <Widget>[
                                Icon(Icons.info_outline,
                                    color: Color(0xFFA5D6A7), size: 30.0),
                              ],
                            ),
                          );
                        } else if (snapshot.data[i].especie != null &&
                            snapshot.data[i].nome == null &&
                            snapshot.data[i].genero != null &&
                            snapshot.data[i].cultivar != null &&
                            snapshot.data[i].autor != null) {
                          return ListTile(
                            title: Text(
                                'Nome científico: ${snapshot.data[i].genero} ${snapshot.data[i].especie} "${snapshot.data[i].cultivar}" ${snapshot.data[i].autor}'),
                            dense: true,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PlantDetail(
                                            snapshot.data[i].especie,
                                            snapshot.data[i].nome,
                                            snapshot.data[i].x,
                                            snapshot.data[i].y,
                                            snapshot.data[i].altura,
                                            snapshot.data[i].copa,
                                            snapshot.data[i].seccao,
                                            snapshot.data[i].sigla,
                                            snapshot.data[i].familia,
                                            snapshot.data[i].genero,
                                            snapshot.data[i].cultivar,
                                            snapshot.data[i].habitat,
                                            snapshot.data[i].distGeografica,
                                            snapshot.data[i].perenidade,
                                            snapshot.data[i].morfologia,
                                            snapshot.data[i].tipoOrigem,
                                            snapshot.data[i].autor,
                                          )));
                              //Navigator.of(context).push(MaterialPageRoute(
                              //builder: (context) => PlantDetail()));
                            },
                            trailing: Wrap(
                              children: const <Widget>[
                                Icon(Icons.info_outline,
                                    color: Color(0xFFA5D6A7), size: 30.0),
                              ],
                            ),
                          );
                        } else if (snapshot.data[i].especie != null &&
                            snapshot.data[i].nome == null &&
                            snapshot.data[i].genero != null &&
                            snapshot.data[i].cultivar == null &&
                            snapshot.data[i].autor == null) {
                          return ListTile(
                            title: Text(
                                'Nome científico: ${snapshot.data[i].genero} ${snapshot.data[i].especie}'),
                            dense: true,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PlantDetail(
                                            snapshot.data[i].especie,
                                            snapshot.data[i].nome,
                                            snapshot.data[i].x,
                                            snapshot.data[i].y,
                                            snapshot.data[i].altura,
                                            snapshot.data[i].copa,
                                            snapshot.data[i].seccao,
                                            snapshot.data[i].sigla,
                                            snapshot.data[i].familia,
                                            snapshot.data[i].genero,
                                            snapshot.data[i].cultivar,
                                            snapshot.data[i].habitat,
                                            snapshot.data[i].distGeografica,
                                            snapshot.data[i].perenidade,
                                            snapshot.data[i].morfologia,
                                            snapshot.data[i].tipoOrigem,
                                            snapshot.data[i].autor,
                                          )));
                            },
                            trailing: Wrap(
                              children: const <Widget>[
                                Icon(Icons.info_outline,
                                    color: Color(0xFFA5D6A7), size: 30.0),
                              ],
                            ),
                          );
                        } else if (snapshot.data[i].especie != null &&
                            snapshot.data[i].nome != null &&
                            snapshot.data[i].genero != null &&
                            snapshot.data[i].cultivar != null &&
                            snapshot.data[i].autor == null) {
                          return ListTile(
                            title: Text(
                                'Nome científico: ${snapshot.data[i].genero} ${snapshot.data[i].especie} "${snapshot.data[i].cultivar}"'),
                            subtitle:
                                Text('Nome Comum: ${snapshot.data[i].nome}'),
                            dense: true,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PlantDetail(
                                            snapshot.data[i].especie,
                                            snapshot.data[i].nome,
                                            snapshot.data[i].x,
                                            snapshot.data[i].y,
                                            snapshot.data[i].altura,
                                            snapshot.data[i].copa,
                                            snapshot.data[i].seccao,
                                            snapshot.data[i].sigla,
                                            snapshot.data[i].familia,
                                            snapshot.data[i].genero,
                                            snapshot.data[i].cultivar,
                                            snapshot.data[i].habitat,
                                            snapshot.data[i].distGeografica,
                                            snapshot.data[i].perenidade,
                                            snapshot.data[i].morfologia,
                                            snapshot.data[i].tipoOrigem,
                                            snapshot.data[i].autor,
                                          )));
                            },
                            trailing: Wrap(
                              children: const <Widget>[
                                Icon(Icons.info_outline,
                                    color: Color(0xFFA5D6A7), size: 30.0),
                              ],
                            ),
                          );
                        } else if (snapshot.data[i].especie != null &&
                            snapshot.data[i].nome != null &&
                            snapshot.data[i].genero != null &&
                            snapshot.data[i].cultivar == null &&
                            snapshot.data[i].autor != null) {
                          return ListTile(
                            title: Text(
                                'Nome científico: ${snapshot.data[i].genero} ${snapshot.data[i].especie} ${snapshot.data[i].autor}'),
                            subtitle:
                                Text('Nome Comum: ${snapshot.data[i].nome}'),
                            dense: true,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PlantDetail(
                                            snapshot.data[i].especie,
                                            snapshot.data[i].nome,
                                            snapshot.data[i].x,
                                            snapshot.data[i].y,
                                            snapshot.data[i].altura,
                                            snapshot.data[i].copa,
                                            snapshot.data[i].seccao,
                                            snapshot.data[i].sigla,
                                            snapshot.data[i].familia,
                                            snapshot.data[i].genero,
                                            snapshot.data[i].cultivar,
                                            snapshot.data[i].habitat,
                                            snapshot.data[i].distGeografica,
                                            snapshot.data[i].perenidade,
                                            snapshot.data[i].morfologia,
                                            snapshot.data[i].tipoOrigem,
                                            snapshot.data[i].autor,
                                          )));
                            },
                            trailing: Wrap(
                              children: const <Widget>[
                                Icon(Icons.info_outline,
                                    color: Color(0xFFA5D6A7), size: 30.0),
                              ],
                            ),
                          );
                        } else if (snapshot.data[i].especie != null &&
                            snapshot.data[i].nome != null &&
                            snapshot.data[i].genero != null &&
                            snapshot.data[i].cultivar != null &&
                            snapshot.data[i].autor != null) {
                          return ListTile(
                            title: Text(
                                'Nome científico: ${snapshot.data[i].genero} ${snapshot.data[i].especie} "${snapshot.data[i].cultivar}" ${snapshot.data[i].autor}'),
                            subtitle:
                                Text('Nome Comum: ${snapshot.data[i].nome}'),
                            dense: true,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PlantDetail(
                                            snapshot.data[i].especie,
                                            snapshot.data[i].nome,
                                            snapshot.data[i].x,
                                            snapshot.data[i].y,
                                            snapshot.data[i].altura,
                                            snapshot.data[i].copa,
                                            snapshot.data[i].seccao,
                                            snapshot.data[i].sigla,
                                            snapshot.data[i].familia,
                                            snapshot.data[i].genero,
                                            snapshot.data[i].cultivar,
                                            snapshot.data[i].habitat,
                                            snapshot.data[i].distGeografica,
                                            snapshot.data[i].perenidade,
                                            snapshot.data[i].morfologia,
                                            snapshot.data[i].tipoOrigem,
                                            snapshot.data[i].autor,
                                          )));
                            },
                            trailing: Wrap(
                              children: const <Widget>[
                                Icon(Icons.info_outline,
                                    color: Color(0xFFA5D6A7), size: 30.0),
                              ],
                            ),
                          );
                        } else if (snapshot.data[i].especie != null &&
                            snapshot.data[i].nome != null &&
                            snapshot.data[i].genero != null &&
                            snapshot.data[i].cultivar == null &&
                            snapshot.data[i].autor == null) {
                          return ListTile(
                            title: Text(
                                'Nome científico: ${snapshot.data[i].genero} ${snapshot.data[i].especie}'),
                            subtitle:
                                Text('Nome Comum: ${snapshot.data[i].nome}'),
                            dense: true,
                            //tileColor: Color(0xFFE8F5E9),
                            //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PlantDetail(
                                            snapshot.data[i].especie,
                                            snapshot.data[i].nome,
                                            snapshot.data[i].x,
                                            snapshot.data[i].y,
                                            snapshot.data[i].altura,
                                            snapshot.data[i].copa,
                                            snapshot.data[i].seccao,
                                            snapshot.data[i].sigla,
                                            snapshot.data[i].familia,
                                            snapshot.data[i].genero,
                                            snapshot.data[i].cultivar,
                                            snapshot.data[i].habitat,
                                            snapshot.data[i].distGeografica,
                                            snapshot.data[i].perenidade,
                                            snapshot.data[i].morfologia,
                                            snapshot.data[i].tipoOrigem,
                                            snapshot.data[i].autor,
                                          )));
                            },
                            trailing: Wrap(
                              children: const <Widget>[
                                Icon(Icons.info_outline,
                                    color: Color(0xFFA5D6A7), size: 30.0),
                              ],
                            ),
                          );
                        }
                      });
                }
              },
            ),
          ),
        )),
      ),
    );
  }
}

class Plant {
  final String especie,
      nome,
      x,
      y,
      altura,
      copa,
      seccao,
      sigla,
      familia,
      genero,
      cultivar,
      habitat,
      distGeografica,
      perenidade,
      morfologia,
      tipoOrigem,
      autor;
  Plant(
      this.especie,
      this.nome,
      this.x,
      this.y,
      this.altura,
      this.copa,
      this.seccao,
      this.sigla,
      this.familia,
      this.genero,
      this.cultivar,
      this.habitat,
      this.distGeografica,
      this.perenidade,
      this.morfologia,
      this.tipoOrigem,
      this.autor);
}
