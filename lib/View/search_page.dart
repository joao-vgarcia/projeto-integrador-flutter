import 'package:flutter/material.dart';

import 'package:projeto_integrador/Controller/Search/search_controller.dart';
import 'package:projeto_integrador/Service/service_locator.dart';

import 'package:projeto_integrador/View/widgets/base_page.dart';

import 'package:projeto_integrador/View/widgets/search_widget.dart';

class SearchPage extends StatelessWidget {
  final SearchController searchController = locator<SearchController>();

  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BasePage(title: 'Projeto Integrador', children: [ SearchWidget(fromHome: false)]);
  }
}
