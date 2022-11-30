import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projeto_integrador/Controller/Search/search_controller.dart';
import 'package:projeto_integrador/Controller/Suggestions/suggestions_controller.dart';
import 'package:projeto_integrador/Service/api_service.dart';
import 'package:projeto_integrador/Service/local_client_service.dart';
import 'package:projeto_integrador/Service/service_locator.dart';
import 'package:projeto_integrador/View/home_page.dart';
import 'package:projeto_integrador/View/widgets/base_page.dart';
import 'package:projeto_integrador/View/widgets/button.dart';
import 'package:projeto_integrador/View/widgets/list_item.dart';

class RecomendationsPage extends StatefulWidget {
  const RecomendationsPage({super.key});

  @override
  State<RecomendationsPage> createState() => _RecomendationsPageState();
}

class _RecomendationsPageState extends State<RecomendationsPage> {
  late SuggestionsController suggestionsController;

  @override
  void initState() {
    super.initState();
    suggestionsController = SuggestionsController(locator(), locator());
    suggestionsController.recomendationList = [];
  }

  Future<void> _continuar(BuildContext context) async {
    await suggestionsController.setLocalBook();

    Widget page = HomePage();
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page),
      ((route) => false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(title: 'Recomendações', children: [
      Expanded(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Observer(
              builder: (context) => Button(
                text: 'Obter recomendações',
                action: () async => await suggestionsController.getRecomendations(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Observer(
              builder: ((context) => Expanded(
                    child: suggestionsController.recomendationList.isNotEmpty
                        ? ListView.builder(
                            itemCount: suggestionsController.recomendationList.length,
                            itemBuilder: ((context, index) {
                              return ListItem(
                                title: suggestionsController.recomendationList[index].titulo,
                                author: suggestionsController.recomendationList[index].autor,
                                thumbnail: suggestionsController.recomendationList[index].thumbnail,
                                select: () => suggestionsController.selectBook(suggestionsController.recomendationList[index]),
                                remove: () => suggestionsController.removeBook(suggestionsController.recomendationList[index]),
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
                      enabled: suggestionsController.buttonEnabled,
                    ),
                  )),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      )
    ]);
  }
}
