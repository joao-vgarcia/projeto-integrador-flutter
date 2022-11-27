import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_integrador/Controller/Login/login_controller.dart';
import 'package:projeto_integrador/Service/service_locator.dart';
import 'package:projeto_integrador/View/widgets/button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController loginController = locator<LoginController>();

  void _continuar(BuildContext context) {
    loginController.updateUsername(loginController.name);
    // const Widget page = loginController.isUserLogged() ? const LoginPage() : const CarousselPage();
    // const Widget page = CarousselPage();
    // Navigator.of(context).pushAndRemoveUntil(
    //   MaterialPageRoute(builder: (context) => page),
    //   ((route) => false),
    // );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSizes = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Projeto Integrador - Login',
            style: GoogleFonts.libreBaskerville(
              color: Colors.white,
              fontWeight: FontWeight.w700,
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
              Color(0xff1B2123),
              Color(0xFF202528),
              Color.fromARGB(255, 59, 66, 68),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
            child: TextField(
              onChanged: loginController.setName,
              onEditingComplete: () => _continuar(context),
              decoration: InputDecoration(
                hintText: 'Digite seu nome',
                hintStyle: GoogleFonts.libreBaskerville(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 18,
                ),
                contentPadding: const EdgeInsets.only(left: 30),
                filled: true,
                fillColor: const Color(0xFF464646),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))
              ),
              style: GoogleFonts.libreBaskerville(
                color: Colors.white,
                fontSize: 18,
              ),
              autofocus: true,
              autocorrect: true,
              enableSuggestions: true,
              cursorColor: Colors.white,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.done,
              textCapitalization: TextCapitalization.words,
            ),
          ),
          Button(text: 'Entrar', action: () => _continuar(context))
        ]),
      ),
    );
  }
}
