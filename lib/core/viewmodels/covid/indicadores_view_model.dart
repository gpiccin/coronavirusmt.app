import 'package:coronavirusmt/core/enum/viewstate.dart';
import 'package:coronavirusmt/core/locator.dart';
import 'package:coronavirusmt/core/models/boletim.dart';
import 'package:coronavirusmt/core/services/boletim_service.dart';
import 'package:coronavirusmt/core/viewmodels/shared/base_view_model.dart';

class IndicadoresViewModel extends BaseViewModel {
  BoletimService _boletimService = locator<BoletimService>();

  Boletim get boletim => _boletimService.boletim;

  Future loadData() async {
    setState(ViewState.Busy);
    await _boletimService.getUltimoBoletim();
    setState(ViewState.Idle);
  }
}
