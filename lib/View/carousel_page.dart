import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_integrador/View/login_page.dart';
import 'package:projeto_integrador/View/widgets/base_page.dart';
import 'package:projeto_integrador/View/widgets/button.dart';

class CarousselPage extends StatefulWidget {
  const CarousselPage({super.key});

  @override
  State<CarousselPage> createState() => _CarousselPageState();
}

class _CarousselPageState extends State<CarousselPage> {
  bool botaoHabilitado = false;

  final List<AssetImage> images = [
    const AssetImage('assets/images/img1.jpg'),
    const AssetImage('assets/images/img2.jpg'),
    const AssetImage('assets/images/img3.jpg'),
    const AssetImage('assets/images/img4.jpg'),
  ];

  final List<String> texts = [
    'Escolha seus livros prediletos',
    'Busque por novos livros',
    'Mantenha o histórico de leitura',
    'Receba recomendações de leitura personalizadas',
  ];

  void habilitarBotao(int pageNumber) {
    if (pageNumber == 3) {
      setState(() {
        botaoHabilitado = true;
      });
    }
  }

  void _continuar(BuildContext context) {
    // const Widget page = loginController.isUserLogged() ? const LoginPage() : const CarousselPage();
    const Widget page = LoginPage();
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
          padding: const EdgeInsets.only(top: 20),
          child: CarouselSlider(
            options: CarouselOptions(
              height: screenSizes.height - 300,
              enlargeCenterPage: true,
              initialPage: 0,
              enableInfiniteScroll: false,
              onPageChanged: ((index, reason) => habilitarBotao(index)),
            ),
            items: [0, 1, 2, 3].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      image: DecorationImage(image: images[i], fit: BoxFit.cover, opacity: 0.5),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x99111111),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(4, 7),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Container(
                        width: screenSizes.width,
                        alignment: Alignment.center,
                        child: Text(
                          texts[i],
                          textAlign: TextAlign.center,
                          style: GoogleFonts.libreBaskerville(
                            fontSize: 22,
                            color: const Color(0xFFEEEEEE),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
        botaoHabilitado
            ? Padding(
                padding: EdgeInsets.only(top: (screenSizes.height / 100) * 3),
                child: Button(
                  action: () => _continuar(context),
                  text: 'Continuar',
                ))
            : const SizedBox.shrink()
      ],
    );
  }
}
