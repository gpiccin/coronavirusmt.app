class BoletimModel {
  DateTime data;
  String referencia;
  String link;

  int sragCasos;
  int sragNovos;

  int covidCasos;
  int covidNovos;

  int covidHospitalizados;
  int covidNovosHospitalizados;
  double covidPercentualDeHospitalizados;

  int covidRecuperados;
  int covidNovosRecuperados;
  double covidPercentualDeRecuperados;

  int covidObitos;
  int covidNovosObitos;
  double covidPercentualDeObitos;

  int covidIsolamento;
  int covidNovosEmIsolamento;
  double covidPercentualEmIsolamento;

  BoletimModel(
      {this.data,
      this.referencia,
      this.link,
      this.sragCasos,
      this.sragNovos,
      this.covidCasos,
      this.covidNovos,
      this.covidHospitalizados,
      this.covidNovosHospitalizados,
      this.covidPercentualDeHospitalizados,
      this.covidRecuperados,
      this.covidNovosRecuperados,
      this.covidPercentualDeRecuperados,
      this.covidObitos,
      this.covidNovosObitos,
      this.covidPercentualDeObitos,
      this.covidIsolamento,
      this.covidNovosEmIsolamento,
      this.covidPercentualEmIsolamento});

  factory BoletimModel.fromJson(Map<String, dynamic> json) {
    return BoletimModel(
        data: DateTime.parse(json['data']),
        referencia: json['referencia'],
        link: json['link'],
        sragCasos: json['srag_casos_total'],
        sragNovos: json['srag_casos_novos'],
        covidCasos: json['covid_casos_total'],
        covidNovos: json['covid_casos_novos'],
        covidHospitalizados: json['covid_hospitalizados_total'],
        covidNovosHospitalizados: json['covid_hospitalizados_novos'],
        covidPercentualDeHospitalizados:
            json['covid_hospitalizados_percentual'].toDouble(),
        covidRecuperados: json['covid_recuperados_total'],
        covidNovosRecuperados: json['covid_recuperados_novos'],
        covidPercentualDeRecuperados:
            json['covid_recuperados_percentual'].toDouble(),
        covidObitos: json['covid_obitos_total'],
        covidNovosObitos: json['covid_obitos_novos'],
        covidPercentualDeObitos: json['covid_obitos_percentual'].toDouble(),
        covidIsolamento: json['covid_isolamento_total'],
        covidNovosEmIsolamento: json['covid_isolamento_novos'],
        covidPercentualEmIsolamento:
            json['covid_isolamento_percentual'].toDouble());
  }
}
