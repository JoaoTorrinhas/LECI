import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Definitions extends StatefulWidget {
  //MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _Definitions createState() => _Definitions();
}

class _Definitions extends State<Definitions> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            "FAQ´s",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Color.fromARGB(255, 82, 121, 111),
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            SizedBox(
              height: 15,
            ),
            buildColoredCard(),
            SizedBox(
              height: 15,
            ),
            buildColoredCard3(),
            SizedBox(
              height: 15,
            ),
            buildColoredCard2(),
            SizedBox(
              height: 15,
            ),
            buildColoredCard4(),
          ],
        ),
      );

  Widget buildColoredCard() => Card(
        shadowColor: Color.fromARGB(255, 202, 210, 197),
        elevation: 8,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 202, 210, 197),
                Color.fromARGB(255, 202, 210, 197)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          padding: EdgeInsets.all(16),
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              iconColor: Colors.black,
              title: Text(
                'Porque é que estou a ter problemas na aplicação?',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                const SizedBox(height: 4),
                Align(
                  alignment: Alignment(-0.78, -1.0),
                  child: Text(
                    'Certifique-se que:\n'
                    '1: tem acesso à internet.\n'
                    '2: tem GPS ligado.\n'
                    '3: Está dentro do jardim.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );

  Widget buildColoredCard2() => Card(
        shadowColor: Color.fromARGB(255, 202, 210, 197),
        elevation: 8,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 202, 210, 197),
                Color.fromARGB(255, 202, 210, 197)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          padding: EdgeInsets.all(16),
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              iconColor: Colors.black,
              title: Text(
                'Como posso encontrar uma planta em especifico?',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                const SizedBox(height: 4),
                Align(
                  alignment: Alignment(-0.78, -1.0),
                  child: Text(
                    'Selecione a opção pesquisa.\n'
                    'Carregue na barra de pesquisa.\n'
                    'Escreva o nome da planta.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
  Widget buildColoredCard3() => Card(
        shadowColor: Color.fromARGB(255, 202, 210, 197),
        elevation: 8,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 202, 210, 197),
                Color.fromARGB(255, 202, 210, 197)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          padding: EdgeInsets.all(16),
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              iconColor: Colors.black,
              title: Text(
                'Como vejo mais detalhada de uma planta?',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                const SizedBox(height: 4),
                Align(
                  alignment: Alignment(-0.78, -1.0),
                  child: Text(
                    'Selecione a opção mapa.\n'
                    'Arraste para cima NasProximidades.\n'
                    'Selecione a planta desejada.\n'
                    'Obtenha a informação.',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );

  Widget buildColoredCard4() => Card(
        shadowColor: Color.fromARGB(255, 202, 210, 197),
        elevation: 8,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 82, 121, 111),
                Color.fromARGB(255, 82, 121, 111)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment(-0.86, -1.0),
                child: Text(
                  'Contacte-nos:',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Align(
                alignment: Alignment(-0.86, -1.0),
                child: Text(
                  '22 040 8700',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
