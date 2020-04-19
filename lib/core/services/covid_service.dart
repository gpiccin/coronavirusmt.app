import 'package:covidmt/core/locator.dart';
import 'package:covidmt/core/models/covid_historico.dart';
import 'package:covidmt/core/services/api.dart';

class CovidService {
  Api _api = locator<Api>();

  List<CovidHistorico> _historico;
  List<CovidHistorico> get historico => _historico;

  getHistoricoDeCovid() async => _historico = await _api.getHistoricoDeCovid();
}
