class CovidIsolamentoHistorico {
  DateTime data;
  int casos;
  int casosTotais;
  double percentual;

  CovidIsolamentoHistorico(
      {this.data, this.casos, this.casosTotais, this.percentual});

  factory CovidIsolamentoHistorico.fromJson(Map<String, dynamic> json) {
    return CovidIsolamentoHistorico(
        data: DateTime.parse(json['data']),
        casos: json['covid_isolamento_novos'],
        casosTotais: json['covid_isolamento_total'],
        percentual: json['covid_isolamento_percentual']?.toDouble());
  }
}
