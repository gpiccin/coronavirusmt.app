import 'package:coronavirusmt/core/locator.dart';
import 'package:coronavirusmt/core/models/covid_historico.dart';
import 'package:coronavirusmt/core/models/covid_por_cidade.dart';
import 'package:coronavirusmt/core/models/covid_por_faixa_etaria.dart';
import 'package:coronavirusmt/core/models/covid_por_tipo_de_leito.dart';
import 'package:coronavirusmt/core/services/api.dart';

class CovidService {
  Api _api = locator<Api>();

  List<CovidHistorico> _historico;
  List<CovidHistorico> get historico => _historico;

  List<CovidPorCidade> _covidPorCidade;
  List<CovidPorCidade> get covidPorCidade => _covidPorCidade;

  List<CovidPorFaixaEtaria> _covidPorFaixaEtaria;
  List<CovidPorFaixaEtaria> get covidPorFaixaEtaria => _covidPorFaixaEtaria;

  List<CovidPorTipoDeLeito> _covidPorTipoDeLeito;
  List<CovidPorTipoDeLeito> get covidPorTipoDeLeito => _covidPorTipoDeLeito;

  getHistoricoDeCovid() async => _historico = await _api.getHistoricoDeCovid();

  getCovidPorCidade(DateTime data) async =>
      _covidPorCidade = await _api.getCovidPorCidade(data);

  getCovidPorFaixaEtaria(DateTime data) async {
    _covidPorFaixaEtaria = await _api.getCovidPorFaixaEtaria(data);

    _covidPorFaixaEtaria
        .sort((a, b) => a.ordemDaFaixaEtaria.compareTo(b.ordemDaFaixaEtaria));
  }

  getCovidPorTipoDeLeito(DateTime data) async =>
      _covidPorTipoDeLeito = await _api.getCovidPorTipoDeLeito(data);
}
