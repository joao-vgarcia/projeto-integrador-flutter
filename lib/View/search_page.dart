import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_integrador/Controller/Search/search_controller.dart';
import 'package:projeto_integrador/Service/service_locator.dart';
import 'package:projeto_integrador/View/widgets/base_input.dart';
import 'package:projeto_integrador/View/widgets/base_page.dart';
import 'package:projeto_integrador/View/widgets/button.dart';

class SearchPage extends StatelessWidget {
  final SearchController searchController = locator<SearchController>();

  SearchPage({super.key});

  void _continuar(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
    searchController.setBookList();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(title: 'Projeto Integrador', children: [
      Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Text(
          'Que livro você busca?',
          style: GoogleFonts.libreBaskerville(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: const Color(0xFFEEEEEE),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(20),
        child: BaseInput(
          onChanged: print,
          onComplete: () => null,
          hintText: 'Nome do livro',
        ),
      ),
      Button(
        text: 'Buscar',
        action: () => _continuar(context),
      ),
      Observer(builder: ((context) =>
        Container(
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
            color: Color(0xFF1c1c1c)
          ),
          child: searchController.bookList.length > 0 
            ? ListView.builder(
              itemCount: searchController.bookList.length,
              itemBuilder: ((context, index) => 
                Text(searchController.bookList[index], style: TextStyle(color: Colors.white, fontSize: 16),)
              )
            )
            : const SizedBox.shrink()
        )
      )),
    ]);
  }
}
