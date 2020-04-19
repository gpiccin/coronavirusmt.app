import 'package:covidmt/core/locator.dart';
import 'package:covidmt/core/models/covid_historico.dart';
import 'package:covidmt/core/models/covid_por_cidade.dart';
import 'package:covidmt/core/models/covid_por_faixa_etaria.dart';
import 'package:covidmt/core/services/api.dart';

class CovidService {
  Api _api = locator<Api>();

  List<CovidHistorico> _historico;
  List<CovidHistorico> get historico => _historico;

  List<CovidPorCidade> _covidPorCidade;
  List<CovidPorCidade> get covidPorCidade => _covidPorCidade;

  List<CovidPorFaixaEtaria> _covidPorFaixaEtaria;
  List<CovidPorFaixaEtaria> get covidPorFaixaEtaria => _covidPorFaixaEtaria;

  getHistoricoDeCovid() async => _historico = await _api.getHistoricoDeCovid();

  getCovidPorCidade(DateTime data) async =>
      _covidPorCidade = await _api.getCovidPorCidade(data);

  getCovidPorFaixaEtaria(DateTime data) async {
    _covidPorFaixaEtaria = await _api.getCovidPorFaixaEtaria(data);

    _covidPorFaixaEtaria
        .sort((a, b) => a.ordemDaFaixaEtaria.compareTo(b.ordemDaFaixaEtaria));
  }
}
