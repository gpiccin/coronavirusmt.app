import 'package:covidmt/core/locator.dart';
import 'package:covidmt/core/model/boletim_model.dart';
import 'package:covidmt/core/services/api.dart';

class BoletimService {
  Api _api = locator<Api>();

  BoletimModel _boletim;
  BoletimModel get boletim => _boletim;

  getUltimoBoletim() async => _boletim = await _api.getUltimoBoletim();
}
