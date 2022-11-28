import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_integrador/Controller/Search/search_controller.dart';
import 'package:projeto_integrador/Service/service_locator.dart';
import 'package:projeto_integrador/View/widgets/base_input.dart';
import 'package:projeto_integrador/View/widgets/base_page.dart';
import 'package:projeto_integrador/View/widgets/button.dart';
import 'package:projeto_integrador/View/widgets/list_item.dart';

class SearchPage extends StatelessWidget {
  final SearchController searchController = locator<SearchController>();

  SearchPage({super.key});

  Future<void> _continuar(BuildContext context) async {
    FocusManager.instance.primaryFocus?.unfocus();
    await searchController.getBooks();
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
          onChanged: searchController.setBookName,
          onComplete: () => searchController.getBooks(),
          hintText: 'Nome do livro',
        ),
      ),
      Button(
        text: 'Buscar',
        action: () => _continuar(context),
      ),
      const SizedBox(
        height: 20,
      ),
      Observer(
        builder: ((context) => Expanded(
              child: searchController.bookList.isNotEmpty
                  ? ListView.builder(
                      itemCount: searchController.bookList.length,
                      itemBuilder: ((context, index) {
                        return ListItem(
                          title: searchController.bookList[index].titulo,
                          author: searchController.bookList[index].autor,
                          thumbnail: searchController.bookList[index].thumbnail,
                          onSelect: () => print('1'),
                        );
                      }))
                  : const SizedBox.shrink(),
            )),
      ),

      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Button(
          text: 'Pronto',
          action: () => _continuar(context),
          enabled: false,
        ),
      ),
      
    ]);
  }
}
