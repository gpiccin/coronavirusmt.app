import 'package:coronavirusmt/core/locator.dart';
import 'package:coronavirusmt/core/models/boletim_lista.dart';
import 'package:coronavirusmt/core/services/api.dart';

class BoletinsService {
  Api _api = locator<Api>();

  List<BoletimLista> _boletins;
  List<BoletimLista> get boletins => _boletins;

  getBoletins() async => _boletins = await _api.getBoletins();
}
