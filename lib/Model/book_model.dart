class BookModel {
  final String autor;
  final String titulo;
  final String? thumbnail;
  
  BookModel(this.autor, this.titulo, {this.thumbnail});

  // BookModel.fromJson(Map<String, dynamic> json)
  //   : autor = json['volumeInfo']['authors'],
  //     titulo = json['volumeInfo']['title'],
  //     thumbnail = json['volumeInfo']['imageLinks']['smallThumbnail'];
}