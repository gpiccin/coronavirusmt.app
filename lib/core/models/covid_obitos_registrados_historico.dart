class CovidObitosRegistradosHitorico {
  DateTime data;
  int obitos;

  CovidObitosRegistradosHitorico({this.data, this.obitos});

  factory CovidObitosRegistradosHitorico.fromJson(Map<String, dynamic> json) {
    return CovidObitosRegistradosHitorico(
        data: DateTime.parse(json['data']),
        obitos: json['covid_obitos_novos'].toInt());
  }
}
