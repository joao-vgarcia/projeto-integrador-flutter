import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_integrador/Controller/Login/login_controller.dart';
import 'package:projeto_integrador/Service/service_locator.dart';
import 'package:projeto_integrador/View/search_page.dart';
import 'package:projeto_integrador/View/widgets/base_input.dart';
import 'package:projeto_integrador/View/widgets/base_page.dart';
import 'package:projeto_integrador/View/widgets/button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController loginController = locator<LoginController>();

  void _continuar(BuildContext context) {
    loginController.updateUsername();
    Widget page = SearchPage();
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page),
      ((route) => false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'Projeto Integrador - Login',
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 40),
          child: BaseInput(
            hintText: 'Digite seu nome',
            onChanged: loginController.setName,
            onComplete: () => _continuar(context),
          )
        ),
        Button(text: 'Entrar', action: () => _continuar(context))
      ],
    );
  }
}
