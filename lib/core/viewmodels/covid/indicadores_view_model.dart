import 'package:covidmt/core/enum/viewstate.dart';
import 'package:covidmt/core/locator.dart';
import 'package:covidmt/core/models/boletim_model.dart';
import 'package:covidmt/core/services/boletim_service.dart';
import 'package:covidmt/core/viewmodels/base_view_model.dart';

class IndicadoresViewModel extends BaseViewModel {
  BoletimService _boletimService = locator<BoletimService>();

  BoletimModel get boletim => _boletimService.boletim;

  Future getBoletim() async {
    setState(ViewState.Busy);
    await _boletimService.getUltimoBoletim();
    setState(ViewState.Idle);
  }
}
