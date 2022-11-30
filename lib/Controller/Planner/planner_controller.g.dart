// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planner_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PlannerController on PlannerControllerBase, Store {
  late final _$userNameAtom =
      Atom(name: 'PlannerControllerBase.userName', context: context);

  @override
  String get userName {
    _$userNameAtom.reportRead();
    return super.userName;
  }

  @override
  set userName(String value) {
    _$userNameAtom.reportWrite(value, super.userName, () {
      super.userName = value;
    });
  }

  late final _$booksListAtom =
      Atom(name: 'PlannerControllerBase.booksList', context: context);

  @override
  List<String> get booksList {
    _$booksListAtom.reportRead();
    return super.booksList;
  }

  @override
  set booksList(List<String> value) {
    _$booksListAtom.reportWrite(value, super.booksList, () {
      super.booksList = value;
    });
  }

  late final _$listOfReadingBooksAtom =
      Atom(name: 'PlannerControllerBase.listOfReadingBooks', context: context);

  @override
  List<BookModel> get listOfReadingBooks {
    _$listOfReadingBooksAtom.reportRead();
    return super.listOfReadingBooks;
  }

  @override
  set listOfReadingBooks(List<BookModel> value) {
    _$listOfReadingBooksAtom.reportWrite(value, super.listOfReadingBooks, () {
      super.listOfReadingBooks = value;
    });
  }

  late final _$hasFinishedBooksAtom =
      Atom(name: 'PlannerControllerBase.hasFinishedBooks', context: context);

  @override
  bool get hasFinishedBooks {
    _$hasFinishedBooksAtom.reportRead();
    return super.hasFinishedBooks;
  }

  @override
  set hasFinishedBooks(bool value) {
    _$hasFinishedBooksAtom.reportWrite(value, super.hasFinishedBooks, () {
      super.hasFinishedBooks = value;
    });
  }

  late final _$setLocalBookAsyncAction =
      AsyncAction('PlannerControllerBase.setLocalBook', context: context);

  @override
  Future<void> setLocalBook(List<BookModel> bookList) {
    return _$setLocalBookAsyncAction.run(() => super.setLocalBook(bookList));
  }

  late final _$setFinishedBookAsyncAction =
      AsyncAction('PlannerControllerBase.setFinishedBook', context: context);

  @override
  Future<void> setFinishedBook(BookModel book) {
    return _$setFinishedBookAsyncAction.run(() => super.setFinishedBook(book));
  }

  late final _$PlannerControllerBaseActionController =
      ActionController(name: 'PlannerControllerBase', context: context);

  @override
  dynamic updateFinishedBooks() {
    final _$actionInfo = _$PlannerControllerBaseActionController.startAction(
        name: 'PlannerControllerBase.updateFinishedBooks');
    try {
      return super.updateFinishedBooks();
    } finally {
      _$PlannerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateUserName() {
    final _$actionInfo = _$PlannerControllerBaseActionController.startAction(
        name: 'PlannerControllerBase.updateUserName');
    try {
      return super.updateUserName();
    } finally {
      _$PlannerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<BookModel> parseLocalBooks() {
    final _$actionInfo = _$PlannerControllerBaseActionController.startAction(
        name: 'PlannerControllerBase.parseLocalBooks');
    try {
      return super.parseLocalBooks();
    } finally {
      _$PlannerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userName: ${userName},
booksList: ${booksList},
listOfReadingBooks: ${listOfReadingBooks},
hasFinishedBooks: ${hasFinishedBooks}
    ''';
  }
}
