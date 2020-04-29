import 'package:coronavirusmt/core/locator.dart';
import 'package:coronavirusmt/core/services/api.dart';

class NoticiasService {
  Api _api = locator<Api>();

  getNoticias(int start, int limit) {
    return _api.getNoticias(start, limit);
  }
}
