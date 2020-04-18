import 'package:covidmt/core/enum/viewstate.dart';
import 'package:covidmt/core/locator.dart';
import 'package:covidmt/core/model/boletim_lista_model.dart';
import 'package:covidmt/core/services/boletim_lista_service.dart';
import 'package:covidmt/core/viewmodels/base_view_model.dart';

class BoletimListaViewModel extends BaseViewModel {
  BoletimListaService _boletimService = locator<BoletimListaService>();

  List<BoletimLista> get boletins => _boletimService.boletins;

  getBoletins() async {
    setState(ViewState.Busy);
    await _boletimService.getBoletins();
    setState(ViewState.Idle);
  }
}
