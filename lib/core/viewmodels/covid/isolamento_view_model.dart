import 'package:coronavirusmt/core/enum/viewstate.dart';
import 'package:coronavirusmt/core/locator.dart';
import 'package:coronavirusmt/core/models/covid_isolamento_historico.dart';
import 'package:coronavirusmt/core/models/key_value.dart';
import 'package:coronavirusmt/core/services/covid_service.dart';
import 'package:coronavirusmt/core/viewmodels/shared/base_view_model.dart';

class IsolamentoViewModel extends BaseViewModel {
  List<CovidIsolamentoHistorico> _historico;

  CovidIsolamentoHistorico get atual => _historico.first;

  List<KeyValue> get historicoPorDia {
    var result = _historico
        .map((caso) => KeyValue(key: caso.data, value: caso.casosTotais))
        .toList();

    result.sort((a, b) => a.key.compareTo(b.key));

    return result;
  }

  loadData() async {
    setState(ViewState.Busy);

    CovidService covidService = locator<CovidService>();

    _historico = await covidService.getCasosEmIsolamentoDeCovidHistorico();

    setState(ViewState.Idle);
  }
}
