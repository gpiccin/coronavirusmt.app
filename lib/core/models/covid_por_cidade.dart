class CovidPorCidade {
  int covidTotal;
  int total;
  int ativos;
  int recuperados;
  int obitos;
  String cidade;

  double get percentualDaCidade => (total / covidTotal) * 100;
  double get percentualDeCasosAtivos => (ativos / total) * 100;
  double get percentualDeRecuperados => (recuperados / total) * 100;
  double get percentualDeObitos => (obitos / total) * 100;

  CovidPorCidade(
      {this.total,
      this.ativos,
      this.obitos,
      this.recuperados,
      this.cidade,
      this.covidTotal});

  factory CovidPorCidade.fromJson(Map<String, dynamic> json, int covidTotal) {
    return CovidPorCidade(
        total: json['covid_casos_total'],
        ativos: json['covid_casos'],
        recuperados: json['covid_recuperados'],
        obitos: json['covid_obitos'],
        cidade: json['cidade']['nome'],
        covidTotal: covidTotal);
  }
}
