import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

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
    'Receba recomendações de leitura personalizadas'
  ];

  void habilitarBotao(int pageNumber) {
    if(pageNumber == 3) {
      setState(() {
        botaoHabilitado = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 50, bottom: 30),
            child: Text(
              'Projeto integrador', 
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),      
          CarouselSlider(
            options: CarouselOptions(
              height: 400.0,
              initialPage: 0,
              enableInfiniteScroll: false,
              onPageChanged: ((index, reason) => habilitarBotao(index))
            ),
            items: [0, 1, 2, 3].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: images[i],
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child:
                          Text(
                            texts[i], 
                            style: const TextStyle(
                              fontSize: 16.0,
                              backgroundColor: Color(0x88FFFFFF)
                            ),
                          ),
                      )
                  );
                },
              );
            }).toList(),
          ),
          OutlinedButton(
            style: ButtonStyle(
              backgroundColor: botaoHabilitado ? const MaterialStatePropertyAll<Color>(Color(0xff120a8f)) : const MaterialStatePropertyAll<Color>(Color(0xfffffffff)),
            ),
            child: Text(botaoHabilitado ? 'Entrar' : ''), 
            onPressed: () => botaoHabilitado ? print('pode seguir para proxima tela') : null,
          )
        ],
      ),
    );
  }
}