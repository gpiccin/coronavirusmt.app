import 'package:covidmt/core/enum/viewstate.dart';
import 'package:covidmt/core/locator.dart';
import 'package:covidmt/core/models/covid_historico.dart';
import 'package:covidmt/core/models/key_value.dart';
import 'package:covidmt/core/services/covid_service.dart';
import 'package:covidmt/core/viewmodels/base_view_model.dart';

class ConfirmadosViewModel extends BaseViewModel {
  CovidService _covidService = locator<CovidService>();

  List<CovidHistorico> get historico => _covidService.historico;
  CovidHistorico get atual => _covidService.historico.first;

  List<KeyValue> get historicoPorDia {
    return historico
        .map((caso) => KeyValue(key: caso.data, value: caso.casosTotais))
        .toList();
  }

  getData() async {
    setState(ViewState.Busy);
    await _covidService.getHistoricoDeCovid();
    setState(ViewState.Idle);
  }
}
