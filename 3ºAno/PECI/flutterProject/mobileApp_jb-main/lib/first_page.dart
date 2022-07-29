import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'cover_photos.dart';
import 'main_maps.dart';
import 'menu.dart';

enum SocialMedia {
  facebook,
  website,
  instagram,
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  String nome = 'GardenTec';
  int x = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 20,
          left: 40,
          right: 40,
        ),
        color: Colors.white,
        child: ListView(
          children: <Widget> [
            SizedBox(
              width: 128,
              height: 128,
              child: Image.asset("assets/logo/gardenTec.png"),
            ),
            SizedBox(
              height: 20,
            ),

            //texto
            Column(
              children: [
                Text('Encontra plantas fantásticas à tua volta!',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                // Text('x plantas à tua volta'),

              ],
            ),

            SizedBox(
              height: 10,
            ),

            Column(
              children: [
                Container(
                  //width: 350,
                  //height: 250,
                  decoration: BoxDecoration(
                    color: Color(0xFFCAD2C5),
                    borderRadius: BorderRadius.all(
                            Radius.circular(5),
                    ),
                  ),


                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Nome
                     /*  TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: " Nickname (facultativo)",
                          labelStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                        style: TextStyle(fontSize: 20),
                      ), */

                      SizedBox(
                        height: 10,
                      ),

                      /* // imagens
                      CarouselSlider(
                        options: CarouselOptions(
                          aspectRatio: 2.0,
                          viewportFraction: 0.9,
                          enlargeCenterPage: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                          //enableInfiniteScroll: false,
                          //initialPage: 2,
                          //scrollDirection: Axis.horizontal,
                          //autoPlay: true,
                        ),
                        items: Category1.categories.map((category) => HeroCarouselCard(category: category)).toList(),
                      ) */

                    ],


                  ),
                ),

                // imagens
                SizedBox(
                  height: 40,
                ),

                Container(
                  child:
                      // imagens
                      CarouselSlider(
                        options: CarouselOptions(
                          aspectRatio: 2.0,
                          viewportFraction: 0.9,
                          enlargeCenterPage: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                        ),
                        items: Category1.categories.map((category) => HeroCarouselCard(category: category)).toList(),
                      )
                ),

              ],
            ),


            //Butão
            SizedBox(
              height: 20,
            ),

            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3, 1],
                  colors: [
                    Color(0xFF52796F),
                    Color(0xFF354F52),
                  ]
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => MenuPage(), //MyHomePageMaps(),
                      ),
                      (route) => false
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Avançar",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        child: SizedBox(
                          child: Icon(
                            Icons.next_plan_sharp,
                            color: Colors.white,
                          ),
                          // child: Image.asset("assets/fotos/planta.png"),
                          // height: 28,
                          // width: 28,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),


            SizedBox(
              height: 40,
            ),

            // Redes sociais
            /* Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                // color: Color(0xFF52796F),

                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                )
              ),

              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildSocialButton(
                      icon: FontAwesomeIcons.facebookSquare,
                      color: Color(0xFF0075FC),
                      onClicked: () => share(SocialMedia.facebook),
                    ),
                    buildSocialButton(
                      icon: FontAwesomeIcons.twitter,
                      color: Color(0xFF52796F),
                      onClicked: () => share(SocialMedia.website),
                    ),
                    buildSocialButton(
                      icon: FontAwesomeIcons.instagramSquare,
                      // color: Color(0xFF833AB4),
                      onClicked: () => share(SocialMedia.instagram),
                    ),
                  ],

                ),
              ),
            ), */

          ],
        ),
      ),
    );
  }
}

class HeroCarouselCard extends StatelessWidget {
  final Category1 category;

  const HeroCarouselCard({
    this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.asset(category.imageC, fit: BoxFit.cover, width: 1000.0),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  // padding: EdgeInsets.symmetric(
                  //     vertical: 20.0, horizontal: 25.0),
                  // child: Text(
                  //   category.name,
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //     fontSize: 20.0,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                ),
              ),
            ],
          )),
    );
  }
}


Future share(SocialMedia platform) async {
  final urls = {
    SocialMedia.facebook: ('https://www.facebook.com/'),
    SocialMedia.website: ('https://www.google.com/'),
    SocialMedia.instagram: ('https://www.instagram.com/')
  };

  final url = urls[platform];
  if (await canLaunch(url)) {
    await launch(url);
  }
}

Widget buildSocialButton({
  IconData icon,
  Color color,
  Function() onClicked
}) =>
  InkWell(
    child: Container(
      width: 60,
      height: 60,
      child: Center(
        child: FaIcon(icon, color:color, size: 40),
      ),
    ),
    onTap: onClicked,
  );


// return Scaffold(
//       appBar: AppBar(
//         title: Text(nome),
//       ),
//       body: Column(
//         children: [
//           Text('Encontra plantas fantásticas à tua volta!',
//             style: TextStyle(
//               fontSize: 30,
//             ),),
//           Text('x plantas à tua volta'),
//           FlatButton(
//             onPressed: () {
//               setState(() {
//                 nome = 'Alterado para Ana 2 com stateful';
//               });

//             },
//             child: Text('Butão')
//           ),


//         //log-in
//           Container(
//             width: 350,
//             height: 350,
//             color: Colors.green,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Junta-te!',
//                   style: TextStyle(
//                     fontSize: 30,
//                   ),
//                 ),
//                 Text('Insere o teu nome para iniares esta aventura.',
//                   style: TextStyle(
//                     fontSize: 15,
//                   ),
//                 ),
//               ],


//             ),
//           ),

//         ],

//       ),
//     );
