import 'package:mobx/mobx.dart';
import 'package:projeto_integrador/Model/book_model.dart';
import 'package:projeto_integrador/Model/local_keys.dart';
import 'package:projeto_integrador/Service/local_client_service.dart';

part 'planner_controller.g.dart';

class PlannerController = PlannerControllerBase with _$PlannerController;

abstract class PlannerControllerBase with Store {
  LocalClientService localClient;

  PlannerControllerBase(this.localClient);

  @observable
  String userName = '';

  @observable
  List<String> booksList = [];

  @observable
  List<BookModel> listOfReadingBooks = [];

  @observable
  bool hasFinishedBooks = false;

  @action
  updateFinishedBooks() {
    final book = localClient.getString(LocalKeys.finishedBooks);
    if(book != '') {
      hasFinishedBooks = true;
    }
  }

  @action
  updateUserName() {
    userName = localClient.getString(LocalKeys.userName);
  }

  @action
  List<BookModel> parseLocalBooks() {
    listOfReadingBooks = [];
    List<String> currentList = localClient.getStringList(LocalKeys.readingBooks);

    if (currentList.isNotEmpty) {
      for (var item in currentList) {
        final parsedBook = item.replaceAll('#', ',');
        String thumb = '';
        String titulo = '';
        String autor = '';
        try {
          titulo = parsedBook.split(',')[0];
          autor = parsedBook.split(',')[1];
          thumb = parsedBook.split(',')[2];
        } catch (_) {}

        listOfReadingBooks.add(BookModel(autor, titulo, thumbnail: thumb));
      }
    }

    return listOfReadingBooks;
  }

  @action
  Future<void> setLocalBook(List<BookModel> bookList) async {
    List<String> currentList = [];

    for (var book in bookList) {
      currentList.add(book.toString());
    }

    await localClient.remove(LocalKeys.readingBooks);
    await localClient.setStringList(LocalKeys.readingBooks, currentList);
  }

  @action
  Future<void> setFinishedBook(BookModel book) async {
    List<BookModel> list = parseLocalBooks();
    list.removeWhere((element) => element.titulo == book.titulo);
    try{
      await localClient.remove(LocalKeys.finishedBooks);
    } catch (_){}

    await localClient.setString(LocalKeys.finishedBooks, book.toString());

    await setLocalBook(list);
    parseLocalBooks();
  }
}
