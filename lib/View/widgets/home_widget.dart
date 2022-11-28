import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_integrador/Controller/Login/login_controller.dart';
import 'package:projeto_integrador/Controller/Planner/planner_controller.dart';
import 'package:projeto_integrador/View/widgets/base_input.dart';
import 'package:projeto_integrador/View/widgets/button.dart';
import 'package:projeto_integrador/View/widgets/planner_list.dart';

class HomeWidget extends StatefulWidget {
  final PlannerController plannerController;
  final LoginController loginController;

  const HomeWidget({
    super.key,
    required this.plannerController,
    required this.loginController,
  });

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  void initState() {
    super.initState();
    widget.plannerController.parseLocalBooks();
  }

  _showNameModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF202528),
      elevation: 40,
      builder: (context) => Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20),
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
              onChanged: widget.loginController.setName,
              onComplete: widget.loginController.updateUsername,
              hintText: 'Nome',
            ),
          ),
          Button(
            text: 'Pronto',
            action: () {
              widget.loginController.updateUsername();
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Olá, ${widget.plannerController.userName}!',
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
                decoration: BoxDecoration(color: const Color.fromARGB(255, 59, 66, 68), borderRadius: BorderRadius.circular(10)),
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
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
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
              builder: ((context) => widget.plannerController.listOfReadingBooks.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: widget.plannerController.listOfReadingBooks.length,
                        itemBuilder: ((context, index) {
                          return PlannerItem(
                            title: widget.plannerController.listOfReadingBooks[index].titulo,
                            author: widget.plannerController.listOfReadingBooks[index].titulo,
                            select: () => print('select'),
                            remove: () => print('remove'),
                          );
                        }),
                      ),
                    )
                  : SizedBox.shrink())),
        ],
      ),
    );
  }
}
