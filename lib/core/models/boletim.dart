class Boletim {
  DateTime data;
  String referencia;

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

  double covidMediaDeIdade;

  List<double> casos;
  List<double> hospitalizados;
  List<double> obitos;
  List<double> isolados;
  List<double> recuperados;
  List<double> srags;

  Boletim(
      {this.data,
      this.referencia,
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
      this.covidPercentualEmIsolamento,
      this.covidMediaDeIdade,
      this.casos,
      this.hospitalizados,
      this.obitos,
      this.isolados,
      this.recuperados,
      this.srags});

  static List<double> _covertToArray(Map<String, dynamic> json, String field) {
    return json[field].map<double>((o) => (o['v'] as int).toDouble()).toList();
  }

  factory Boletim.fromJson(Map<String, dynamic> json) {
    var boletim = json['boletim'][0];

    return Boletim(
      data: DateTime.parse(boletim['data']),
      referencia: boletim['referencia'],
      sragCasos: boletim['srag_casos_total'],
      sragNovos: boletim['srag_casos_novos'],
      covidCasos: boletim['covid_casos_total'],
      covidNovos: boletim['covid_casos_novos'],
      covidHospitalizados: boletim['covid_hospitalizados_total'],
      covidNovosHospitalizados: boletim['covid_hospitalizados_novos'],
      covidPercentualDeHospitalizados:
          boletim['covid_hospitalizados_percentual'].toDouble(),
      covidRecuperados: boletim['covid_recuperados_total'],
      covidNovosRecuperados: boletim['covid_recuperados_novos'],
      covidPercentualDeRecuperados:
          boletim['covid_recuperados_percentual'].toDouble(),
      covidObitos: boletim['covid_obitos_total'],
      covidNovosObitos: boletim['covid_obitos_novos'],
      covidPercentualDeObitos: boletim['covid_obitos_percentual'].toDouble(),
      covidIsolamento: boletim['covid_isolamento_total'],
      covidNovosEmIsolamento: boletim['covid_isolamento_novos'],
      covidPercentualEmIsolamento:
          boletim['covid_isolamento_percentual'].toDouble(),
      covidMediaDeIdade: boletim['covid_media_de_idade'].toDouble(),
      casos: _covertToArray(json, 'casos'),
      hospitalizados: _covertToArray(json, 'hospitalizados'),
      obitos: _covertToArray(json, 'obitos'),
      isolados: _covertToArray(json, 'isolados'),
      recuperados: _covertToArray(json, 'recuperados'),
      srags: _covertToArray(json, 'srags'),
    );
  }
}
