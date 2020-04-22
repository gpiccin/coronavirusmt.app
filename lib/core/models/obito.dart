class Obito {
  DateTime data;
  int idade;
  String cidade;
  String sexo;
  String comorbidade;
  String faixaEtaria;
  int ordemDaFaixaEtaria;

  Obito(
      {this.data,
      this.idade,
      this.cidade,
      this.sexo,
      this.comorbidade,
      this.faixaEtaria,
      this.ordemDaFaixaEtaria});

  factory Obito.fromJson(Map<String, dynamic> json) {
    return Obito(
        data: DateTime.parse(json['data']),
        idade: json['idade'],
        cidade: json['cidade']['nome'],
        sexo: json['sexo']['valor'],
        comorbidade: json['comorbidade'],
        faixaEtaria: json['faixaEtaria']['faixa'],
        ordemDaFaixaEtaria: json['faixaEtaria']['ordem']);
  }
}
