import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:projeto_integrador/carousel_page.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> with TickerProviderStateMixin {
  late AnimationController controller;
  bool carregando = true;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2300),
    )..addListener(() {
      setState(() {});
    });

    controller.forward();

    Future.delayed(const Duration(seconds: 3), (() => {
      setState(() {
        carregando = false;
      })
    }));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _continuar(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const CarousselPage()
      ), 
      ((route) => false)
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSizes = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Projeto Integrador', 
            style: TextStyle(
              color: Colors.white, 
              fontWeight: FontWeight.w700
            ),
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      body: Container(
        width: screenSizes.width,
        height: screenSizes.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff003A6B),
              Color(0xff2C5D87),
              Color(0xff5880A2),
              Color(0xff83A3BE),
              Color(0xffAFC6D9),
              Color(0xffDBE9F5),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter
          )
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                'Nós não armazenamos seus dados!\nPortanto não desinstale o app, caso contrário você perderá todos seus dados de leitura e recomendações!',
                style: TextStyle(
                  color: Color.fromARGB(255, 22, 22, 22),
                  fontSize: 18,
                  height: 1.8
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: screenSizes.width,
              height: (screenSizes.height / 100) * 30,
              child: Lottie.asset(
                'assets/lottie/book.json',
                repeat: false
              ),
            ),
            carregando 
              ? CircularProgressIndicator(
                color: const Color(0xff120a8f),
                value: controller.value,
              )
              : Padding(
                padding: EdgeInsets.only(top: (screenSizes.height / 100) * 1),
                child: OutlinedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(Color(0xff120a8f)),
                    minimumSize: MaterialStatePropertyAll<Size>(Size(250, 40)),
                    maximumSize: MaterialStatePropertyAll<Size>(Size(350, 40)),
                  ),
                  child: const Text('Continuar', style: TextStyle(color: Colors.white),), 
                  onPressed: () => _continuar(context),
                ),
              ),
          ],
        ),
      ),
    );
  }
}