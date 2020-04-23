class CovidHistorico {
  DateTime data;
  int casos;
  int casosTotais;
  double mediaDeIdade;

  CovidHistorico({this.data, this.casos, this.casosTotais, this.mediaDeIdade});

  factory CovidHistorico.fromJson(Map<String, dynamic> json) {
    return CovidHistorico(
        data: DateTime.parse(json['data']),
        casos: json['covid_casos_novos'],
        casosTotais: json['covid_casos_total'],
        mediaDeIdade: json['covid_media_de_idade']);
  }
}
