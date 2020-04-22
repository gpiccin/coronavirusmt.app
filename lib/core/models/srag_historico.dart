class SragHistorico {
  DateTime data;
  int covidCasosTotais;
  int casosTotais;
  int casos;

  int get covidMaisSrag => (covidCasosTotais + casosTotais);
  double get percentualEmRelacaoAoCovid =>
      (casosTotais / covidCasosTotais) * 100;

  SragHistorico(
      {this.data, this.casosTotais, this.casos, this.covidCasosTotais});

  factory SragHistorico.fromJson(Map<String, dynamic> json) {
    return SragHistorico(
        data: DateTime.parse(json['data']),
        casos: json['srag_casos_novos'],
        casosTotais: json['srag_casos_total'],
        covidCasosTotais: json['covid_casos_total']);
  }
}
