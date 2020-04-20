import 'package:coronavirusmt/core/locator.dart';
import 'package:coronavirusmt/core/models/obito_model.dart';
import 'package:coronavirusmt/core/services/api.dart';

class ObitosService {
  Api _api = locator<Api>();

  List<Obito> _obitos;
  List<Obito> get obitos => _obitos;

  getObitos() async => _obitos = await _api.getObitos();
}
