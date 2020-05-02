class CovidPorCidade {
  int casosTotais;
  int casos;
  int recuperados;
  int obitos;
  String cidade;

  CovidPorCidade(
      {this.casosTotais,
      this.casos,
      this.obitos,
      this.recuperados,
      this.cidade});

  factory CovidPorCidade.fromJson(Map<String, dynamic> json) {
    return CovidPorCidade(
        casosTotais: json['covid_casos_total'],
        casos: json['covid_casos'],
        recuperados: json['covid_recuperados'],
        obitos: json['covid_obitos'],
        cidade: json['cidade']['nome']);
  }
}
