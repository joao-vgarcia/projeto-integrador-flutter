import 'package:flutter/material.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'package:projeto_integrador/loading_page.dart';

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
        primarySwatch: generateMaterialColor(color:const Color(0xff00A8E8)),
      ),
      home: const LoadingPage(),
    );
  }
}
