import 'package:flutter/material.dart';

import 'all_plants.dart';
import 'first_page.dart';
import 'main_maps.dart';

class DrawerBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image:  AssetImage('assets/uni.jpg'))
              ),
              child: Stack(children: <Widget>[
                Positioned(
                  bottom: 18.0,
                  left: 23.0,
                  child: Text('Desfrute da visita!!',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500
                  )),
                ),
              ],)
            ),
            ListTile(
              leading:  Icon(Icons.map_rounded),
              title: Text('Voltar ao mapa'),
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => MyHomePageMaps(),
                  ),
                  (route) => false
                );
              },
            ),
            ListTile(
              leading:  Icon(Icons.article_outlined),
              title: Text('Todas as plantas'),
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => AllPlants(),
                  ),
                  (route) => false
                );
              },
            ),
            ListTile(
              leading:  Icon(Icons.alt_route_outlined),
              title: Text('Procurar planta'),
              onTap: () => print('pesquiar'),
            ),

            Divider(
              color:   Color(0xFFCAD2C5),
              thickness: 1,
            ),

            ListTile(
              leading:  Icon(Icons.edit_outlined),
              title: Text('Sugestões'),
              onTap: () => print('fav'),
            ),
            ListTile(
              leading:  Icon(Icons.help),
              title: Text('Ajuda'),
              onTap: () => print('ajuda'),
            ),

            Divider(
              color:   Color(0xFFCAD2C5),
              thickness: 1,
            ),

            ListTile(
              leading:  Icon(Icons.exit_to_app),
              title: Text('Sair'),
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => FirstPage(),
                  ),
                  (route) => false
                );
              },
            ),
          ],
        ),
      //),
    );
  }
}
