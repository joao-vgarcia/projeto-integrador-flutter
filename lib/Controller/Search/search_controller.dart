import 'package:mobx/mobx.dart';
import 'package:projeto_integrador/Model/book_model.dart';
import 'package:projeto_integrador/Service/api_service.dart';

part 'search_controller.g.dart';

class SearchController = SearchControllerBase with _$SearchController;

abstract class SearchControllerBase with Store {
  ApiService service;

  SearchControllerBase(this.service);

  @observable
  String _bookName = '';

  @observable
  List<BookModel> _bookList = [];

  @computed
  List<BookModel> get bookList => _bookList;

  @action
  setBookName(String value) => _bookName = value;

  @action
  Future getBooks() async {
    _bookList = await service.getBooks(_bookName);
    print(_bookList);
  }
}
