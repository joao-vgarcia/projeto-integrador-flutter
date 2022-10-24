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
    Size screenSizes = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Projeto Integrador', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),)),
      ),
      backgroundColor: Colors.transparent,
      body: Container(
        width: screenSizes.width,
        height: screenSizes.height,
        decoration: BoxDecoration(
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
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: CarouselSlider(
              options: CarouselOptions(
                height: screenSizes.height - 300,
                enlargeCenterPage: true,
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
                            Container(
                              width: screenSizes.width,
                              height: 70,
                              decoration: BoxDecoration(color: Colors.white),
                              alignment: Alignment.center,
                              child: Text(
                                texts[i], 
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  backgroundColor: Color(0xffFFFFFF),
                                  color: Color(0xffff003A6B)
                                ),
                              ),
                            ),
                        )
                    );
                  },
                );
              }).toList(),
            ),
          ),
          botaoHabilitado 
          ? Padding(
            padding: EdgeInsets.only(top: (screenSizes.height / 100) * 3),
            child: OutlinedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Color.fromARGB(255, 6, 1, 82)),
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
              onPressed: () => print('pode seguir para proxima tela'),
            ),
          )
          : const SizedBox.shrink()
        ],
      ),
    ),);
  }
}