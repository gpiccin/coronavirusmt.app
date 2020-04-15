class BoletimModel {
  DateTime data;
  String referencia;
  int sragCasos;
  int covidCasos;
  int covidHospitalizados;
  int covidRecuperados;
  int covidObitos;

  BoletimModel(
      {this.data,
      this.referencia,
      this.sragCasos,
      this.covidCasos,
      this.covidHospitalizados,
      this.covidRecuperados,
      this.covidObitos});

  factory BoletimModel.fromJson(Map<String, dynamic> json) {
    return BoletimModel(
      data: DateTime.parse(json['data']),
      referencia: json['referencia'],
      sragCasos: json['srag_casos_total'],
      covidCasos: json['covid_casos_total'],
      covidHospitalizados: json['covid_hospitalizados_total'],
      covidRecuperados: json['covid_recuperados_total'],
      covidObitos: json['covid_obitos_total'],
    );
  }
}
