class Noticia {
  final String titulo;
  final String descricao;
  final String url;
  final String imagemUrl;
  final String fonteDaNoticia;
  final DateTime data;

  Noticia(
      {this.titulo,
      this.descricao,
      this.url,
      this.imagemUrl,
      this.fonteDaNoticia,
      this.data});

  static Noticia fromJson(Map<String, dynamic> map) {
    if (map == null) return null;

    return Noticia(
      titulo: map['titulo'],
      descricao: map['descricao'],
      url: map['url'],
      imagemUrl: map['imagem_url'],
      fonteDaNoticia: map['fonte_de_noticia']['nome'],
      data: DateTime.parse(map['data']),
    );
  }
}
