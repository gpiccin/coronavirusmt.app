class BoletimLista {
  DateTime data;
  String referencia;
  String link;

  BoletimLista({this.data, this.referencia, this.link});

  factory BoletimLista.fromJson(Map<String, dynamic> json) {
    return BoletimLista(
        data: DateTime.parse(json['data']),
        referencia: json['referencia'],
        link: json['link']);
  }
}
