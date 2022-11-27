import 'package:mobx/mobx.dart';

part 'search_controller.g.dart';

class SearchController = SearchControllerBase with _$SearchController;

abstract class SearchControllerBase with Store {
  final List<String> lista = ['livro 1', 'livro 1', 'livro 1', 'livro 1', 'livro 1','livro 1','livro 1','livro 1'];

  @observable
  List<String> _bookList = [];

  @computed
  List<String> get bookList => _bookList;

  @action
  setBookList() {
    _bookList = lista;
  }
}