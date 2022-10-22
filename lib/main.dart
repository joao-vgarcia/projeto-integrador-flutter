import 'package:flutter/material.dart';
import 'package:projeto_integrador/carousel_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto integrador',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const CarousselPage(),
    );
  }
}
