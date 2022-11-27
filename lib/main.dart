import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'package:projeto_integrador/Service/service_locator.dart' as service_locator;
import 'package:projeto_integrador/View/loading_page.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xff1B2123),
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: Color(0xff1B2123),
      systemNavigationBarDividerColor: Color(0xff1B2123)
    ),
  );
  
  await service_locator.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto integrador',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: generateMaterialColor(color: const Color(0xff1B2123)),
      ),
      home: const LoadingPage(),
    );
  }
}
