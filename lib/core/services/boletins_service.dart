import 'package:coronavirusmt/core/locator.dart';
import 'package:coronavirusmt/core/models/boletim_lista.dart';
import 'package:coronavirusmt/core/services/api.dart';

class BoletinsService {
  Api _api = locator<Api>();

  Future<List<BoletimLista>> getBoletins(int start, int limit) =>
      _api.getBoletins(start, limit);
}
