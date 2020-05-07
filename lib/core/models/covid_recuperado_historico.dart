class CovidRecuperadoHistorico {
  DateTime data;
  int casos;
  int casosTotais;
  double percentual;

  CovidRecuperadoHistorico(
      {this.data, this.casos, this.casosTotais, this.percentual});

  factory CovidRecuperadoHistorico.fromJson(Map<String, dynamic> json) {
    return CovidRecuperadoHistorico(
        data: DateTime.parse(json['data']),
        casos: json['covid_recuperados_novos'],
        casosTotais: json['covid_recuperados_total'],
        percentual: json['covid_recuperados_percentual']?.toDouble());
  }
}
