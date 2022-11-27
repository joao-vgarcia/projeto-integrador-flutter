import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:projeto_integrador/Controller/Login/login_controller.dart';
import 'package:projeto_integrador/Service/service_locator.dart';
import 'package:projeto_integrador/View/carousel_page.dart';
import 'package:projeto_integrador/View/widgets/base_page.dart';
import 'package:projeto_integrador/View/widgets/button.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> with TickerProviderStateMixin {
  late AnimationController controller;
  bool carregando = true;
  final LoginController loginController = locator<LoginController>();

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2300),
    )..addListener(() {
        setState(() {});
      });

    controller.forward();

    Future.delayed(
      const Duration(seconds: 3),
      (() => {
            setState(
              () {
                carregando = false;
              },
            )
          }),
    );

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _continuar(BuildContext context) {
    // const Widget page = loginController.isUserLogged() ? const LoginPage() : const CarousselPage();
    const Widget page = CarousselPage();
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page),
      ((route) => false),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSizes = MediaQuery.of(context).size;

    return BasePage(
      title: 'Projeto Integrador',
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(
            'Nós não armazenamos seus dados!\nPortanto não desinstale o app, caso contrário você perderá todos seus dados de leitura e recomendações!',
            style: GoogleFonts.libreBaskerville(
              color: const Color(0xFFEEEEEE),
              fontSize: 18,
              height: 1.8,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          width: screenSizes.width,
          height: (screenSizes.height / 100) * 30,
          child: Lottie.asset('assets/lottie/book.json', repeat: false),
        ),
        carregando
            ? CircularProgressIndicator(
                color: const Color(0xff24abb9),
                value: controller.value,
              )
            : Padding(
                padding: EdgeInsets.only(top: (screenSizes.height / 100) * 1),
                child: Button(
                  action: () => _continuar(context),
                  text: 'Continuar',
                ),
              ),
      ],
    );
  }
}
