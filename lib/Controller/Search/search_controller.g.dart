// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchController on SearchControllerBase, Store {
  Computed<List<BookModel>>? _$bookListComputed;

  @override
  List<BookModel> get bookList =>
      (_$bookListComputed ??= Computed<List<BookModel>>(() => super.bookList,
              name: 'SearchControllerBase.bookList'))
          .value;

  late final _$_bookNameAtom =
      Atom(name: 'SearchControllerBase._bookName', context: context);

  @override
  String get _bookName {
    _$_bookNameAtom.reportRead();
    return super._bookName;
  }

  @override
  set _bookName(String value) {
    _$_bookNameAtom.reportWrite(value, super._bookName, () {
      super._bookName = value;
    });
  }

  late final _$_bookListAtom =
      Atom(name: 'SearchControllerBase._bookList', context: context);

  @override
  List<BookModel> get _bookList {
    _$_bookListAtom.reportRead();
    return super._bookList;
  }

  @override
  set _bookList(List<BookModel> value) {
    _$_bookListAtom.reportWrite(value, super._bookList, () {
      super._bookList = value;
    });
  }

  late final _$selectedBooksAtom =
      Atom(name: 'SearchControllerBase.selectedBooks', context: context);

  @override
  List<BookModel> get selectedBooks {
    _$selectedBooksAtom.reportRead();
    return super.selectedBooks;
  }

  @override
  set selectedBooks(List<BookModel> value) {
    _$selectedBooksAtom.reportWrite(value, super.selectedBooks, () {
      super.selectedBooks = value;
    });
  }

  late final _$buttonEnabledAtom =
      Atom(name: 'SearchControllerBase.buttonEnabled', context: context);

  @override
  bool get buttonEnabled {
    _$buttonEnabledAtom.reportRead();
    return super.buttonEnabled;
  }

  @override
  set buttonEnabled(bool value) {
    _$buttonEnabledAtom.reportWrite(value, super.buttonEnabled, () {
      super.buttonEnabled = value;
    });
  }

  late final _$getBooksAsyncAction =
      AsyncAction('SearchControllerBase.getBooks', context: context);

  @override
  Future<dynamic> getBooks() {
    return _$getBooksAsyncAction.run(() => super.getBooks());
  }

  late final _$setLocalBookAsyncAction =
      AsyncAction('SearchControllerBase.setLocalBook', context: context);

  @override
  Future<void> setLocalBook() {
    return _$setLocalBookAsyncAction.run(() => super.setLocalBook());
  }

  late final _$SearchControllerBaseActionController =
      ActionController(name: 'SearchControllerBase', context: context);

  @override
  dynamic setBookName(String value) {
    final _$actionInfo = _$SearchControllerBaseActionController.startAction(
        name: 'SearchControllerBase.setBookName');
    try {
      return super.setBookName(value);
    } finally {
      _$SearchControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic selectBook(BookModel book) {
    final _$actionInfo = _$SearchControllerBaseActionController.startAction(
        name: 'SearchControllerBase.selectBook');
    try {
      return super.selectBook(book);
    } finally {
      _$SearchControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeBook(BookModel book) {
    final _$actionInfo = _$SearchControllerBaseActionController.startAction(
        name: 'SearchControllerBase.removeBook');
    try {
      return super.removeBook(book);
    } finally {
      _$SearchControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedBooks: ${selectedBooks},
buttonEnabled: ${buttonEnabled},
bookList: ${bookList}
    ''';
  }
}
