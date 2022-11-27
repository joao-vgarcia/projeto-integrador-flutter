// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchController on SearchControllerBase, Store {
  Computed<List<String>>? _$bookListComputed;

  @override
  List<String> get bookList =>
      (_$bookListComputed ??= Computed<List<String>>(() => super.bookList,
              name: 'SearchControllerBase.bookList'))
          .value;

  late final _$_bookListAtom =
      Atom(name: 'SearchControllerBase._bookList', context: context);

  @override
  List<String> get _bookList {
    _$_bookListAtom.reportRead();
    return super._bookList;
  }

  @override
  set _bookList(List<String> value) {
    _$_bookListAtom.reportWrite(value, super._bookList, () {
      super._bookList = value;
    });
  }

  late final _$SearchControllerBaseActionController =
      ActionController(name: 'SearchControllerBase', context: context);

  @override
  dynamic setBookList() {
    final _$actionInfo = _$SearchControllerBaseActionController.startAction(
        name: 'SearchControllerBase.setBookList');
    try {
      return super.setBookList();
    } finally {
      _$SearchControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
bookList: ${bookList}
    ''';
  }
}
