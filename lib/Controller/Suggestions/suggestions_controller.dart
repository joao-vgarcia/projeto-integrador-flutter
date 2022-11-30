import 'package:mobx/mobx.dart';
import 'package:projeto_integrador/Model/book_model.dart';
import 'package:projeto_integrador/Model/local_keys.dart';
import 'package:projeto_integrador/Service/api_service.dart';
import 'package:projeto_integrador/Service/local_client_service.dart';

part 'suggestions_controller.g.dart';

class SuggestionsController = SuggestionsControllerBase with _$SuggestionsController;

abstract class SuggestionsControllerBase with Store {
  ApiService apiService;
  LocalClientService localClient;

  SuggestionsControllerBase(this.apiService, this.localClient);

  @observable
  List<BookModel> recomendationList = [];

  @observable
  List<BookModel> selectedBooks = [];

  @observable
  bool buttonEnabled = false;

  @action
  selectBook(BookModel book) {
    selectedBooks.add(book);
    buttonEnabled = selectedBooks.isNotEmpty;
  }

  @action
  removeBook(BookModel book) {
    selectedBooks.remove(book);
    buttonEnabled = selectedBooks.isNotEmpty;
  }

  @action
  Future<void> getRecomendations() async {
    recomendationList = [];

    String lastBookString = localClient.getString(LocalKeys.finishedBooks);
    final titulo = lastBookString.split('#')[0];
    final autor = lastBookString.split('#')[1];

    recomendationList = await apiService.getRecomendations(BookModel(autor, titulo));
  }

  
  @action
  Future<void> setLocalBook() async {
    List<String> currentList = localClient.getStringList(LocalKeys.readingBooks);    

    for (var book in selectedBooks) {
      currentList.add(book.toString());
    }

    await localClient.remove(LocalKeys.readingBooks);
    await localClient.setStringList(LocalKeys.readingBooks, currentList);
  }
}
