import 'package:covidmt/core/locator.dart';
import 'package:covidmt/core/model/obito_model.dart';
import 'package:covidmt/core/service/api.dart';

class ObitosService {
  Api _api = locator<Api>();

  List<Obito> _obitos;
  List<Obito> get obitos => _obitos;

  getObitos() async => _obitos = await _api.getObitos();
}
