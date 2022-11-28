import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:projeto_integrador/Model/book_model.dart';

class ApiService {
  Dio dio = Dio();
  static String basePath = 'https://www.googleapis.com/books/v1/volumes';

  Future<List<BookModel>> getBooks(String name) async {
    List<BookModel> bookList = [];
    final searchTerm = name.replaceAll(' ', '+');

    final res = await dio.get(basePath, queryParameters: {
      'langRestrict': 'pt',
      'q': searchTerm
    });

    final jsonList = res.data['items'] as List;
    final books = jsonList.map((e) => e['volumeInfo'] ?? '');
    for (var book in books) {
      final title = book['title'];
      final autor = book['authors'].toString().replaceAll('[', '').replaceAll(']', '');
      String thumb = '';

      try{
        thumb = book['imageLinks']['smallThumbnail'];
      } catch (_) {}

      bookList.add(BookModel(autor, title, thumbnail: thumb));
    }
    
    return bookList;
  }
  
  Future<List<BookModel>> getRecomendations(String name) async {
    List<BookModel> bookList = [];
    final searchTerm = name.replaceAll(' ', '+');

    final res = await dio.get(basePath, queryParameters: {
      'langRestrict': 'pt',
      'q': searchTerm
    });

    final jsonList = res.data['items'] as List;
    final books = jsonList.map((e) => e['volumeInfo'] ?? '');
    for (var book in books) {
      final title = book['title'];
      final autor = book['authors'].toString().replaceAll('[', '').replaceAll(']', '');
      String thumb = '';

      try{
        thumb = book['imageLinks']['smallThumbnail'];
      } catch (_) {}

      bookList.add(BookModel(autor, title, thumbnail: thumb));
    }
    
    return bookList;
  }
}
