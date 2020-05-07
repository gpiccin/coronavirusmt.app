import 'package:coronavirusmt/core/enum/viewstate.dart';
import 'package:coronavirusmt/core/locator.dart';
import 'package:coronavirusmt/core/models/covid_recuperado_historico.dart';
import 'package:coronavirusmt/core/models/key_value.dart';
import 'package:coronavirusmt/core/services/covid_service.dart';
import 'package:coronavirusmt/core/viewmodels/shared/base_view_model.dart';

class RecuperadosViewModel extends BaseViewModel {
  List<CovidRecuperadoHistorico> _historico;

  CovidRecuperadoHistorico get atual => _historico.first;

  List<KeyValue> get historicoPorDia {
    return _historico
        .map((caso) => KeyValue(key: caso.data, value: caso.casosTotais))
        .toList();
  }

  loadData() async {
    setState(ViewState.Busy);

    CovidService covidService = locator<CovidService>();

    _historico = await covidService.getCasosRecuperadosDeCovidHistorico();

    setState(ViewState.Idle);
  }
}
