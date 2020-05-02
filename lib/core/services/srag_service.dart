import 'package:coronavirusmt/core/locator.dart';
import 'package:coronavirusmt/core/models/srag_historico.dart';
import 'package:coronavirusmt/core/services/api.dart';

class SragService {
  Api _api = locator<Api>();

  Future<List<SragHistorico>> getHistoricoDeSrag() => _api.getHistoricoDeSrag();
}
