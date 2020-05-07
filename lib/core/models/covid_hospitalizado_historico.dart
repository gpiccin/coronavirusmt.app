class CovidHospitalizadoHistorico {
  DateTime data;
  int casos;
  int casosTotais;
  double percentual;

  CovidHospitalizadoHistorico(
      {this.data, this.casos, this.casosTotais, this.percentual});

  factory CovidHospitalizadoHistorico.fromJson(Map<String, dynamic> json) {
    return CovidHospitalizadoHistorico(
        data: DateTime.parse(json['data']),
        casos: json['covid_hospitalizados_novos'],
        casosTotais: json['covid_hospitalizados_total'],
        percentual: json['covid_hospitalizados_percentual']?.toDouble());
  }
}
