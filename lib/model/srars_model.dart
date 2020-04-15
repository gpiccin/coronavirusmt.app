class SrasModel {
  String data;
  int sragCasosTotal;
  int sragCasosNovos;

  SrasModel({this.data, this.sragCasosTotal, this.sragCasosNovos});

  SrasModel.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    sragCasosTotal = json['srag_casos_total'];
    sragCasosNovos = json['srag_casos_novos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['srag_casos_total'] = this.sragCasosTotal;
    data['srag_casos_novos'] = this.sragCasosNovos;
    return data;
  }
}
