// screens[index],

//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:teste/all_plants.dart';
import 'package:teste/definitions.dart';
import 'package:teste/search.dart';

import 'main_maps.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int index = 0;

  final screens = [
    MyHomePageMaps(),
    //AllPlants(),
    //Center(child: Text('Pesquisa', style: TextStyle(fontSize: 12))),
    //Center(child: Text('Definições', style: TextStyle(fontSize: 12))),
    Shearch(),
    Definitions(),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    body: screens[index],
    bottomNavigationBar: NavigationBarTheme(

      data: NavigationBarThemeData(
        indicatorColor: Color(0xFF52796F), //Color(0xFF354F52),
        labelTextStyle: MaterialStateProperty.all(
          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
      child: NavigationBar(
        height: 58,
        backgroundColor:Color(0xFFCAD2C5),//Color(0xFF52796F), // Color(0xFF354F52),
        selectedIndex: index,
        onDestinationSelected: (index) =>
              setState(() =>this.index = index),
        destinations:[
          NavigationDestination(
            icon: Icon(Icons.map_outlined),
            label: 'Mapa'
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Pesquisa'
          ),
          NavigationDestination(
            icon: Icon(Icons.help_outline),
            label: 'FAQ´s'
          ),
        ],
      ),
    ),
  );

}
