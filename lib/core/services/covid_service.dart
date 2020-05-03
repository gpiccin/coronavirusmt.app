import 'package:coronavirusmt/core/locator.dart';
import 'package:coronavirusmt/core/models/covid_cidades_casos_x_ativos.dart';
import 'package:coronavirusmt/core/models/covid_historico.dart';
import 'package:coronavirusmt/core/models/covid_por_cidade.dart';
import 'package:coronavirusmt/core/models/covid_por_faixa_etaria.dart';
import 'package:coronavirusmt/core/models/covid_por_tipo_de_leito.dart';
import 'package:coronavirusmt/core/services/api.dart';

class CovidService {
  Api _api = locator<Api>();

  Future<DateTime> getDataDoUltimoBoletim() => _api.getDataDoUltimoBoletim();

  Future<CovidCidadesCasosXAtivos> getCidadesCasosXAtivos(DateTime data) =>
      _api.getCidadesCasosXAtivos(data);

  Future<List<CovidHistorico>> getHistoricoDeCovid() =>
      _api.getHistoricoDeCovid();

  Future<List<CovidPorCidade>> getCovidPorCidade(
          DateTime data, int start, int limit) =>
      _api.getCovidPorCidade(data, start, limit);

  Future<List<CovidPorTipoDeLeito>> getCovidPorTipoDeLeito(DateTime data) =>
      _api.getCovidPorTipoDeLeito(data);

  Future<List<CovidPorFaixaEtaria>> getCovidPorFaixaEtaria(
      DateTime data) async {
    var covidPorFaixaEtaria = await _api.getCovidPorFaixaEtaria(data);

    covidPorFaixaEtaria
        .sort((a, b) => a.ordemDaFaixaEtaria.compareTo(b.ordemDaFaixaEtaria));

    return covidPorFaixaEtaria;
  }
}
