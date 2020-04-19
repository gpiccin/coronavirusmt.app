import 'package:covidmt/core/enum/viewstate.dart';
import 'package:covidmt/core/locator.dart';
import 'package:covidmt/core/models/boletim_lista.dart';
import 'package:covidmt/core/services/boletins_service.dart';
import 'package:covidmt/core/viewmodels/base_view_model.dart';

class BoletinsViewModel extends BaseViewModel {
  BoletinsService _boletimService = locator<BoletinsService>();

  List<BoletimLista> get boletins => _boletimService.boletins;

  getBoletins() async {
    setState(ViewState.Busy);
    await _boletimService.getBoletins();
    setState(ViewState.Idle);
  }
}
