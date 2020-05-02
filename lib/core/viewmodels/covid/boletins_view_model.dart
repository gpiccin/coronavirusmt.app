import 'package:coronavirusmt/core/locator.dart';
import 'package:coronavirusmt/core/services/boletins_service.dart';
import 'package:coronavirusmt/core/viewmodels/shared/base_view_model.dart';

class BoletinsViewModel extends BaseViewModel {
  BoletinsService _boletimService = locator<BoletinsService>();

  getBoletins(int pageSize, int pageIndex) {
    return _boletimService.getBoletins(pageSize * pageIndex, pageSize);
  }
}
