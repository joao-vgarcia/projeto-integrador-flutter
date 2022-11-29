import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_integrador/Controller/Login/login_controller.dart';
import 'package:projeto_integrador/Controller/Planner/planner_controller.dart';
import 'package:projeto_integrador/Model/book_model.dart';
import 'package:projeto_integrador/Service/local_client_service.dart';
import 'package:projeto_integrador/Service/service_locator.dart';
import 'package:projeto_integrador/View/widgets/base_input.dart';
import 'package:projeto_integrador/View/widgets/button.dart';
import 'package:projeto_integrador/View/widgets/planner_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeWidget extends StatefulWidget {

  const HomeWidget({
    super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late PlannerController plannerController;
  late LoginController loginController;

  @override
  void initState() {
    super.initState();
    plannerController = PlannerController(locator<LocalClientService>());
    plannerController.parseLocalBooks();
    loginController = LoginController(locator<LocalClientService>());
  }

  _showNameModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF202528),
      elevation: 40,
      builder: (context) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              'Alterar o nome de usuário',
              textAlign: TextAlign.center,
              style: GoogleFonts.libreBaskerville(
                fontSize: 22,
                color: const Color(0xFFEEEEEE),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: BaseInput(
              onChanged: loginController.setName,
              onComplete: loginController.updateUsername,
              hintText: 'Nome',
            ),
          ),
          Button(
            text: 'Pronto',
            action: () async {
              Navigator.pop(context);
              await loginController.updateUsername();
            },
          )
        ],
      ),
    );
  }

  _showFinishedModal(BuildContext context, BookModel book) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF202528),
      elevation: 40,
      builder: (context) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
            child: Text(
              'Já terminou este livro?',
              textAlign: TextAlign.center,
              style: GoogleFonts.libreBaskerville(
                fontSize: 22,
                color: const Color(0xFFEEEEEE),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
            child: Text(
              book.titulo,
              textAlign: TextAlign.center,
              style: GoogleFonts.libreBaskerville(
                fontSize: 18,
                color: const Color(0xFFEEEEEE),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 30, right: 30),
            child: Text(
              'Escrito por: ${book.autor}',
              textAlign: TextAlign.left,
              style: GoogleFonts.libreBaskerville(
                fontSize: 12,
                color: const Color(0xFFEEEEEE),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
            child: Text(
              'Ao concluir, removeremos o livro da sua lista e você terá novas recomendações.',
              textAlign: TextAlign.left,
              style: GoogleFonts.libreBaskerville(
                fontSize: 14,
                color: const Color(0xFFEEEEEE),
                fontWeight: FontWeight.w400,
                height: 1.3,
                
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Button(
                width: 90,
                text: 'Cancelar',
                outlined: true,
                action: () {
                  Navigator.pop(context);
                },
              ),
              Button(
                text: 'Terminar leitura',
                action: () async {
                  await plannerController.setFinishedBook(book);
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                },
              )

            ],),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Olá, ${plannerController.userName}!',
                textAlign: TextAlign.center,
                style: GoogleFonts.libreBaskerville(
                  fontSize: 20,
                  color: const Color(0xFFEEEEEE),
                  fontWeight: FontWeight.w700,
                ),
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 59, 66, 68),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GestureDetector(
                  onTap: () => _showNameModal(context),
                  child: const Icon(
                    Icons.edit,
                    color: Color(0xff24abb9),
                    size: 20,
                  ),
                ),
              )
            ],
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20, left: 30),
              child: Text(
                'Lista de leitura:',
                textAlign: TextAlign.center,
                style: GoogleFonts.libreBaskerville(
                  fontSize: 18,
                  color: const Color(0xFFEEEEEE),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        Observer(
            builder: ((context) => plannerController.listOfReadingBooks.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: plannerController.listOfReadingBooks.length,
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          onTap: () => _showFinishedModal(context, plannerController.listOfReadingBooks[index]),
                          child: PlannerItem(
                            title: plannerController.listOfReadingBooks[index].titulo,
                            author: plannerController.listOfReadingBooks[index].autor,
                          ),
                        );
                      }),
                    ),
                  )
                : const SizedBox.shrink())),
      ],
    );
  }
}
