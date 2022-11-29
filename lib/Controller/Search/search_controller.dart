import 'package:mobx/mobx.dart';
import 'package:projeto_integrador/Model/book_model.dart';
import 'package:projeto_integrador/Model/local_keys.dart';
import 'package:projeto_integrador/Service/api_service.dart';
import 'package:projeto_integrador/Service/local_client_service.dart';

part 'search_controller.g.dart';

class SearchController = SearchControllerBase with _$SearchController;

abstract class SearchControllerBase with Store {
  ApiService service;
  LocalClientService localClient;

  SearchControllerBase(this.service, this.localClient);

  @observable
  String _bookName = '';

  @observable
  List<BookModel> _bookList = [];

  @observable
  List<BookModel> selectedBooks = [];

  @observable
  bool buttonEnabled = false;

  @computed
  List<BookModel> get bookList => _bookList;

  @action
  setBookName(String value) => _bookName = value;

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
  Future getBooks() async {
    _bookList = await service.getBooks(_bookName);
  }

  @action
  Future<void> setLocalBook() async {
    List<String> currentList = localClient.getStringList(LocalKeys.readingBooks);
    print(currentList);
    for (var book in selectedBooks) {
      currentList.add(book.toString());
    }

    await localClient.remove(LocalKeys.readingBooks);
    await localClient.setStringList(LocalKeys.readingBooks, currentList);
  }
}
