import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:peciapp/plantslist.dart'; //poderá não ser usado
import 'package:peciapp/plantdetail.dart';
import 'package:http/http.dart' as http;

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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  //late TabController tabController;
  Future<List<Plant>> getPlantsData() async {
    //var response =
    //await http.get('http://164.92.154.30/?X=-8.6605096000&Y=40.632381220', headers: {
    //"Access-Control-Allow-Origin": "*",
    //"Access-Control-Allow-Methods": "POST, GET, OPTIONS, PUT, DELETE, HEAD",
    //});
    //Testar fazer o get de outra maneira, usar pacote: http:^0.12.2 (ver video) remover o fichiero lock e fazer flutter pub get e adicionar o pacote(confirmar na net)

    /*var response = await http.get(
        Uri.http('164.92.154.30', '?X=-8.6605096000&Y=40.632381220'),
        headers: {
          "Access-Control-Allow-Origin": "*",
        });
    */
    final response = await http
        .get(Uri.parse('http://164.92.154.30/?X=-8.6605096000&Y=40.632381220&radius=50'));
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
  //pode não ser necessário, necessário se usar a class plantlist
  /*getLenghtPlants() async {
    var response = await http
        .get(Uri.http('164.92.154.30', '?X=-8.6605096000&Y=40.632381220'));
    //http://164.92.154.30/?X=-8.6605096000&Y=40.632381220
    var jsonData = jsonDecode(response.body);
    List<Plant> plants = [];
    for (var u in jsonData) {
      Plant plant = Plant(u['Especie'], u['Nome']);
      plants.add(plant);
    }
    int plantsLength = plants.length;
    return plantsLength;
  }
  //

  //pode não ser necessário, necessário se usar a class plantlist
  //é para saber quantas o número de plantas
  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(vsync: this, length: getLenghtPlants());
    super.initState();
  }
  */
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new Icon(Icons.menu),
        title: const Text('Nas proximidades'),
        titleTextStyle: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 30.0,
            fontWeight: FontWeight.w500),
        backgroundColor: Color(0xFF00796B),
      ),
      /*body: Center(
        child: ElevatedButton(
          child: Text('Click me'),
          onPressed: () {
            getPlantsData();
          },
        ),
      ),*/
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
                } else return ListView.builder(
                      //DESTA MANEIRA OU DO CONTAINER(linha 108 até 118) DÁ O MSM ERRO!!!!
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, i) {
                        return ListTile(
                          //ListTile vai ser a maneira como vão estar distribuidas as plantas, pesquisar "https://api.flutter.dev/flutter/material/ListTile-class.html"
                          title: Text(snapshot.data[i].especie),
                          subtitle: Text(snapshot.data[i].nome),
                          dense: true,
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PlantDetail()));
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
                //Container(
                //height: MediaQuery.of(context).size.height - 200.0,
                //child: TabBarView(
                //controller: tabController,
                //children: <Widget>[
                //for(int i in snapshot.data.length)  PlantList(snapshot.data[i].especie, snapshot.data[i].name)
                //PlantList(),
                //PlantList(),
                //],
                //),
                //);
              },
            ),
          ),
        )
      //body: ListView(
      //children: <Widget>[
      //SizedBox(height: 15.0),
      //Container(
      //width: MediaQuery.of(context).size.width,
      //padding: EdgeInsets.only(right: 10.0),
      //child: Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // children: <Widget>[
      //IconButton(
      //icon: Icon(Icons.menu),
      //onPressed: () {},
      //)
      //],
      //),
      //),

      //Padding(
      //padding: const EdgeInsets.all(70.0),
      //alterar posição de "Nas proximidades"
      //padding: const EdgeInsets.fromLTRB(35.0, 35.0, 40.0, 350.0),
      //child: Text(
      //'Nas proximidades',
      //style: TextStyle(
      //fontFamily: 'Montserrat',
      //fontSize: 40.0,
      //fontWeight: FontWeight.w500),
      //),
      //),

      //Container(
      //height: MediaQuery.of(context).size.height - 200.0,
      //child: TabBarView(
      //controller: tabController,
      //children: <Widget>[
      //PlantList(),
      //PlantList(),
      //PlantList(),
      //],
      //),
      // )
      //],
      // )
    );
  }
}

class Plant {
  final String especie, nome;
  Plant(this.especie, this.nome);
}
