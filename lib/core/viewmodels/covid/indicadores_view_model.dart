import 'package:coronavirusmt/core/enum/viewstate.dart';
import 'package:coronavirusmt/core/locator.dart';
import 'package:coronavirusmt/core/models/boletim_model.dart';
import 'package:coronavirusmt/core/services/boletim_service.dart';
import 'package:coronavirusmt/core/viewmodels/base_view_model.dart';

class IndicadoresViewModel extends BaseViewModel {
  BoletimService _boletimService = locator<BoletimService>();

  BoletimModel get boletim => _boletimService.boletim;

  Future getBoletim() async {
    setState(ViewState.Busy);
    await _boletimService.getUltimoBoletim();
    setState(ViewState.Idle);
  }
}
