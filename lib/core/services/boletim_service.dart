import 'package:coronavirusmt/core/locator.dart';
import 'package:coronavirusmt/core/models/boletim_model.dart';
import 'package:coronavirusmt/core/services/api.dart';

class BoletimService {
  Api _api = locator<Api>();

  BoletimModel _boletim;
  BoletimModel get boletim => _boletim;

  getUltimoBoletim() async => _boletim = await _api.getUltimoBoletim();
}
