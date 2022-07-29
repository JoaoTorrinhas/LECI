import 'package:flutter/material.dart';
import 'package:peciapp/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class PlantDetail extends StatelessWidget {
  //-------------------pode ser necessário para mostrar a outra informação da planta
  Future<List<Plant>> getPlantsData() async {
    final response = await http.get(Uri.parse(
        'http://164.92.154.30/?X=-8.6605096000&Y=40.632381220&radius=50'));
    //http://164.92.154.30/?X=-8.6605096000&Y=40.632381220
    List<Plant> plants = [];
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
  //--------------------------------------

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Color(0xFF399D63)),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 2,
                child: Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      color: Colors.white),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              //Padding(
              //padding: EdgeInsets.only(
              //top: 10.0, left: MediaQuery.of(context).size.width - 60.0
              //),
              //child: FloatingActionButton(
              //onPressed: () {},
              //backgroundColor: Color(0xFF4DA774),
              //mini: true,
              //elevation: 0.0,
              //child: Icon(Icons.shopping_cart,
              //color: Colors.white, size: 15.0),
              //),
              //),
              //Positioned(
              //top: 10.0,
              //left: MediaQuery.of(context).size.width - 30.0,
              //child: Container(
              //height: 18.0,
              //width: 18.0,
              //decoration: BoxDecoration(
              //borderRadius: BorderRadius.circular(9.0),
              //color: Colors.white
              //),
              //child: Center(
              //child: Text(
              //'1',
              //style: TextStyle(color: Color(0xFF399D63),
              //fontFamily: 'Montserrat'
              //),
              //),
              //),
              //),
              //),
              Padding(
                padding: EdgeInsets.only(left: 25.0, top: 60.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Nome',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF8AC7A4)),
                    ),
                    Text(
                      'Ficus',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 45.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      'Proximidade',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF8AC7A4)),
                    ),
                    Text(
                      '5 metros',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 25.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      'Zona',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF8AC7A4)),
                    ),
                    Text(
                      'A',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 25.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                    //SizedBox(height: 10.0),
                    //Container(
                    //height: 50.0,
                    //width: 50.0,
                    //decoration: BoxDecoration(
                    //borderRadius: BorderRadius.circular(25.0),
                    //color: Colors.black),
                    //child: Center(
                    //child: Icon(Icons.shopping_cart, color: Colors.white),
                    //),
                    //)
                  ],
                ),
              ),
              Positioned(
                top: (MediaQuery.of(context).size.height / 2) - 185.0,
                left: (MediaQuery.of(context).size.width / 2) - 80.0,
                child: Image(
                  image: AssetImage('assets/whiteplant.png'),
                  fit: BoxFit.cover,
                  height: 250.0,
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height - 350.0,
                      left: 20.0,
                      right: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Nascimento',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        'If you are completely new to houseplants then Ficus is a brilliant first plant to adopt, it is very easy to look after and won\'t occupy too much space.',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Text(
                        'Detalhes',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Altura: 35-45cm;',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                        ),
                      ),
                      Text(
                        'Largura: 12cm',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Text(
                        'Tempo de vida',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        'Aproximadamente de 5 anos...',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }
}
