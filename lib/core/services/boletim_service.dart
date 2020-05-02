import 'package:coronavirusmt/core/locator.dart';
import 'package:coronavirusmt/core/models/boletim.dart';
import 'package:coronavirusmt/core/services/api.dart';

class BoletimService {
  Api _api = locator<Api>();

  Future<Boletim> getUltimoBoletim() => _api.getUltimoBoletim();
}
