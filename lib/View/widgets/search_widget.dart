import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_integrador/Controller/Search/search_controller.dart';
import 'package:projeto_integrador/Service/api_service.dart';
import 'package:projeto_integrador/Service/local_client_service.dart';
import 'package:projeto_integrador/Service/service_locator.dart';
import 'package:projeto_integrador/View/home_page.dart';
import 'package:projeto_integrador/View/widgets/base_input.dart';
import 'package:projeto_integrador/View/widgets/button.dart';
import 'package:projeto_integrador/View/widgets/list_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchWidget extends StatefulWidget {
  final bool fromHome;
  const SearchWidget({Key? key, required this.fromHome}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  late SearchController searchController;

  @override
  void initState() {
    super.initState();
    searchController = SearchController(locator<ApiService>(), locator<LocalClientService>());
  }

  Future<void> _buscar(BuildContext context) async {
    FocusManager.instance.primaryFocus?.unfocus();
    await searchController.getBooks();
  }

  Future<void> _continuar(BuildContext context) async {
    await searchController.setLocalBook();
    if (!widget.fromHome) {
      Widget page = HomePage();
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => page),
        ((route) => false),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
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
            action: () => _buscar(context),
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
                              select: () => searchController.selectBook(searchController.bookList[index]),
                              remove: () => searchController.removeBook(searchController.bookList[index]),
                            );
                          }))
                      : const SizedBox.shrink(),
                )),
          ),
          Observer(
            builder: ((context) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Button(
                    text: 'Pronto',
                    action: () => _continuar(context),
                    enabled: searchController.buttonEnabled,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
