import 'package:coronavirusmt/core/enum/viewstate.dart';
import 'package:coronavirusmt/core/locator.dart';
import 'package:coronavirusmt/core/models/boletim.dart';
import 'package:coronavirusmt/core/services/boletim_service.dart';
import 'package:coronavirusmt/core/viewmodels/covid/data_boletim_view_model.dart';

import 'package:coronavirusmt/core/viewmodels/shared/base_view_model.dart';

class IndicadoresViewModel extends BaseViewModel {
  Boletim _boletim;

  Boletim get boletim => _boletim;

  Future loadData() async {
    setState(ViewState.Busy);

    BoletimService boletimService = locator<BoletimService>();
    _boletim = await boletimService.getUltimoBoletim();

    var vw = locator<DataBoletimViewModel>();
    vw.setDataDoUltimoBoletim(_boletim.data);

    setState(ViewState.Idle);
  }
}
