import 'package:coronavirusmt/core/locator.dart';
import 'package:coronavirusmt/core/models/srag_historico.dart';
import 'package:coronavirusmt/core/services/api.dart';

class SragService {
  Api _api = locator<Api>();

  List<SragHistorico> _historico;
  List<SragHistorico> get historico => _historico;

  getHistoricoDeSrag() async => _historico = await _api.getHistoricoDeSrag();
}
