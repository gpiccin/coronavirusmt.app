class CovidPorCidade {
  int casosTotais;
  String cidade;

  CovidPorCidade({this.casosTotais, this.cidade});

  factory CovidPorCidade.fromJson(Map<String, dynamic> json) {
    return CovidPorCidade(
        casosTotais: json['covid_casos_total'], cidade: json['cidade']['nome']);
  }
}
