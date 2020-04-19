import 'package:covidmt/core/locator.dart';
import 'package:covidmt/core/model/boletim_lista_model.dart';
import 'package:covidmt/core/service/api.dart';

class BoletinsService {
  Api _api = locator<Api>();

  List<BoletimLista> _boletins;
  List<BoletimLista> get boletins => _boletins;

  getBoletins() async => _boletins = await _api.getBoletins();
}
