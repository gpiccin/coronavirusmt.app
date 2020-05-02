class CovidCidadesCasosXAtivos {
  final int cidadesComCasos;
  final int cidadesComCasosAtivos;
  final int cidadesComObitos;
  CovidCidadesCasosXAtivos(
      {this.cidadesComCasos,
      this.cidadesComCasosAtivos,
      this.cidadesComObitos});

  static CovidCidadesCasosXAtivos fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CovidCidadesCasosXAtivos(
      cidadesComCasos: map['casos']['aggregate']['count']?.toInt(),
      cidadesComCasosAtivos: map['ativos']['aggregate']['count']?.toInt(),
      cidadesComObitos: map['obitos']['aggregate']['count']?.toInt(),
    );
  }
}
