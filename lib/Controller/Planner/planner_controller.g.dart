// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planner_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PlannerController on PlannerControllerBase, Store {
  Computed<String>? _$userNameComputed;

  @override
  String get userName =>
      (_$userNameComputed ??= Computed<String>(() => super.userName,
              name: 'PlannerControllerBase.userName'))
          .value;

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

  late final _$PlannerControllerBaseActionController =
      ActionController(name: 'PlannerControllerBase', context: context);

  @override
  dynamic setLocalBook(BookModel book) {
    final _$actionInfo = _$PlannerControllerBaseActionController.startAction(
        name: 'PlannerControllerBase.setLocalBook');
    try {
      return super.setLocalBook(book);
    } finally {
      _$PlannerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeLocalBook(BookModel book) {
    final _$actionInfo = _$PlannerControllerBaseActionController.startAction(
        name: 'PlannerControllerBase.removeLocalBook');
    try {
      return super.removeLocalBook(book);
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
booksList: ${booksList},
listOfReadingBooks: ${listOfReadingBooks},
userName: ${userName}
    ''';
  }
}
