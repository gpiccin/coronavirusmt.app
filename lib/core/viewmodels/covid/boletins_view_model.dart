import 'package:coronavirusmt/core/enum/viewstate.dart';
import 'package:coronavirusmt/core/locator.dart';
import 'package:coronavirusmt/core/models/boletim_lista.dart';
import 'package:coronavirusmt/core/services/boletins_service.dart';
import 'package:coronavirusmt/core/viewmodels/shared/base_view_model.dart';

class BoletinsViewModel extends BaseViewModel {
  BoletinsService _boletimService = locator<BoletinsService>();

  List<BoletimLista> get boletins => _boletimService.boletins;

  getBoletins() async {
    setState(ViewState.Busy);
    await _boletimService.getBoletins();
    setState(ViewState.Idle);
  }
}
