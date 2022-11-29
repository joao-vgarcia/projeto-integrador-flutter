import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_integrador/Controller/Login/login_controller.dart';
import 'package:projeto_integrador/Controller/Planner/planner_controller.dart';
import 'package:projeto_integrador/Controller/Search/search_controller.dart';
import 'package:projeto_integrador/Service/service_locator.dart';
import 'package:projeto_integrador/View/widgets/home_widget.dart';
import 'package:projeto_integrador/View/widgets/search_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final SearchController searchController = locator<SearchController>();
  final PlannerController plannerController = locator<PlannerController>();
  final LoginController loginController = locator<LoginController>();

  @override
  Widget build(BuildContext context) {
    final Size screenSizes = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicatorColor: const Color(0xff24abb9),
            indicatorWeight: 4,
            indicatorSize: TabBarIndicatorSize.tab,
            unselectedLabelColor: const Color(0xFFAAAAAA),
            labelColor: const Color(0xff24abb9),
            tabs: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: Text(
                  'Meus Livros',
                  style: GoogleFonts.libreBaskerville(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: Text(
                  'Buscar',
                  style: GoogleFonts.libreBaskerville(),
                ),
              ),
            ],
          ),
          title: Center(
            child: Text(
              'Projeto Integrador',
              style: GoogleFonts.libreBaskerville(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Container(
          width: screenSizes.width,
          height: screenSizes.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff1B2123),
                Color(0xFF202528),
                Color.fromARGB(255, 59, 66, 68),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: const TabBarView(children: [
            HomeWidget(),
            SearchWidget(fromHome: true)
          ]),
        ),
      ),
    );
  }
}
