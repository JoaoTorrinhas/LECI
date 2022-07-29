import 'dart:convert';
import 'dart:async';
//import 'dart:developer';

import 'dart:typed_data';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:flutter/material.dart';
//import 'package:peciapp/plantslist.dart'; //poderá não ser usado
import 'package:teste/plantdetail.dart';
import 'package:http/http.dart' as http;
//import 'package:teste/main_maps.dart'; //está a importar
//import './main_maps.dart'; //tb não funciona

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//with SingleTickerProviderStateMixin a seguir ao State<MyHomePage>
class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  StreamSubscription _locationSubscription;
  final Location _locationTracker = Location();
  Marker marker;
  final Set<Marker> markers = {};
  Circle circle;
  GoogleMapController _controller;
  List<Plant> plants = [];
  String linkapi;

  Future<String> getCurrentURL() async {
    //var location = await _locationTracker.getLocation();
    //LocationData newLocalData;
    _locationSubscription =
        // ignore: void_checks
        _locationTracker.onLocationChanged().listen((newLocalData) async {
      var x1 = newLocalData.longitude.toStringAsFixed(10);
      var x2 = newLocalData.latitude.toStringAsFixed(10);

      String primeira = "http://164.92.154.30/?X=";
      String segunda = "&Y=";
      String terceira = "&radius=25";
      //String linkapi = primeira + x1 + segunda + x2 + terceira;
      setState(() {
        linkapi = primeira + x1 + segunda + x2 + terceira;
      });
      print("link:");
      print(linkapi);
      //print(response.body);
      //return linkapi;
    });
    //return Future.value(linkapi);
  }

  Future<List<Plant>> getPlantsData() async {
    //Future<String> stringFuture = getCurrentURL();
    //print(stringFuture);
    //String url = await stringFuture;
    //print("erro3:");
    //print(url);
    //'http://164.92.154.30/?X=-8.6605096000&Y=40.632381220&radius=50'
    //var aux =getCurrentURL(); //dá a msm coisa com o .toString() ---> Instance of 'Future<String>'
    //print("erro1:");
    //print(aux);
    var aux = await getCurrentURL(); //é passada uma instância da string em vez de ser a string
    //print(aux);
    print(linkapi);
    String url = aux.toString();
    //print("erro2:");
    //print(url);
    final response = await http.get(Uri.parse(linkapi));
    //final response = await http.get(Uri.parse("http://164.92.154.30/?X=-8.6585420000&Y=40.6298508000&radius=50"));
    plants = [];
    //http://164.92.154.30/?X=-8.6605096000&Y=40.632381220
    //List<Plant> plants = [];
    //print(response.body);
    if (response.statusCode == 200) {
      //print("Estou dentro do if, ou seja, response == 200");
      var jsonData = jsonDecode(response.body);
      //print(jsonData);
      for (var u in jsonData) {
        Plant plant = Plant(u['Especie'], u['Nome']);
        plants.add(plant);
      }
    }
    //print('response != 200');
    //print(plants.length);
    return plants;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back, color: Colors.white),
          title: const Text('Nas proximidades'),
          titleTextStyle: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 25.0,
              fontWeight: FontWeight.w500),
          backgroundColor: Color(0xFF00796B),
        ),
        body: Container(
          child: Card(
            child: FutureBuilder(
              future: getPlantsData(),
              //BuildContext context
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return Container(
                    child: Center(
                      child: Text('Loading...'),
                    ),
                  );
                } else
                  return ListView.builder(
                      //DESTA MANEIRA OU DO CONTAINER(linha 108 até 118) DÁ O MSM ERRO!!!!
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, i) {
                        return ListTile(
                          //ListTile vai ser a maneira como vão estar distribuidas as plantas, pesquisar "https://api.flutter.dev/flutter/material/ListTile-class.html"
                          title: Text(snapshot.data[i].especie),
                          subtitle: Text(snapshot.data[i].nome),
                          dense: true,
                          onTap: () {
                           
                          },
                          trailing: Wrap(
                            children: <Widget>[
                              Icon(Icons.control_point,
                                  color: Colors.white.withOpacity(0.4),
                                  size: 30.0),
                            ],
                          ),
                        );
                      });
              },
            ),
          ),
        )
        );
  }
}

class Plant {
  final String especie, nome;
  Plant(this.especie, this.nome);
}
