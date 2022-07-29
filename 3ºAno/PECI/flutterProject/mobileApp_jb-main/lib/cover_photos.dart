import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Category1 extends Equatable {
  final String name;
  final String imageC;

  const Category1({
    this.name,
    this.imageC,
  });

  @override
  // TODO: implement props
  List<Object> get props => [imageC];

  static List<Category1> categories = [
    Category1(
      //name: 'imagem 1',
      imageC: 'assets/capa/capa1.jpeg',
    ),

    Category1(
     // name: 'imagem 2',
      imageC: 'assets/capa/capa3.jpg',
    ),

    Category1(
      //name: 'imagem 3',
      imageC: 'assets/capa/capa2.jpeg',
    ),
  ];
}
