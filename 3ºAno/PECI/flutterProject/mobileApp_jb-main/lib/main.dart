import 'package:flutter/material.dart';
import 'package:teste/first_page.dart';
import 'package:teste/home_page.dart';

void main() {
  // runApp(HomePage());
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    ),
  );
}