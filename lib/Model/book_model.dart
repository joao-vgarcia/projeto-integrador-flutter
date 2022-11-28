class BookModel {
  final String autor;
  final String titulo;
  final String? thumbnail;
  
  BookModel(this.autor, this.titulo, {this.thumbnail});

  @override
  String toString() {
    return '$titulo#$autor#${thumbnail ?? 'null'}';
  }
}