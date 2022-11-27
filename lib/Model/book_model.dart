class BookModel {
  final String autor;
  final String titulo;
  
  BookModel(this.autor, this.titulo);

  BookModel.fromJson(Map<String, dynamic> json)
    : autor = json[''],
      titulo = json[''];
}