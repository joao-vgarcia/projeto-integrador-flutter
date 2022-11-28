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
  List<BookModel> _selectedBooks = [];

  @observable
  bool buttonEnabled = false;

  @computed
  List<BookModel> get bookList => _bookList;

  @action
  setBookName(String value) => _bookName = value;

  @action
  selectBook(BookModel book) {
    _selectedBooks.add(book);
    buttonEnabled = _selectedBooks.isNotEmpty;
    print(_selectedBooks);
  }

  @action
  removeBook(BookModel book) {
    _selectedBooks.remove(book);
    buttonEnabled = _selectedBooks.isNotEmpty;
    print(_selectedBooks);
  }

  @action
  Future getBooks() async {
    _bookList = await service.getBooks(_bookName);
  }

  @action
  setLocalBook() {
    List<String> currentList = localClient.getStringList(LocalKeys.readingBooks);

    for (var book in _selectedBooks) {
      currentList.add(book.toString());
    }

    localClient.setStringList(LocalKeys.readingBooks, currentList);

    currentList = localClient.getStringList(LocalKeys.readingBooks);
    print(currentList);
  }

  @action
  removeLocalBook(BookModel book) {
    List<String> currentList = localClient.getStringList(LocalKeys.readingBooks);
    currentList.remove(book.toString());
  }
}
