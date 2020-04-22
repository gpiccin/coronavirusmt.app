import 'package:coronavirusmt/core/locator.dart';
import 'package:coronavirusmt/core/models/boletim.dart';
import 'package:coronavirusmt/core/services/api.dart';

class BoletimService {
  Api _api = locator<Api>();

  Boletim _boletim;
  Boletim get boletim => _boletim;

  getUltimoBoletim() async => _boletim = await _api.getUltimoBoletim();
}
