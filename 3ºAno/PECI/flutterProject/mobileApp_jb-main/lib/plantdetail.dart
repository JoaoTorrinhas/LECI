import 'package:flutter/material.dart';
import 'package:teste/main_plant.dart';
import './main_maps.dart';

class PlantDetail extends StatefulWidget {
  final String especie;
  final String nome;
  final String x;
  final String y;
  final String altura;
  final String copa;
  final String seccao;
  final String sigla;
  final String familia;
  final String genero;
  final String cultivar;
  final String habitat;
  final String distGeografica;
  final String perenidade;
  final String morfologia;
  final String tipoOrigem;
  final String autor;

  PlantDetail(
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

  @override
  _PlantDetailState createState() => _PlantDetailState();
}

class _PlantDetailState extends State<PlantDetail> {
  get textvalueNome => widget.nome;
  get textvalueAltura => widget.altura;
  get textvalueCopa => widget.copa;
  get textvalueSeccao => widget.seccao;
  get textvalueSigla => widget.sigla;
  get textvalueFamilia => widget.familia;
  get textvalueGenero => widget.genero;
  get textvalueCultivar => widget.cultivar;
  get textvalueHabitat => widget.habitat;
  get textvalueDistGeografica => widget.distGeografica;
  get textvaluePerenidade => widget.perenidade;
  get textvalueMorfologia => widget.morfologia;
  get textvalueTipoOrigem => widget.tipoOrigem;
  get textvalueAutor => widget.autor;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height ,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Color(0xFF00796B)),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 2,
                child: Container(
                  height: MediaQuery.of(context).size.height * 10,
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
              Padding(
                padding: EdgeInsets.only(left: 25.0, top: 60.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Especie',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF8AC7A4)),
                    ),
                    Text(
                      '${widget.especie}',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 45.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      'Nome',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF8AC7A4)),
                    ),
                    Text(
                      textvalueNome == null ? 'Não tem um nome associado' : '${widget.nome}', //'${widget.nome}' == null ? 'Não tem nome' : '${widget.nome}'
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 25.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      'Secção',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF8AC7A4)),
                    ),
                    Text(
                      textvalueSeccao == null ? 'Não tem uma secção associada':'${widget.seccao}',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 25.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                    SizedBox(height: 15.0),
                    Text(
                        'Genero',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF8AC7A4)),
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        textvalueGenero == null ? 'Não tem genero associado':'${widget.genero}',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 25.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                        ),
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height - 320.0, //texto para cima na parte branca (VER O FACTO DE O NOME SER NULL)
                      left: 20.0,
                      right: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Altura',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        textvalueAltura == null ? 'Não tem um valor de altura associado':'${widget.altura}',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 25.0),
                      Text(
                        'Copa',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        textvalueCopa == null ? 'Não tem um valor de copa associado':'${widget.copa}',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 25.0),
                      Text(
                        'Sigla',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        textvalueSigla == null ? 'Não tem uma sigla associada':'${widget.sigla}',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 25.0),
                      //SizedBox(height: 30.0),
                      Text(
                        'Familia',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        textvalueFamilia == null ? 'Não tem uma familia associada':'${widget.familia}',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 25.0),
                      Text(
                        'Cultivar',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        textvalueCultivar == null ? 'Não tem informação associada':'${widget.cultivar}',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 25.0),
                      Text(
                        'Habitat',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        textvalueHabitat == null ? 'Não tem um habitat associado':'${widget.habitat}',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 25.0),
                      Text(
                        'Distribuição Geográfica',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        textvalueDistGeografica == null ? 'Não tem distribuição geográfica associada':'${widget.distGeografica}',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 25.0),
                      Text(
                        'Perenidade',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        textvaluePerenidade == null ? 'Não tem informação associada':'${widget.perenidade}',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 25.0),
                      Text(
                        'Morfologia',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        textvalueMorfologia == null ? 'Não tem uma morfologia associada':'${widget.morfologia}',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 25.0),
                      Text(
                        'Tipo de origem',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        textvalueTipoOrigem == null ? 'Não tem um tipo de origem associado':'${widget.tipoOrigem}',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 25.0),
                      Text(
                        'Autor',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        textvalueAutor == null ? 'Não tem autor associado':'${widget.autor}',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 25.0),
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }
}
