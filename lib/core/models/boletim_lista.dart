class BoletimLista {
  DateTime data;
  String referencia;
  String link;
  int casosTotais;
  int casosNovos;

  BoletimLista(
      {this.data,
      this.referencia,
      this.link,
      this.casosTotais,
      this.casosNovos});

  factory BoletimLista.fromJson(Map<String, dynamic> json) {
    return BoletimLista(
        data: DateTime.parse(json['data']),
        referencia: json['referencia'],
        link: json['link'],
        casosTotais: json['covid_casos_total'],
        casosNovos: json['covid_casos_novos']);
  }
}
