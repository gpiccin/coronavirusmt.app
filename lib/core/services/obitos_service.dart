import 'package:coronavirusmt/core/locator.dart';
import 'package:coronavirusmt/core/models/covid_obitos_registrados_historico.dart';
import 'package:coronavirusmt/core/models/obito.dart';
import 'package:coronavirusmt/core/services/api.dart';

class ObitosService {
  Api _api = locator<Api>();

  Future<List<Obito>> getObitos() => _api.getObitos();
  Future<List<CovidObitosRegistradosHitorico>> getObitosRegistradosPorDia() =>
      _api.getObitosRegistradosPorDia();
}
