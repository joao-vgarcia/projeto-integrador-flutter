import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_integrador/Controller/Search/search_controller.dart';
import 'package:projeto_integrador/Service/service_locator.dart';
import 'package:projeto_integrador/View/home_page.dart';
import 'package:projeto_integrador/View/widgets/base_input.dart';
import 'package:projeto_integrador/View/widgets/base_page.dart';
import 'package:projeto_integrador/View/widgets/button.dart';
import 'package:projeto_integrador/View/widgets/list_item.dart';
import 'package:projeto_integrador/View/widgets/search_widget.dart';

class SearchPage extends StatelessWidget {
  final SearchController searchController = locator<SearchController>();

  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(title: 'Projeto Integrador', children: [
      SearchWidget(searchController: searchController, fromHome: false)
    ]);
  }
}
