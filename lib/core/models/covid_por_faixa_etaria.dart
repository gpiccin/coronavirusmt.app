class CovidPorFaixaEtaria {
  int casosTotais;
  String faixa;
  int ordemDaFaixaEtaria;

  CovidPorFaixaEtaria({this.casosTotais, this.faixa, this.ordemDaFaixaEtaria});

  factory CovidPorFaixaEtaria.fromJson(Map<String, dynamic> json) {
    return CovidPorFaixaEtaria(
        casosTotais: json['covid_casos_total'],
        faixa: json['faixa_etaria']['faixa'],
        ordemDaFaixaEtaria: json['faixa_etaria']['ordem']);
  }
}
