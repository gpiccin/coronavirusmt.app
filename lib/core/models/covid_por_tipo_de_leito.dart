class CovidPorTipoDeLeito {
  int casosTotais;
  String leito;
  String rede;

  CovidPorTipoDeLeito({this.casosTotais, this.leito, this.rede});

  factory CovidPorTipoDeLeito.fromJson(Map<String, dynamic> json) {
    return CovidPorTipoDeLeito(
        casosTotais: json['covid_casos_total'],
        leito: json['leito']['valor'],
        rede: json['rede']['valor']);
  }
}
