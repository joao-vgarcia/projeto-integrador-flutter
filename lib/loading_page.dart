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
              Color(0x9928313b),
              Color(0xaa28313b),
              Color(0xbb28313b),
              Color(0xcc28313b),
              Color(0xdd28313b),
              Color(0xee28313b),
              Color(0xff28313b),
              Color(0x99485461),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )
          // color: Color(0xff1c1c1c),
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                'Nós não armazenamos seus dados!\nPortanto não desinstale o app, caso contrário você perderá todos seus dados de leitura e recomendações!',
                style: TextStyle(
                  color: Color(0xffAFC6D9),
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
                color: const Color(0xff00A8E8),
                value: controller.value,
              )
              : Padding(
                padding: EdgeInsets.only(top: (screenSizes.height / 100) * 1),
                child: OutlinedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(Color(0xff00A8E8),),
                    minimumSize: MaterialStatePropertyAll<Size>(Size(250, 60)),
                    maximumSize: MaterialStatePropertyAll<Size>(Size(350, 60)),
                  ),
                  child: const Text(
                    'Entrar', 
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ), 
                  onPressed: () => _continuar(context),
                ),
              ),
          ],
        ),
      ),
    );
  }
}