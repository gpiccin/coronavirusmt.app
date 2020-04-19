class CovidHistorico {
  DateTime data;
  int casos;
  int casosTotais;

  CovidHistorico({this.data, this.casos, this.casosTotais});

  factory CovidHistorico.fromJson(Map<String, dynamic> json) {
    return CovidHistorico(
        data: DateTime.parse(json['data']),
        casos: json['covid_casos_novos'],
        casosTotais: json['covid_casos_total']);
  }
}
