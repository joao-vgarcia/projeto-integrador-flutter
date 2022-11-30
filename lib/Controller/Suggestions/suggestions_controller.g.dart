// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggestions_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SuggestionsController on SuggestionsControllerBase, Store {
  late final _$recomendationListAtom = Atom(
      name: 'SuggestionsControllerBase.recomendationList', context: context);

  @override
  List<BookModel> get recomendationList {
    _$recomendationListAtom.reportRead();
    return super.recomendationList;
  }

  @override
  set recomendationList(List<BookModel> value) {
    _$recomendationListAtom.reportWrite(value, super.recomendationList, () {
      super.recomendationList = value;
    });
  }

  late final _$selectedBooksAtom =
      Atom(name: 'SuggestionsControllerBase.selectedBooks', context: context);

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
      Atom(name: 'SuggestionsControllerBase.buttonEnabled', context: context);

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

  late final _$getRecomendationsAsyncAction = AsyncAction(
      'SuggestionsControllerBase.getRecomendations',
      context: context);

  @override
  Future<void> getRecomendations() {
    return _$getRecomendationsAsyncAction.run(() => super.getRecomendations());
  }

  late final _$setLocalBookAsyncAction =
      AsyncAction('SuggestionsControllerBase.setLocalBook', context: context);

  @override
  Future<void> setLocalBook() {
    return _$setLocalBookAsyncAction.run(() => super.setLocalBook());
  }

  late final _$SuggestionsControllerBaseActionController =
      ActionController(name: 'SuggestionsControllerBase', context: context);

  @override
  dynamic selectBook(BookModel book) {
    final _$actionInfo = _$SuggestionsControllerBaseActionController
        .startAction(name: 'SuggestionsControllerBase.selectBook');
    try {
      return super.selectBook(book);
    } finally {
      _$SuggestionsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeBook(BookModel book) {
    final _$actionInfo = _$SuggestionsControllerBaseActionController
        .startAction(name: 'SuggestionsControllerBase.removeBook');
    try {
      return super.removeBook(book);
    } finally {
      _$SuggestionsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
recomendationList: ${recomendationList},
selectedBooks: ${selectedBooks},
buttonEnabled: ${buttonEnabled}
    ''';
  }
}
