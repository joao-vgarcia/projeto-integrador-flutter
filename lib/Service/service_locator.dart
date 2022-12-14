import 'package:get_it/get_it.dart';
import 'package:projeto_integrador/Controller/Login/login_controller.dart';
import 'package:projeto_integrador/Controller/Planner/planner_controller.dart';
import 'package:projeto_integrador/Controller/Search/search_controller.dart';
import 'package:projeto_integrador/Controller/Suggestions/suggestions_controller.dart';
import 'package:projeto_integrador/Service/api_service.dart';
import 'package:projeto_integrador/Service/local_client_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

Future<void> init() async {
  final localPref = await SharedPreferences.getInstance();

  locator.registerLazySingleton<ApiService>(() => ApiService());
  locator.registerLazySingleton<LoginController>(() => LoginController(locator()));
  locator.registerLazySingleton<PlannerController>(() => PlannerController(locator()));
  locator.registerLazySingleton<SearchController>(() => SearchController(locator(), locator()));
  locator.registerLazySingleton<SuggestionsController>(() => SuggestionsController(locator(), locator()));
  locator.registerLazySingleton<LocalClientService>(() => LocalClientService(localPref));
}