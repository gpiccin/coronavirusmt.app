class CovidConfirmadoHistorico {
  DateTime data;
  int casos;
  int casosTotais;
  double mediaDeIdade;

  CovidConfirmadoHistorico(
      {this.data, this.casos, this.casosTotais, this.mediaDeIdade});

  factory CovidConfirmadoHistorico.fromJson(Map<String, dynamic> json) {
    return CovidConfirmadoHistorico(
        data: DateTime.parse(json['data']),
        casos: json['covid_casos_novos'],
        casosTotais: json['covid_casos_total'],
        mediaDeIdade: json['covid_media_de_idade']);
  }
}
